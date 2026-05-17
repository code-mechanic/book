\newpage

# Interrupts — The Hardware's Voice

> *In Chapter 1 the machine booted and ran a single loop. It worked — until we needed two things to happen at once. The hardware solves this with a mechanism that has existed since the 1950s: the interrupt. Understanding it deeply is not optional. Every RTOS is built on top of it.*


## The Problem With the Super-Loop

End of Chapter 1 left us with this pattern:

```c
int main(void)
{
    while (1)
    {
        blink_led();        /* 500 ms blocking delay inside */
        read_uart();        /* needs to run every 1 ms      */
        update_lcd();       /* needs to run every 100 ms    */
    }
}
```

The loop is **sequential and blocking**. While `blink_led()` sits in its half-second delay, `read_uart()` cannot run. UART bytes arrive at 115200 baud — one byte every ~87 µs. The super-loop misses them all.

This is the **timing problem**: a single thread of execution cannot be in two places simultaneously.

![Timeline of Superloop](rtos/diagrams/ch2_superloop_timeline.png){ width=50% }

The hardware's answer to this is the **interrupt**: a signal that tells the CPU "stop what you are doing, handle me, then come back."

## What is an Interrupt?

An interrupt is a hardware signal that causes the CPU to **suspend its current execution**, save its state, and jump to a special function called an **Interrupt Service Routine (ISR)**. When the ISR returns, the CPU restores its state and resumes exactly where it left off.

![ISR execution flow](rtos/diagrams/ch2_isr_flow.png){ width=50% }

**Key points:**

1. The CPU does NOT finish the current instruction block — it interrupts it
2. The return address is saved so execution resumes at exactly the right spot
3. The ISR must be short — the longer it runs, the more main() is delayed

This mechanism is implemented entirely in hardware — the CPU itself detects the interrupt signal, pushes a stack frame, and vectors to the ISR address from the vector table.

## The ARM Cortex-M Interrupt Hardware

On ARM Cortex-M, interrupts are managed by the **Nested Vectored Interrupt Controller (NVIC)**. It is the traffic cop between peripheral signals and the CPU.

![Interrupt controller](rtos/diagrams/ch2_interrupt_controller.png){ width=75% }

**Priority:** Lower number = higher priority.

On Cortex-M4 with 4 priority bits, valid priorities are 0 (highest) through 15 (lowest). The RTOS reserves the lowest priorities for its own PendSV and SysTick handlers.


## What the CPU Does When an Interrupt Fires

When an interrupt arrives and its priority is higher than the currently executing code, the CPU performs an **automatic context save** (called "exception entry") in hardware:

![ARM Cortex-M Exception Entry](rtos/diagrams/ch2_exception_entry.png){ width=75% }

- After ISR stack frame push, CPU:
    1. Sets PC = ISR address  (from vector table)
    2. Sets LR = EXC_RETURN  (magic value to trigger unstacking on return)
    3. Executes ISR

- On ISR return (BX LR with EXC_RETURN value):
    1. Hardware pops R0–R3, R12, LR, PC, xPSR from stack
    2. SP restored to original value
    3. CPU resumes interrupted instruction stream


This hardware-assisted save/restore is fast (~12 cycles on Cortex-M4) and is what makes ISRs practical for tight-timing applications. The RTOS context switch mechanism.

## The Foreground / Background Model

Once interrupts are in play, the system has two levels of execution:

![Two level Model](rtos/diagrams/ch2_two_level_model.png){ width=75% }

The ISR's job is simple: **detect the event, record it, return**. The heavy processing happens in the background where blocking is safe.

## Interrupt Nesting

On ARM Cortex-M, a higher-priority interrupt can preempt a lower-priority ISR that is already running. This is **interrupt nesting**.

![Nested Interrupt](rtos/diagrams/ch2_nested_interrupt.png)

## Critical Sections — Protecting Shared Data

The ISR and the background loop share data. Most of the time this is safe, but some operations are **non-atomic** — they require multiple instructions to complete, and an interrupt in the middle leaves data in an inconsistent state.


The fix is a **critical section**: a region of code that cannot be interrupted.

