# The Scheduler

> *Chapter 3 gave every task its own stack and context. Now three tasks sit in the READY list staring at each other. Someone has to decide who runs, for how long, and what happens when a higher-priority task wakes up. That decision-maker is the scheduler — the brain of the RTOS.*

## What a Scheduler Does

The scheduler answers three questions on every tick:

1. WHO runs next?
  - Pick the highest-priority READY task.
  - If tie: round-robin among equal-priority tasks.

2. WHEN does the current task lose the CPU?
  - **Preemptive:**  at every tick, and whenever a higher-priority task becomes READY (e.g., unblocked by an ISR).
  - **Cooperative:** only when the running task voluntarily yields.

3. WHAT happens to the task that just lost the CPU?
  - If it used its full time slice: back to READY.
  - If it is waiting for an event: moves to BLOCKED.
  - If it called vTaskSuspend(): moves to SUSPENDED.

These three answers define the SCHEDULING POLICY.

FreeRTOS default: `preemptive`, `priority-based`, with `round-robin time-slicing` for equal-priority tasks.

## The Tick Interrupt

> *Heartbeat of the Scheduler.*

Every scheduling decision is triggered by one thing: the **SysTick interrupt**. At every tick, the RTOS checks if a context switch is needed.

![Conceptual Tick Interrupt flow](rtos/diagrams/ch4_tick_interrupt.png){ width=75% }

## Cooperative vs Preemptive Scheduling

There are two fundamental scheduling models. Understanding both helps you reason about bugs.

![Schedulers](rtos/diagrams/ch4_schedulers.png){ width=75% }

## Priority-Based Scheduling

FreeRTOS uses **fixed-priority preemptive scheduling**. Every task has a priority number assigned at creation. The scheduler always runs the highest-priority READY task.

```
Priority-Based Scheduling Example
─────────────────────────────────────────────────────────────────────────

  Tasks:   Sensor (P=3, highest)   UART (P=2)   LED (P=1, lowest)

  Scenario: LED is running, UART's delay expires, then Sensor unblocks.

  Time: ──────────────────────────────────────────────────────────▶

  LED   ████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░████████
  UART  ░░░░░░░░░░░░████░░░░░░░░░░░░░░░░░░████░░░░░░░░░░░░░░░░░
  Sensor░░░░░░░░░░░░░░░░████████████████░░░░░░░░░░░░░░░░░░░░░░░

        ▲           ▲   ▲               ▲   ▲           ▲
        LED         UART UART preempts  Sensor  UART    LED
        starts      wakes LED           wakes   blocks  resumes
                    up    immediately   up,     again
                          (preempts)    preempts
                                        UART

  Key rule: a lower-priority task NEVER runs while a higher-priority
  task is READY. LED does not get a single tick while Sensor is ready.

  █ = running   ░ = blocked or preempted
─────────────────────────────────────────────────────────────────────────
```

---

## 4.5 Round-Robin Time Slicing

When two or more tasks share the **same priority**, the scheduler gives each one a full tick (time slice) before switching to the next. This is called **round-robin**.

```
Round-Robin Among Equal-Priority Tasks
─────────────────────────────────────────────────────────────────────────

  Three tasks all at priority 2: Worker_A, Worker_B, Worker_C
  Tick rate: 1 ms   Time slice: 1 tick = 1 ms

  Time (ms):  0    1    2    3    4    5    6    7    8    9
              ┌────┬────┬────┬────┬────┬────┬────┬────┬────┐
  Running:    │ A  │ B  │ C  │ A  │ B  │ C  │ A  │ B  │ C  │ ...
              └────┴────┴────┴────┴────┴────┴────┴────┴────┘

  Each task gets exactly 1 ms of CPU time before yielding to the next.

  What if Worker_B blocks (calls vTaskDelay) mid-slice at t=1.3ms?

  Time (ms):  0    1   1.3  2    3    4    5
              ┌────┬───┬────┬────┬────┬────┐
  Running:    │ A  │ B │ C  │ A  │ C  │ A  │ ...
              └────┴───┴────┴────┴────┴────┘
                       ▲
                   B blocks → removed from round-robin
                   C gets the rest of B's slice + its own next slice

  configUSE_TIME_SLICING = 1 enables this (default in FreeRTOS).
─────────────────────────────────────────────────────────────────────────
```

