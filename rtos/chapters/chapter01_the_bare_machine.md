# The Bare Machine

> *Before a task can run, before a scheduler can tick, before an RTOS can breathe — a microcontroller must first wake up and answer one question: "What do I do next?" This chapter is the answer.*

## What Is an Embedded System?

An embedded system is a computer built for **one specific job**, permanently. It is not a general-purpose PC. It has no operating system you can "install", no hard drive, no display (usually), and often no keyboard. It is a microcontroller soldered to a board, powered by a battery or a wall wart, and expected to do one thing — forever, reliably, with tight constraints on power, cost, and memory.

Examples you interact with every day:

| Device            | MCU Role                                                       |
|-------------------|----------------------------------------------------------------|
| Washing machine   | Controls drum motor, water valve, heater based on program      |
| Car ABS system    | Reads wheel speed sensors, pulses brakes 15× per second        |
| Cardiac pacemaker | Monitors heart rhythm, delivers pulse if it detects absence    |
| Smart thermostat  | Reads temperature, drives HVAC relay, communicates over Wi-Fi  |
| USB keyboard      | Scans key matrix, builds HID report, sends over USB every 1 ms |

All of these run on bare or near-bare metal. Understanding *how the machine wakes up* is the foundation for everything else in this book.

## Anatomy of a Microcontroller

A microcontroller (MCU) is a **system-on-chip**: it integrates a CPU core, memory, and peripherals into one package. Unlike a microprocessor (which needs external RAM and ROM), the MCU has everything it needs on-die.

**Key sub-components:**

- **CPU Core** — The Cortex-M4 (or M0, M7, RISC-V, etc.) that fetches and executes instructions. Contains the Arithmetic Logic Unit (ALU), general-purpose registers (R0-R15 on ARM), and the **Program Counter (PC)**.

- **Flash memory** — Non-volatile. Survives power-off. Your compiled program lives here. Read-only during normal execution (write requires special erase/program sequences).

- **SRAM** — Volatile. Loses content on power-off. Holds your stack, heap, and global variables at runtime.

- **Peripherals** — Hardware blocks that do work in parallel with the CPU: GPIO, UART, SPI, I2C, ADC, timers, DMA, and the Watchdog Timer (WDT).

- **Internal Bus** — The AHB/APB bus (on ARM Cortex-M) or similar fabric that lets the CPU read/write memory and peripheral registers using the same address-space mechanism.

![STM32 MCU block diagram](rtos/diagrams/ch1_mcu_anatomy.png)

## The Memory Map

When the CPU wants to read a byte, it puts an **address** on the bus. The bus fabric routes that address to the right destination — Flash, SRAM, or a peripheral register. This routing table is called the **memory map**.

![Memory Map](rtos/diagrams/ch1_memory_map.png){ width=80% }

**Why this matters for RTOS:** When an RTOS writes to a GPIO pin, enables a timer, or pends a software interrupt — it is *simply writing a value to an address*. Understanding the memory map demystifies every line of peripheral driver code you will ever read.

### Code: Reading a peripheral register directly

```c
#include <stdint.h>

/* Peripheral base addresses (from the datasheet) */
#define PERIPH_BASE     0x40000000UL
#define APB2PERIPH_BASE (PERIPH_BASE + 0x00010000UL)
#define GPIOA_BASE      (APB2PERIPH_BASE + 0x0000UL)

/* GPIOA register layout (simplified STM32F1) */
typedef struct {
    volatile uint32_t CRL;   /* Port config low  */
    volatile uint32_t CRH;   /* Port config high */
    volatile uint32_t IDR;   /* Input data       */
    volatile uint32_t ODR;   /* Output data      */
    volatile uint32_t BSRR;  /* Bit set/reset    */
    volatile uint32_t BRR;   /* Bit reset        */
    volatile uint32_t LCKR;  /* Port lock        */
} GPIO_TypeDef;

#define GPIOA ((GPIO_TypeDef *)GPIOA_BASE)

/* Toggle PA5 (LED on Nucleo board) */
void toggle_led(void) {
    GPIOA->ODR ^= (1u << 5);   /* Read-Modify-Write on ODR */
}
```