```c
/*
 * critical_section.c — Protecting shared state on ARM Cortex-M
 */

#include <stdint.h>
#include "cmsis_compiler.h"   /* __get_PRIMASK, __set_PRIMASK, etc. */

/*
 * Enter critical section: disable all maskable interrupts.
 * Returns the previous PRIMASK value so it can be restored.
 *
 * PRIMASK = 1 -> all IRQs (except NMI and HardFault) are masked.
 */
static inline uint32_t critical_enter(void)
{
    uint32_t primask = __get_PRIMASK();
    __disable_irq();           /* sets PRIMASK = 1  (CPSID I) */
    __DSB();                   /* data sync barrier            */
    __ISB();                   /* instruction sync barrier     */
    return primask;
}

/*
 * Exit critical section: restore interrupts to previous state.
 * Using the saved PRIMASK rather than unconditionally enabling
 * handles nested critical sections correctly.
 */
static inline void critical_exit(uint32_t primask)
{
    __set_PRIMASK(primask);    /* restore saved state           */
}

/* -- Usage example -- */

static volatile uint32_t shared_counter = 0;

void increment_counter_safely(void)
{
    uint32_t saved = critical_enter();
    {
        shared_counter++;          /* now atomic — ISR cannot fire */
    }
    critical_exit(saved);
}

/*
 * FreeRTOS equivalent:
 *   taskENTER_CRITICAL();
 *   shared_counter++;
 *   taskEXIT_CRITICAL();
 *
 * FreeRTOS uses BASEPRI (not PRIMASK) to mask only IRQs at or below
 * configMAX_SYSCALL_INTERRUPT_PRIORITY, leaving high-priority ISRs
 * running.
 */
```

### Rules for Critical Sections

- DO:
  - Keep them as SHORT as possible (nanoseconds to low microseconds)
  - Protect any multi-instruction read-modify-write on shared data
  - Save and restore PRIMASK (not unconditional enable/disable)
  - Use for flag polling between ISR and task

- DO NOT:
  - Call any blocking function inside (no sleep, no mutex wait)
  - Call printf, malloc, or any function with locks inside
  - Nest them without saving state (PRIMASK save/restore handles this)
  - Assume the compiler will make your operation atomic (even a++ is not atomic without the critical section)

## The volatile Keyword Revisited

Every variable shared between an ISR and background code **must** be declared `volatile`. Without it, the compiler is free to optimise the read away:

```c
/*
 * volatile_demo.c — Why volatile is not optional for ISR-shared data
 */

/* -- WRONG — compiler will optimise the loop away -- */
static uint8_t flag_wrong = 0;

void wait_for_event_WRONG(void)
{
    /* Compiler sees: flag_wrong is never written in this function.
     * Optimises this to:  if (flag_wrong == 0) { while(1); }
     * The ISR sets flag_wrong = 1, but the CPU reads a cached register.
     * This loop NEVER exits even when the ISR fires. */
    while (flag_wrong == 0)
    {
        /* spin */
    }
}

/* -- CORRECT — volatile forces a memory read every iteration -- */
static volatile uint8_t flag_correct = 0;

void wait_for_event_CORRECT(void)
{
    /* Compiler cannot cache this — must read from memory each iteration.
     * When ISR sets flag_correct = 1, this loop sees it immediately. */
    while (flag_correct == 0)
    {
        /* spin */
    }
}

/* ISR that sets the flag */
void EXTI0_IRQHandler(void)
{
    flag_correct = 1;    /* volatile write — compiler generates STR instruction */

    /* Clear the EXTI pending bit (required or IRQ will fire again) */
    EXTI->PR = (1u << 0);
}
```

## SysTick — The Heartbeat Timer

One special interrupt deserves extra attention: **SysTick**. It is a 24-bit countdown timer built into the Cortex-M core itself (not a peripheral — it lives in the system control space at 0xE000E000). It fires at a regular interval and is the timekeeping foundation of every RTOS.

**SysTick Operation**

- SysTick counts DOWN from RELOAD to 0, then fires, then reloads.
- $$RELOAD value = \frac{CPU_FREQ}{TICK_RATE_HZ} - 1$$
- Example: 168 MHz CPU, 1000 Hz tick (1 ms period):
- $$RELOAD = \frac{168000000}{1000} - 1 = 167999$$

**Timeline**
```
  Count:  167999 ----------------------> 0 | 167999 -------------> 0 |
                                           |                         |
  SysTick_Handler fires:                   ^                         ^
                                           |                         |
  Period:  <--------- 1 ms --------------->|<--------- 1 ms -------->|
```