---

## 4.6 The Idle Task

What happens when **all** tasks are blocked? The CPU must still run *something*. The RTOS automatically creates an **Idle Task** at the lowest possible priority (0 in FreeRTOS, always ready, never blocks).

```
The Idle Task's Role
─────────────────────────────────────────────────────────────────────────

  Time: ──────────────────────────────────────────────────────────▶
                   All tasks blocked here
                   ┌──────────────────────┐
  App tasks ───────┘                      └───────────────────────
  Idle task ░░░░░░░████████████████████████░░░░░░░░░░░░░░░░░░░░░░░

  What the Idle task does:
  ┌──────────────────────────────────────────────────────────────┐
  │  while (1)                                                   │
  │  {                                                           │
  │      /* 1. Free any TCBs of deleted tasks                   │
  │            (deletion is deferred to avoid ISR complexity) */ │
  │                                                              │
  │      /* 2. Call vApplicationIdleHook() if configured.       │
  │            Your code: enter low-power mode, feed WDT, etc.*/│
  │                                                              │
  │      /* 3. Optionally call __WFI() to sleep until next      │
  │            interrupt — cuts power to near zero. */           │
  │  }                                                           │
  └──────────────────────────────────────────────────────────────┘

  Rules for the Idle hook (vApplicationIdleHook):
    ✓ Must NOT block (no vTaskDelay, no semaphore waits)
    ✓ Must NOT call vTaskDelete on itself
    ✓ Safe place for: WDT refresh, power management, telemetry
─────────────────────────────────────────────────────────────────────────
```

---

## 4.7 Implementing a Minimal Scheduler

Let us build a working scheduler from scratch. This is a teaching implementation — stripped to the essential logic — before looking at how FreeRTOS does it.