> **Note the `volatile` keyword.** Without it, the compiler might cache the register value in a CPU register and never re-read it from hardware. `volatile` tells the compiler: "this memory location can change outside your knowledge — always go to the actual address."

## The Clock System

A microcontroller is a **synchronous digital system**: every flip-flop changes state on a clock edge. Without a clock signal, nothing moves. The clock frequency determines how many instructions per second the CPU can execute.

**Typical clock initialization (bare-metal, C):**

```c
/*
 * clock_init.c
 *
 * Configure STM32F4 to run at 168 MHz using HSE (8 MHz crystal) + PLL.
 * This is often the first thing called from Reset_Handler.
 */

#include "stm32f4xx.h"   /* CMSIS device header — defines RCC, FLASH, etc. */

void clock_init(void)
{
    /* 1. Enable HSE oscillator and wait until it is stable */
    RCC->CR |= RCC_CR_HSEON;
    while (!(RCC->CR & RCC_CR_HSERDY));   /* spin until hardware sets HSERDY */

    /* 2. Configure Flash wait states for 168 MHz (5 wait states, ART on) */
    FLASH->ACR = FLASH_ACR_LATENCY_5WS
               | FLASH_ACR_PRFTEN
               | FLASH_ACR_ICEN
               | FLASH_ACR_DCEN;

    /* 3. Set PLL source = HSE, configure M/N/P/Q dividers
     *    SYSCLK = (HSE / M) * N / P = (8 / 8) * 336 / 2 = 168 MHz
     *    USB FS clock = (HSE / M) * N / Q = 1 * 336 / 7 = 48 MHz */
    RCC->PLLCFGR = (8u  << RCC_PLLCFGR_PLLM_Pos)   /* M = 8  */
                 | (336u << RCC_PLLCFGR_PLLN_Pos)   /* N = 336 */
                 | (0u  << RCC_PLLCFGR_PLLP_Pos)    /* P = 2 (00b) */
                 | (7u  << RCC_PLLCFGR_PLLQ_Pos)    /* Q = 7  */
                 | RCC_PLLCFGR_PLLSRC_HSE;           /* source = HSE */

    /* 4. Enable PLL and wait for lock */
    RCC->CR |= RCC_CR_PLLON;
    while (!(RCC->CR & RCC_CR_PLLRDY));

    /* 5. Set AHB/APB prescalers:
     *    AHB  = SYSCLK / 1 = 168 MHz
     *    APB1 = SYSCLK / 4 = 42 MHz  (max 42 MHz for APB1)
     *    APB2 = SYSCLK / 2 = 84 MHz  (max 84 MHz for APB2) */
    RCC->CFGR = RCC_CFGR_HPRE_DIV1
              | RCC_CFGR_PPRE1_DIV4
              | RCC_CFGR_PPRE2_DIV2;

    /* 6. Switch SYSCLK source to PLL */
    RCC->CFGR |= RCC_CFGR_SW_PLL;
    while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_CFGR_SWS_PLL);  /* confirm switch */

    /* Done — CPU now runs at 168 MHz */
}
```

![Clock Tree](rtos/diagrams/ch1_clock_tree.png){ width=65% }

> **Key insight:** Every clock configuration is a sequence of register writes. The hardware handshake (`while(!(RCC->CR & flag))`) is critical — switching to an unstable clock is a common source of hard faults in embedded bring-up.

## The Reset Sequence — From Power-On to main()

This is the most important section of the chapter. When power is applied, the MCU does not jump to `main()`. It goes through a precise, hardware-defined boot sequence.

```
Power Applied
     V
+-----------------------------------------------------------------+
| Step 1: Hardware Reset                                          |
|  • All registers reset to default values                        |
|  • CPU reads address 0x0000_0000: Initial Stack Pointer (MSP)   |
|  • CPU reads address 0x0000_0004: Reset Handler address (PC)    |
+----------------------------+------------------------------------+
                             V
+-----------------------------------------------------------------+
| Step 2: Reset_Handler (startup assembly)                        |
|  • Set up Stack Pointer (already done by hardware from vector)  |
|  • Copy .data section from Flash -> SRAM                        |
|  • Zero-fill .bss section in SRAM                               |
+----------------------------+------------------------------------+
                             V
+-----------------------------------------------------------------+
| Step 3: main()                                                  |
+-----------------------------------------------------------------+
```