- In a bare-metal system, SysTick_Handler increments a tick counter:
```c
    volatile uint32_t system_tick_ms = 0;
    void SysTick_Handler(void) { system_tick_ms++; }
```

- In an RTOS, SysTick_Handler calls the scheduler — it is the heartbeat that drives task switching.

## Putting It Together: UART + SysTick Without an RTOS

Here is the complete bare-metal application combining everything from this chapter. It echoes received UART bytes while blinking an LED at exactly 1 Hz — both happening "simultaneously."

```c
/*
 * main.c — Foreground/background application with SysTick + UART ISR
 *
 * Two independent activities with no RTOS:
 *   1. LED blinks every 500 ms  (driven by SysTick tick counter)
 *   2. UART echoes bytes        (driven by UART RXNE interrupt)
 *
 * This works for 2 activities. For 10 activities, the code becomes
 * an unmanageable nest of flags and timers — that is what an RTOS solves.
 */

#include <stdint.h>
#include <stdbool.h>

extern void     systick_init(uint32_t);
extern uint32_t get_tick_ms(void);
extern void     uart1_init(uint32_t);
extern void     nvic_uart1_enable(void);
extern bool     uart1_read_byte(uint8_t *);
extern void     uart1_send_byte(uint8_t);
extern void     led_init(void);
extern void     led_toggle(void);

int main(void)
{
    /* Hardware initialisation */
    systick_init(84000000u);
    uart1_init(84000000u);
    nvic_uart1_enable();
    led_init();

    __enable_irq();   /* global interrupt enable */

    uint32_t last_blink_ms = 0;
    uint8_t  byte;

    while (1)
    {
        /* -- Activity 1: LED toggle every 500 ms ----------------------
         * Non-blocking: check elapsed time, do not spin.
         * The ISRs can fire at any time while we are in this loop. */
        uint32_t now = get_tick_ms();
        if ((now - last_blink_ms) >= 500u)
        {
            led_toggle();
            last_blink_ms = now;
        }

        /* -- Activity 2: UART echo ------------------------------------
         * Drain whatever bytes the UART ISR has deposited. */
        while (uart1_read_byte(&byte))
        {
            uart1_send_byte(byte);
        }

        /* -- Future activities would be added here --------------------
         * Activity 3: update LCD every 100 ms
         * Activity 4: read ADC every 10 ms
         * Activity 5: communicate over SPI
         * ...
         * This pattern does not scale. Every new activity adds more
         * timing logic. Activities with blocking I/O stall others.
         */
    }
}
```

## The Unsolved Tension

The foreground/background model works — for a small number of activities. But it has hard limits:

**Limits of the Foreground/Background Model**

- **Problem 1: No isolation:** All activities share one stack. A bug in Activity 3 corrupts Activity 1's local variables. There is no protection boundary.

- **Problem 2: No priority between background activities:** Activity 1 (LED, low urgency) and Activity 4 (ADC, high urgency) are equals in the while(1) loop. You cannot say "ADC always runs before LED."

- **Problem 3: Blocking anywhere stalls everything:** If Activity 3 must wait 10 ms for an SPI transaction to finish, all other background activities are frozen for 10 ms.

- **Problem 4: Timing accuracy degrades with more activities:** Each activity's "run every N ms" check gets less accurate as more activities are added, because each one steals time from the others.

- **Problem 5: State machine complexity explodes:** Each activity needs its own state machine instead of being written as straight-line sequential code. With 10 activities this becomes unreadable.

- **The solution:** give each activity its OWN stack and execution context. That is a **TASK**

The interrupt mechanism gave us concurrency between hardware events and software. But it did not give us concurrency *between software tasks*. To get that, we need to introduce the abstraction that makes an RTOS: **the task**.

*End of Chapter 2. We now understand how the hardware gives us concurrent execution through interrupts, and why the foreground/background model breaks down beyond a handful of activities. In Chapter 3, we will formalise the concept of a "task" — its own stack, its own context, its own life cycle — before letting the scheduler drive them in Chapter 4.*

> **Chapter 3 Preview — Tasks: Pretending to Multitask**
> We will define the Task Control Block (TCB), understand what "context" means precisely, hand-write a context switch in assembly, and see how a microcontroller can maintain the illusion of running multiple programs simultaneously — all without any additional hardware.