```c
/*
 * scheduler.c — Minimal preemptive priority scheduler
 *
 * Assumptions:
 *   - TCB linked list from Chapter 3 (ready_list_head)
 *   - context switch from Chapter 3 (PendSV_Handler)
 *   - SysTick configured for 1 ms tick
 *   - current_tcb / next_tcb globals used by PendSV_Handler
 */

#include <stdint.h>
#include "tcb.h"
#include "core_cm4.h"

/* Globals shared with PendSV_Handler assembly */
TCB_t *current_tcb = NULL;
TCB_t *next_tcb    = NULL;

/* All TCBs in the system (ready + blocked) */
extern TCB_t *ready_list_head;

/* Tick counter */
static volatile uint32_t tick_count = 0;

/*
 * scheduler_select_next() — pick highest-priority READY task.
 *
 * Returns pointer to the TCB to run next.
 * In a real RTOS this is O(1) via per-priority lists.
 * Here it is O(N) for clarity.
 */
static TCB_t *scheduler_select_next(void)
{
    TCB_t *best  = NULL;
    TCB_t *tcb   = ready_list_head;

    while (tcb != NULL)
    {
        if (tcb->state == TASK_READY)
        {
            if (best == NULL || tcb->priority < best->priority)
            {
                best = tcb;
            }
        }
        tcb = tcb->next;
    }
    return best;   /* NULL only if every task is blocked (idle case) */
}

/*
 * scheduler_tick() — called from SysTick_Handler every 1 ms.
 *
 * 1. Advance tick counter.
 * 2. Unblock any tasks whose delay expired.
 * 3. Check if a switch is needed; if so, pend PendSV.
 */
void scheduler_tick(void)
{
    tick_count++;

    /* Scan all TCBs: unblock tasks whose wake_tick has arrived */
    TCB_t *tcb = ready_list_head;
    while (tcb != NULL)
    {
        if (tcb->state == TASK_BLOCKED && tcb->wake_tick <= tick_count)
        {
            tcb->state = TASK_READY;
        }
        tcb = tcb->next;
    }

    /* Mark current task as READY (it was RUNNING; time slice used up) */
    if (current_tcb != NULL)
    {
        current_tcb->state = TASK_READY;
    }

    /* Pick the next task to run */
    TCB_t *selected = scheduler_select_next();
    if (selected == NULL) return;   /* all blocked — should not happen with idle */

    selected->state = TASK_RUNNING;
    next_tcb = selected;

    /* If a different task was selected, trigger the context switch */
    if (next_tcb != current_tcb)
    {
        /*
         * Pend PendSV — the actual register swap happens there.
         * SCB->ICSR bit 28 = PENDSVSET.
         * PendSV fires after SysTick_Handler returns (it is lowest priority).
         */
        SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
    }
}

/*
 * SysTick_Handler — Override the weak default from startup.c
 * Calls scheduler_tick() to drive the whole engine.
 */
void SysTick_Handler(void)
{
    scheduler_tick();
}

/*
 * task_delay() — Block the calling task for 'ms' ticks.
 *
 * Sets wake_tick, moves state to BLOCKED, then yields immediately
 * by pending PendSV (no need to wait for the next tick).
 */
void task_delay(uint32_t ms)
{
    /* Disable interrupts while modifying current_tcb state */
    uint32_t primask = __get_PRIMASK();
    __disable_irq();

    current_tcb->wake_tick = tick_count + ms;
    current_tcb->state     = TASK_BLOCKED;

    /* Select and switch to next ready task immediately */
    TCB_t *selected = scheduler_select_next();
    if (selected != NULL)
    {
        selected->state = TASK_RUNNING;
        next_tcb = selected;
        SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
    }

    __set_PRIMASK(primask);

    /* Instruction and data sync barriers — ensure PendSV is seen */
    __DSB();
    __ISB();

    /*
     * PendSV will fire as soon as we re-enable interrupts.
     * The calling task is now BLOCKED and will not be selected again
     * until wake_tick elapses.
     */
}

/*
 * scheduler_start() — Launch the scheduler.
 *
 * Sets up SysTick, picks the first task, and does a manual
 * first context switch to start the RTOS.
 */
void scheduler_start(void)
{
    /* Configure SysTick for 1 ms tick at 84 MHz */
    SysTick_Config(84000000u / 1000u);

    /* Set PendSV to the lowest priority so it runs after all ISRs */
    NVIC_SetPriority(PendSV_IRQn,  0xFF);
    NVIC_SetPriority(SysTick_IRQn, 0xFF);

    /* Pick the first task */
    TCB_t *first = scheduler_select_next();
    if (first == NULL) while (1);   /* no tasks created — error */

    first->state = TASK_RUNNING;
    current_tcb  = first;
    next_tcb     = first;

    /*
     * Start the first task by restoring its initial stack frame.
     * We set PSP to the task's saved_sp and do an EXC_RETURN.
     *
     * This is done in a small inline assembly stub because we need
     * to manipulate SP directly — not possible in C.
     */
    __asm volatile (
        "LDR  R0, =current_tcb      \n"  /* R0 = &current_tcb             */
        "LDR  R0, [R0]              \n"  /* R0 = current_tcb (TCB_t *)    */
        "LDR  R0, [R0, #0]          \n"  /* R0 = TCB.saved_sp             */
        "MSR  PSP, R0               \n"  /* PSP = saved_sp                */
        "MOV  R0, #2                \n"  /* CONTROL: use PSP, unpriv      */
        "MSR  CONTROL, R0           \n"
        "ISB                        \n"  /* sync after CONTROL write      */
        "POP  {R4-R11}              \n"  /* restore callee-saved regs     */
        "POP  {R0-R3, R12, LR}      \n"  /* restore R0–R3, R12, LR        */
        "POP  {R0}                  \n"  /* discard PC temporarily        */
        "POP  {R0}                  \n"  /* discard xPSR temporarily      */
        /* Actually use a proper EXC_RETURN to let hardware unstack: */
        "BX   LR                    \n"  /* EXC_RETURN → unstacks to task  */
        ::: "memory"
    );

    /* Never reached */
    while (1);
}
```