### The Vector Table

The **vector table** is an array of 32-bit addresses stored at the very beginning of Flash. The CPU's very first act after reset is to read two entries from this table:

![Vector Table - ARM Cortex-M](rtos/diagrams/ch1_vector_table.png){ width=45% }

### Code: Minimal startup file (C version)

```c
/*
 * startup.c — Minimal bare-metal startup for ARM Cortex-M
 *
 * Normally this is written in assembly (startup_stm32xxx.s) by the
 * vendor. This C version makes the logic transparent.
 */

#include <stdint.h>
#include <string.h>   /* memset, memcpy */

/* Linker script symbols — defined in the .ld file, not in C */
extern uint32_t _sidata;  /* start of .data in Flash (load address) */
extern uint32_t _sdata;   /* start of .data in SRAM */
extern uint32_t _edata;   /* end   of .data in SRAM */
extern uint32_t _sbss;    /* start of .bss  in SRAM */
extern uint32_t _ebss;    /* end   of .bss  in SRAM */
extern uint32_t _estack;  /* initial stack pointer (top of SRAM) */

/* Forward declarations */
int main(void);
void SystemInit(void);

/* Default handler — loops forever, easy to catch in a debugger */
void Default_Handler(void) { while (1); }

/* Weak aliases — peripherals override these in their own files */
void NMI_Handler(void)       __attribute__((weak, alias("Default_Handler")));
void HardFault_Handler(void) __attribute__((weak, alias("Default_Handler")));
void SysTick_Handler(void)   __attribute__((weak, alias("Default_Handler")));
/* ... more weak aliases for each IRQ ... */

/*
 * Reset_Handler — entry point after every reset.
 * Placed in .text, called by hardware via the vector table.
 */
void Reset_Handler(void)
{
    uint32_t *src, *dst;

    /*
     * 1. Copy initialised globals/statics from Flash to SRAM.
     *    The linker script places the initial values after .text in Flash.
     *    At runtime they must live in SRAM so they are writable.
     *
     *    Example: uint32_t x = 42;  ->  value 42 lives in Flash,
     *    but x's address is in SRAM. We copy it here.
     */
    src = &_sidata;               /* source: Flash load address */
    dst = &_sdata;                /* destination: SRAM VMA */
    while (dst < &_edata) {
        *dst++ = *src++;
    }

    /*
     * 2. Zero-initialise the .bss section.
     *    C standard guarantees zero-init for globals with no initialiser.
     *    Example: static int counter;  ->  must be 0 at startup.
     */
    dst = &_sbss;
    while (dst < &_ebss) {
        *dst++ = 0u;
    }

    /*
     * 3. Optional: initialise clocks, FPU, MPU (chip-specific).
     *    Many CMSIS/HAL libraries provide SystemInit() for this.
     */
    SystemInit();

    /*
     * 4. Call main(). If main() returns (it shouldn't), spin.
     */
    main();
    while (1);   /* safety net */
}

/*
 * Vector table — placed in a special linker section ".isr_vector"
 * which the linker script maps to address 0x0800_0000.
 *
 * Entry [0] = Initial MSP value (top of stack)
 * Entry [1] = Reset_Handler address
 * Remaining = IRQ handler addresses
 */
__attribute__((section(".isr_vector"))) const uint32_t vector_table[] = {
    (uint32_t)&_estack,           /* [0] Initial MSP             */
    (uint32_t)Reset_Handler,      /* [1] Reset                   */
    (uint32_t)NMI_Handler,        /* [2] NMI                     */
    (uint32_t)HardFault_Handler,  /* [3] Hard fault              */
    0, 0, 0, 0,                   /* [4-7] reserved              */
    0, 0, 0,                      /* [8-10] reserved             */
    (uint32_t)Default_Handler,    /* [11] SVCall                 */
    0, 0,                         /* [12-13] reserved            */
    (uint32_t)Default_Handler,    /* [14] PendSV <- RTOS uses this */
    (uint32_t)SysTick_Handler,    /* [15] SysTick <- RTOS tick    */
    /* Device-specific IRQ handlers follow ... */
};
```

\newpage

## SRAM Layout

Once `Reset_Handler` finishes, SRAM is organised into distinct regions. Understanding this layout prevents the most common class of embedded bugs: stack overflow and heap corruption.