---

## 4.8 Preemption on Event — Not Just on Tick

The scheduler does not only run at tick boundaries. Whenever an ISR unblocks a higher-priority task, it should **immediately** preempt the running task, even mid-tick.

```
ISR-Triggered Preemption
─────────────────────────────────────────────────────────────────────────

  Scenario:
    LED task (P=1) is running.
    UART ISR fires, deposits a byte, wakes UART task (P=2).
    UART task (P=2) should preempt LED task (P=1) immediately.

  Timeline:
                                  UART ISR fires
  LED task   ████████████████████│          │░░░░░░░░░░░░
  UART ISR                       │██████████│
  UART task                                 │████████████

                                  ISR ends → PendSV fires → switch

  How the ISR triggers the switch:
  ┌────────────────────────────────────────────────────────────┐
  │  void USART1_IRQHandler(void)                              │
  │  {                                                         │
  │      /* ... read byte, wake UART task ... */               │
  │      uart_tcb->state    = TASK_READY;                      │
  │                                                            │
  │      /* Is the newly ready task higher priority           │
  │         than the currently running task?                   │
  │         If so, pend a context switch. */                   │
  │      if (uart_tcb->priority > current_tcb->priority)       │
  │      {                                                     │
  │          next_tcb = uart_tcb;                              │
  │          SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;             │
  │      }                                                     │
  │  }                                                         │
  │                                                            │
  │  PendSV fires when USART1_IRQHandler returns:             │
  │  → Context switch from LED to UART task                    │
  └────────────────────────────────────────────────────────────┘

  In FreeRTOS this pattern is implemented by:
    xSemaphoreGiveFromISR() → calls xTaskResumeFromISR()
    → sets a "yield required" flag
    → portYIELD_FROM_ISR() pends PendSV
─────────────────────────────────────────────────────────────────────────
```

---

## 4.9 vTaskSwitchContext() — Inside FreeRTOS

The heart of the FreeRTOS scheduler is `vTaskSwitchContext()` in `tasks.c`. It is called from the SysTick handler and from PendSV. Here is what it does — simplified for clarity:

```c
/*
 * Simplified vTaskSwitchContext() — based on FreeRTOS tasks.c
 *
 * The real version handles:
 *   - Stack overflow checking (configCHECK_FOR_STACK_OVERFLOW)
 *   - Run-time statistics (configGENERATE_RUN_TIME_STATS)
 *   - Trace hooks (traceTASK_SWITCHED_OUT / IN)
 *   - Tickless idle (configUSE_TICKLESS_IDLE)
 *
 * Core logic is what is shown here.
 */

void vTaskSwitchContext(void)
{
    /*
     * taskSELECT_HIGHEST_PRIORITY_TASK() is a macro that expands to:
     *
     * 1. Find the highest priority level that has a ready task:
     *      uxTopReadyPriority = highest bit set in uxReadyPriorities bitmap
     *    On Cortex-M with CLZ instruction this is ONE CYCLE — O(1).
     *
     * 2. Pick the next task in that priority's circular list:
     *      pxCurrentTCB = listGET_OWNER_OF_NEXT_ENTRY(
     *                         &pxReadyTasksLists[uxTopReadyPriority])
     *    The circular list gives automatic round-robin among equals.
     */
    taskSELECT_HIGHEST_PRIORITY_TASK();

    /*
     * traceTASK_SWITCHED_IN() — hook for Percepio Tracealyzer or
     * SystemView. In production builds this compiles to nothing.
     */
    traceTASK_SWITCHED_IN();
}
```

### The FreeRTOS ready list structure

```
FreeRTOS Ready Lists — O(1) Scheduler
─────────────────────────────────────────────────────────────────────────

  pxReadyTasksLists[configMAX_PRIORITIES]  (array of circular lists)

  Index 5 (highest): ──▶ [ Sensor ] ──▶ [ Sensor ] (circular, 1 task)
  Index 4:           ──▶ [ empty list ]
  Index 3:           ──▶ [ UART_A ] ──▶ [ UART_B ] ──▶ [ UART_A ] ...
  Index 2:           ──▶ [ LED ] ──▶ [ LED ] (circular, 1 task)
  Index 1:           ──▶ [ empty list ]
  Index 0 (lowest):  ──▶ [ Idle ] ──▶ [ Idle ] (circular, always here)

  uxReadyPriorities bitmap:  0b00100100  (bits 5 and 2 set)

  Finding the highest set bit:
    On Cortex-M4: __CLZ(uxReadyPriorities) → one instruction
    Top priority = (31 - CLZ result) = 5 → run Sensor

  Round-robin within priority 3 (two UART tasks):
    First tick: listGET_OWNER_OF_NEXT_ENTRY advances pointer → UART_A
    Next  tick: advances again → UART_B
    Next  tick: advances again → UART_A  (wraps)

  Adding a task: O(1) — append to circular list, set bit in bitmap.
  Finding next:  O(1) — CLZ on bitmap, then list head.
─────────────────────────────────────────────────────────────────────────
```

---

## 4.10 FreeRTOS Scheduler Configuration

The scheduler behaviour is controlled by `FreeRTOSConfig.h`. These are the most important knobs:

```c
/*
 * FreeRTOSConfig.h — Key scheduler settings explained
 */

/*
 * configUSE_PREEMPTION
 *   1 = Preemptive scheduling (default, recommended)
 *       Higher-priority tasks preempt immediately.
 *   0 = Cooperative scheduling
 *       Tasks only switch on explicit yield or block call.
 */
#define configUSE_PREEMPTION                    1

/*
 * configUSE_TIME_SLICING
 *   1 = Equal-priority tasks share CPU in round-robin (default)
 *   0 = Once a task of the highest priority runs, it holds
 *       the CPU until it blocks or yields — no forced rotation.
 */
#define configUSE_TIME_SLICING                  1

/*
 * configTICK_RATE_HZ
 *   Frequency of the SysTick interrupt.
 *   1000 Hz = 1 ms resolution for vTaskDelay(pdMS_TO_TICKS(n)).
 *   Higher rate = finer granularity, more interrupt overhead.
 *   Lower rate  = coarser timing, less overhead.
 *   Typical range: 100 Hz (10 ms) to 1000 Hz (1 ms).
 */
#define configTICK_RATE_HZ                      1000

/*
 * configMAX_PRIORITIES
 *   Number of distinct priority levels.
 *   FreeRTOS: priority 0 = lowest (Idle), configMAX_PRIORITIES-1 = highest.
 *   Note: opposite of our teaching implementation in Chapter 3!
 *   Typical value: 5 to 10. More levels = larger uxReadyPriorities bitmap.
 */
#define configMAX_PRIORITIES                    7

/*
 * configMINIMAL_STACK_SIZE
 *   Stack size (in words) for the Idle task.
 *   All other tasks should be sized individually.
 *   Typical: 128 words (512 bytes) for Cortex-M.
 */
#define configMINIMAL_STACK_SIZE                128

/*
 * configUSE_IDLE_HOOK
 *   1 = You provide vApplicationIdleHook() — called from Idle task.
 *   Use for: WDT feed, low-power sleep, background telemetry.
 *   MUST NOT block.
 */
#define configUSE_IDLE_HOOK                     1

/*
 * configUSE_TICK_HOOK
 *   1 = You provide vApplicationTickHook() — called from SysTick ISR.
 *   Use for: precise periodic actions (runs every tick, in ISR context).
 *   MUST NOT block. MUST be very short.
 */
#define configUSE_TICK_HOOK                     0

/*
 * configUSE_TICKLESS_IDLE
 *   1 = Suppress SysTick when no tasks need to wake soon.
 *   Dramatically reduces power in sleep-heavy applications.
 *   Requires port-specific implementation (low-power timer).
 */
#define configUSE_TICKLESS_IDLE                 0

/*
 * configMAX_SYSCALL_INTERRUPT_PRIORITY
 *   The HIGHEST interrupt priority from which FreeRTOS API may be called.
 *   Any ISR that calls xSemaphoreGiveFromISR() or similar must have
 *   a numerical priority EQUAL TO OR GREATER THAN this value
 *   (remember: higher number = lower urgency on Cortex-M).
 *
 *   On a 4-bit priority implementation (0–15):
 *     Set to 5 → ISRs at priority 5–15 may call FreeRTOS API.
 *     ISRs at priority 0–4 are NEVER allowed to call FreeRTOS API —
 *     they run above the RTOS and are completely unmanaged.
 */
#define configMAX_SYSCALL_INTERRUPT_PRIORITY    5
```