![SRAM layout](rtos/diagrams/ch1_sram_layout.png){ width=75% }

### Code: Verifying the layout in code

```c
/*
 * memory_layout.c — Print the addresses of key memory regions.
 * Useful during bring-up to confirm the linker script is correct.
 * Compile for host (PC) or embed in a UART debug build.
 */

#include <stdio.h>
#include <stdint.h>

/* A zero-initialised global (goes in .bss) */
static uint32_t bss_example;

/* An initialised global (goes in .data, initial value in Flash) */
static uint32_t data_example = 0xDEADBEEF;

/* A constant (goes in Flash .rodata — not in SRAM) */
static const uint32_t rodata_example = 0xCAFEBABE;

void print_memory_layout(void)
{
    uint32_t stack_local;   /* local variable — lives on the stack */

    printf("=== Memory Layout ===\n");
    printf(".rodata (Flash)  : %p  value=0x%08X\n",
           (void *)&rodata_example, rodata_example);
    printf(".data   (SRAM)   : %p  value=0x%08X\n",
           (void *)&data_example,  data_example);
    printf(".bss    (SRAM)   : %p  value=0x%08X\n",
           (void *)&bss_example,   bss_example);
    printf("stack local var  : %p\n",
           (void *)&stack_local);

    /* On a real MCU you'd see:
     *   .rodata: 0x0800xxxx  (in Flash)
     *   .data:   0x2000xxxx  (in SRAM)
     *   .bss:    0x2000yyyy  (just above .data)
     *   stack:   0x2000zzzz  (near top of SRAM) */
}
```

## The Linker Script: Giving Memory its Shape

The linker script (`.ld` file) is the blueprint that tells the linker where to place each section in the final binary. It directly controls the SRAM layout described above.

```ld
/* minimal.ld — Simplified GNU linker script for STM32F401 */

MEMORY
{
    /* Flash: 256 KB starting at 0x0800_0000 */
    FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 256K

    /* SRAM: 64 KB starting at 0x2000_0000 */
    SRAM  (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
}

/* Initial stack pointer: top of SRAM */
_estack = ORIGIN(SRAM) + LENGTH(SRAM);   /* = 0x20010000 */

SECTIONS
{
    /* --- Flash sections --- */

    .isr_vector :                 /* Vector table must be at Flash start */
    {
        KEEP(*(.isr_vector))
    } > FLASH

    .text :                       /* Program code and read-only data */
    {
        *(.text)
        *(.text*)
        *(.rodata)
        *(.rodata*)
        _sidata = .;              /* Mark: initial values for .data follow */
    } > FLASH

    /* --- SRAM sections --- */

    .data : AT(_sidata)           /* Load from Flash (AT), run in SRAM */
    {
        _sdata = .;               /* Start of .data in SRAM */
        *(.data)
        *(.data*)
        _edata = .;               /* End of .data in SRAM */
    } > SRAM

    .bss :
    {
        _sbss = .;                /* Start of .bss */
        *(.bss)
        *(.bss*)
        *(COMMON)
        _ebss = .;                /* End of .bss */
    } > SRAM

    /* Heap starts at _ebss, stack at _estack — they must not meet! */
}
```

> **Linker script = memory contract.** When you see a HardFault caused by an illegal address, the linker script is almost always where you should look first. Verify that your Flash and SRAM sizes exactly match the datasheet.

## The Unsolved Tension

The LED blinks. The machine is alive. But look at what `main()` does:

```c
while (1)
{
    do_thing_A();   /* blink LED */
    delay_cycles(1000000u);
    do_thing_B();   /* ??? */
}
```

**This loop is sequential.** `do_thing_B()` cannot run while `do_thing_A()` is waiting. If you need to simultaneously blink an LED every 500 ms, read a UART byte every 1 ms, and update an LCD every 100 ms — this single loop cannot do it cleanly.

The solution is **concurrency**. But before we reach for an RTOS, we first need to understand the simplest form of concurrency the hardware gives us for free: **interrupts**. That is the subject of Chapter 2.

*End of Chapter 1. In Chapter 2, we will see how the hardware's interrupt mechanism lets us escape the tyranny of the sequential loop — and why it creates its own new set of problems.*