---

## 4.11 Scheduling Scenarios — Worked Examples

### Scenario A: Pure priority (no equal-priority tasks)

```
Tasks:   Comm (P=5), Control (P=3), Monitor (P=2), LED (P=1), Idle (P=0)
─────────────────────────────────────────────────────────────────────────

t=0:   All tasks created. Comm is highest priority → runs first.
t=2:   Comm calls vTaskDelay(10) → BLOCKED. Control runs (next highest).
t=5:   Control calls vTaskDelay(5) → BLOCKED. Monitor runs.
t=7:   Monitor finishes work, calls vTaskDelay(100) → BLOCKED. LED runs.
t=8:   LED calls vTaskDelay(200) → BLOCKED. Idle runs.
t=10:  Comm's delay expires (wake_tick=2+10=12... actually t=12).
       ...
t=12:  Comm unblocks → immediately preempts Idle → Comm runs.
t=14:  Control unblocks (t=5+5=10? ...actually t=10) ...

  Execution trace:
  Comm     ████░░░░░░░░░░░░░░████░░░░░░░░░░░░░░████░
  Control  ░░░░███░░░░░░░░░░░░░░░███░░░░░░░░░░░░░░░░
  Monitor  ░░░░░░░██░░░░░░░░░░░░░░░░░██░░░░░░░░░░░░░
  LED      ░░░░░░░░█░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░░░
  Idle     ░░░░░░░░░████░░░░░░░░░░░░░░░░░░░░░░░░░░░░

  █ = running   ░ = blocked / waiting
─────────────────────────────────────────────────────────────────────────
```

### Scenario B: Equal-priority round-robin

```
Tasks:   Worker_A (P=2), Worker_B (P=2), Worker_C (P=2), all CPU-bound
─────────────────────────────────────────────────────────────────────────

  (configUSE_TIME_SLICING = 1, tick = 1 ms)

  Time (ms): 0    1    2    3    4    5    6    7    8    9
             ┌────┬────┬────┬────┬────┬────┬────┬────┬────┐
  Running:   │ A  │ B  │ C  │ A  │ B  │ C  │ A  │ B  │ C  │
             └────┴────┴────┴────┴────┴────┴────┴────┴────┘

  Each worker gets 1 ms / 3 workers = 33% CPU.
  For a 168 MHz CPU: 33% = ~56 million instructions per worker per second.

  If Worker_B blocks at t=1.6 ms:
  Time (ms): 0    1   1.6  2    3    4    5    6
             ┌────┬───┬────┬────┬────┬────┬────┐
  Running:   │ A  │ B │ C  │ A  │ C  │ A  │ C  │  (B removed)
             └────┴───┴────┴────┴────┴────┴────┘

  Worker_A and Worker_C now each get 50% CPU.
─────────────────────────────────────────────────────────────────────────
```

### Scenario C: ISR-driven preemption

```
Tasks:   Logger (P=1) is running. SPI DMA completes → unblocks Comm (P=5).
─────────────────────────────────────────────────────────────────────────

  Time: ────────────────────────────────────────────────────────▶

  Logger   ████████████████░░░░░░░░░░░░░░░░░░░░████████████████
  SPI_ISR                  │██│
  Comm                         ████████████████
  PendSV                      │ (fires after SPI_ISR returns)

  SPI_ISR code:
    DMA_clear_interrupt_flag();
    comm_tcb->state = TASK_READY;
    if (comm_tcb->priority > current_tcb->priority) {
        next_tcb = comm_tcb;
        portYIELD_FROM_ISR(pdTRUE);   /* pends PendSV */
    }

  Result: Comm runs within ~1 µs of the SPI DMA completing —
          not waiting for the next 1 ms SysTick.
─────────────────────────────────────────────────────────────────────────
```

---

## 4.12 Task Priorities — Design Guidelines

Choosing priorities well is a skill. Poorly assigned priorities cause subtle, intermittent bugs.

```
Priority Assignment Guidelines
─────────────────────────────────────────────────────────────────────────

  Rate Monotonic Analysis (RMA) rule of thumb:
    Assign higher priority to tasks with shorter periods.
    A task that runs every 1 ms beats one that runs every 100 ms.

  Typical embedded priority ladder (FreeRTOS numbering, higher = more urgent):

  Priority  Task type                       Example
  ────────────────────────────────────────────────────────────────────
     6      Hard real-time control          Motor PID loop (1 kHz)
     5      Safety-critical                 Fault detection
     4      Communication (time-sensitive)  CAN/UART protocol handler
     3      Application logic               State machine
     2      Slow periodic tasks             LCD update, logging
     1      Background housekeeping         Statistics, self-test
     0      Idle task (automatic)           Power management

  Anti-patterns to avoid:
  ✗ Giving all tasks the same priority — hides real-time requirements.
  ✗ Priority inversion: low-priority task holds a mutex that a
    high-priority task needs. (Covered in Chapter 6.)
  ✗ Starvation: a very high-priority CPU-bound task that never blocks,
    preventing all lower-priority tasks from ever running.
─────────────────────────────────────────────────────────────────────────
```

---

## 4.13 Measuring Scheduler Overhead

The scheduler is not free. Every tick interrupt and every context switch burns CPU cycles.

```c
/*
 * scheduler_overhead.c
 *
 * FreeRTOS run-time statistics measure actual CPU usage per task.
 * Enable with: configGENERATE_RUN_TIME_STATS = 1
 *              configUSE_STATS_FORMATTING_FUNCTIONS = 1
 *
 * Requires a high-resolution counter (faster than the tick timer).
 * Typically a hardware timer at 10x–100x the tick rate.
 */

#include "FreeRTOS.h"
#include "task.h"

/*
 * vApplicationTickHook() — provide a high-res counter for stats.
 * Configure a TIM peripheral at 10 kHz (10x the 1 kHz SysTick).
 */
void setup_runtime_counter(void)
{
    /* Configure TIM2 as a free-running 32-bit counter at 10 kHz */
    RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;
    TIM2->PSC = (84000000u / 10000u) - 1;   /* 84 MHz / 10 kHz - 1 */
    TIM2->ARR = 0xFFFFFFFFUL;               /* max period           */
    TIM2->CR1 |= TIM_CR1_CEN;
}

uint32_t get_runtime_counter(void)
{
    return TIM2->CNT;
}

/*
 * Print task CPU usage — call from a low-priority monitor task.
 *
 * Example output:
 *   Task       Abs Time    % Time
 *   ─────────────────────────────
 *   Comm       42130       42%
 *   Control    21050       21%
 *   Monitor     8200        8%
 *   LED         1000        1%
 *   IDLE       27620       27%
 */
void task_monitor(void *arg)
{
    (void)arg;
    static char stats_buf[512];

    while (1)
    {
        vTaskGetRunTimeStats(stats_buf);
        uart_send_string("\r\n=== CPU Usage ===\r\n");
        uart_send_string(stats_buf);
        vTaskDelay(pdMS_TO_TICKS(5000));   /* print every 5 seconds */
    }
}
```

---

## 4.14 The Unsolved Tension

The scheduler runs tasks in priority order with time-slicing. But a new problem has appeared that no amount of scheduling policy can fix alone:

```
The Shared Resource Problem
─────────────────────────────────────────────────────────────────────────

  Task A (P=3) and Task B (P=1) both write to a shared UART ring buffer.
  Task A preempts Task B in the MIDDLE of Task B's write.

  Task B:  ring_buf[head] = byte;      ← preempted here!
                    ↓ switch to Task A
  Task A:  ring_buf[head] = byte;      ← overwrites Task B's slot
           head++;
                    ↓ switch back to Task B
  Task B:  head++;                     ← head advanced twice, one byte lost

  The super-loop's critical section (Chapter 2) handled ISR vs main().
  But now TASK A is not an ISR — it is a task.
  Disabling global interrupts (PRIMASK) is too blunt:
    It also blocks time-critical ISRs during the protected window.

  We need a mechanism that:
    ✓ Blocks Task A from entering the critical section if Task B holds it
    ✓ Does NOT disable hardware interrupts
    ✓ Integrates with the scheduler (blocked task yields CPU gracefully)
    ✓ Is safe when the same task tries to take it twice (reentrant option)

  That mechanism is the MUTEX — and it is the first topic of Chapter 5.
─────────────────────────────────────────────────────────────────────────
```

---

## Chapter Summary

| Concept | What you learned |
|---------|-----------------|
| Scheduler role | Answers: who runs, when to switch, what to do with the outgoing task |
| Tick interrupt | SysTick drives the scheduler; PendSV performs the actual switch |
| Cooperative scheduling | Tasks yield voluntarily; predictable but fragile |
| Preemptive scheduling | Scheduler forces switches; responsive but needs data protection |
| Priority-based | Highest-priority READY task always runs; lower tasks wait |
| Round-robin | Equal-priority tasks share CPU in time slices |
| Idle task | Always READY; runs when all app tasks are blocked; power hook |
| O(1) scheduler | CLZ + per-priority circular lists; constant time regardless of task count |
| FreeRTOSConfig.h | configUSE_PREEMPTION, configTICK_RATE_HZ, configMAX_PRIORITIES |
| ISR preemption | ISR unblocking a high-priority task pends PendSV immediately |
| Shared resource problem | Tasks need mutex-level protection, not just interrupt disable |

---

## Exercises

1. Set `configUSE_PREEMPTION = 0` in a FreeRTOS project. Create two tasks that each toggle a GPIO at different rates. Observe what happens when one task never calls `vTaskDelay()`.
2. Add `vTaskGetRunTimeStats()` to an existing project. Which task consumes the most CPU? Is it the one you expected?
3. Derive the minimum tick rate needed if your fastest task must run every 5 ms with no more than 0.5 ms jitter.
4. In the scheduler implementation (Section 4.7), `scheduler_select_next()` is O(N). Redesign it using a bitmap + per-priority list to achieve O(1). What data structures do you need?
5. Read FreeRTOS's `xTaskIncrementTick()` in `tasks.c`. Map each line to the corresponding step in `scheduler_tick()` from Section 4.7. What does FreeRTOS add that our teaching version omits?

---

*End of Chapter 4. The scheduler is running — tasks take turns with correct priority and timing. But the moment two tasks share any resource, correctness breaks. Chapter 5 introduces the synchronisation primitives that make sharing safe: semaphores, mutexes, and event flags.*

---

> **Chapter 5 Preview — Synchronisation: Tasks Talk to Each Other**
> We will build semaphores from scratch, understand the difference between a binary semaphore and a mutex, implement priority inheritance, and see how event groups let multiple tasks wait on combinations of conditions — all without a single global interrupt disable.
