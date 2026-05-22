# Tasks

> *Chapter 2 showed that interrupts give us concurrency between hardware and software. But background activities still share one stack and one execution context. The RTOS solution is elegant: give each activity its own private stack and pretend each one has its own CPU. This pretence is so convincing that the programmer writes each task as if it runs forever, alone. This chapter builds that illusion from scratch.*

## The Core Idea: Illusion of Parallelism

A single-core CPU can only execute one instruction at a time. Yet every RTOS gives you the feeling that ten tasks are running simultaneously. How?

**By switching between them so fast that the human observer cannot tell they are taking turns.**

![Task execution](rtos/diagrams/ch3_task_execution.png){ width=75% }

To pull off this illusion, the RTOS needs two things:

1. A structure that describes each task and stores its saved state — the **Task Control Block (TCB)**.
2. A routine that can swap one task's state for another's — the **context switch**.

## What is a "Context"?

A task's **context** is everything the CPU needs to resume executing that task as if it had never been interrupted. On ARM Cortex-M, that is:

![Task Context on ARM Cortex-M4](rtos/diagrams/ch3_task_context.png){ width=75% }

## The Task Control Block (TCB)

The TCB is a data structure the RTOS maintains for every task. Think of it as a task's "file" in the OS. At minimum it must store the saved stack pointer so the context switch knows where to find the saved registers.

![Task Control Block — Conceptual Layout](rtos/diagrams/ch3_tcb.png){ width=75% }

In FreeRTOS this struct is called TCB_t (defined in tasks.c). The first field is always pxTopOfStack — because the context switch assembly code must find it at offset 0 without needing to know the full struct layout.

### Code: Minimal TCB definition

```c
/*
 * tcb.h — Minimal Task Control Block for a home-grown RTOS demo
 *
 * This is a teaching implementation. FreeRTOS's TCB_t is larger and
 * richer, but every field here maps to something in the real thing.
 */

#ifndef TCB_H
#define TCB_H

#include <stdint.h>
#include <stddef.h>

/* Task states */
typedef enum {
    TASK_READY     = 0,   /* Ready to run, waiting for CPU          */
    TASK_RUNNING   = 1,   /* Currently executing on CPU             */
    TASK_BLOCKED   = 2,   /* Waiting for an event (semaphore, time) */
    TASK_SUSPENDED = 3,   /* Explicitly suspended, not schedulable  */
} TaskState_t;

/* Task function signature: takes a void* arg, never returns */
typedef void (*TaskFunc_t)(void *arg);

/* Task Control Block */
typedef struct TCB_s {
    /*
     * MUST be first field — context switch assembly addresses
     * this at offset 0 without knowing the struct layout.
     */
    volatile uint32_t *saved_sp;       /* Saved stack pointer           */

    /* Stack boundaries */
    uint32_t          *stack_base;     /* Lowest valid stack address     */
    uint32_t           stack_size;     /* Stack size in bytes            */

    /* Scheduler fields */
    TaskState_t        state;          /* Current state                  */
    uint8_t            priority;       /* 0 = highest, 255 = lowest      */
    uint32_t           wake_tick;      /* Tick to unblock at (for delay) */

    /* Identity */
    const char        *name;           /* Human-readable task name       */

    /* Linked list for scheduler queues */
    struct TCB_s      *next;           /* Next TCB in ready/blocked list */
} TCB_t;

#endif /* TCB_H */
```

## Task States and Transitions

Every task is always in one of four states. The scheduler only ever runs tasks in the **READY** state.

![Task State Machine](rtos/diagrams/ch3_task_state.png){ width=75% }

> - Only ONE task is RUNNING at a time (on a single core).
> - Multiple tasks can be READY simultaneously — priority breaks ties.
> - A BLOCKED task consumes zero CPU time.
> - SUSPENDED tasks do not wake on events — only on explicit Resume().

## The Task Stack

Each task gets its **own private stack** — a region of SRAM reserved exclusively for that task's local variables, function call chain, and saved register frame.

![Task stack](rtos/diagrams/ch3_task_stack.png){ width=75% }

> Critical property:
>   - Task A cannot corrupt Task B's stack.
>   - Task B cannot corrupt Task A's local variables.

### Code: Initialising a task stack

When a task is created, its stack must be pre-initialised to look exactly like it was already interrupted mid-execution. The context switch will then "restore" this fake frame and the task will start running.

```c
/*
 * task_stack_init.c
 *
 * Pre-fill a task's stack so that when the context switch restores
 * it for the first time, the CPU jumps to task_func(arg).
 *
 * ARM Cortex-M stack frame layout (grows downward):
 *
 *   [Higher address] (stack top on entry)
 *   +---------+
 *   |  xPSR   |  Must have bit 24 set (Thumb mode)
 *   |  PC     |  < task_func — where task starts
 *   |  LR     |  < task_exit_handler (called if task returns)
 *   |  R12    |  0x00000000 (dummy)
 *   |  R3     |  0x00000000
 *   |  R2     |  0x00000000
 *   |  R1     |  0x00000000
 *   |  R0     |  < arg (task function argument)
 *   +---------+  < hardware-pushed frame ends here
 *   |  R11    |  \
 *   |  R10    |   |
 *   |  R9     |   |  Software-pushed (callee-saved registers)
 *   |  R8     |   |  pushed by our context switch code
 *   |  R7     |   |
 *   |  R6     |   |
 *   |  R5     |   |
 *   |  R4     |  /
 *   +---------+  < saved_sp points here after init
 *   [Lower address]
 */

#include <stdint.h>
#include "tcb.h"

/* Called if a task function ever returns — should never happen */
static void task_exit_handler(void)
{
    /* In production: delete the current task.
     * Here: trap in debugger. */
    while (1);
}

/*
 * stack_init() — Initialise a task stack with a fake exception frame.
 *
 * Parameters:
 *   stack_top  : pointer to ONE PAST the top of the stack buffer
 *                (stacks grow downward, so top = buffer_base + size)
 *   task_func  : the task function to run
 *   arg        : passed as R0 (first argument) to task_func
 *
 * Returns: the initial stack pointer to store in TCB.saved_sp
 */
uint32_t *stack_init(uint32_t    *stack_top,
                     TaskFunc_t   task_func,
                     void        *arg)
{
    /*
     * Cortex-M requires 8-byte stack alignment at exception entry.
     * Ensure stack_top is 8-byte aligned before we start filling.
     */
    uint32_t *sp = (uint32_t *)((uintptr_t)stack_top & ~0x7UL);

    /* -- Hardware-pushed exception frame (filled in reverse) -- */

    *(--sp) = 0x01000000UL;          /* xPSR: Thumb bit (bit 24) set */
    *(--sp) = (uint32_t)task_func;   /* PC:   task entry point       */
    *(--sp) = (uint32_t)task_exit_handler; /* LR: if task returns    */
    *(--sp) = 0x00000000UL;          /* R12: scratch                  */
    *(--sp) = 0x00000000UL;          /* R3                            */
    *(--sp) = 0x00000000UL;          /* R2                            */
    *(--sp) = 0x00000000UL;          /* R1                            */
    *(--sp) = (uint32_t)arg;         /* R0: task argument             */

    /* -- Software-saved callee registers (our context switch saves these) -- */
    *(--sp) = 0x00000000UL;          /* R11 */
    *(--sp) = 0x00000000UL;          /* R10 */
    *(--sp) = 0x00000000UL;          /* R9  */
    *(--sp) = 0x00000000UL;          /* R8  */
    *(--sp) = 0x00000000UL;          /* R7  */
    *(--sp) = 0x00000000UL;          /* R6  */
    *(--sp) = 0x00000000UL;          /* R5  */
    *(--sp) = 0x00000000UL;          /* R4  */

    /* sp now points to the top of the initialised frame.
     * Store this in TCB.saved_sp. The context switch will
     * pop R4–R11 then do an exception return to pop the rest. */
    return sp;
}
```

## The Context Switch — Heart of the RTOS

The context switch is the code that swaps from one task to another. It must:

1. Save the **current** task's CPU registers onto its stack, update its `saved_sp`.
2. Pick the **next** task to run (the scheduler's job).
3. Load the **next** task's `saved_sp`, pop its saved registers.
4. Return — which resumes the next task mid-execution.

![Context Switch — Register Save and Restore](rtos/diagrams/ch3_task_contex_switch.png){ width=75% }

On ARM Cortex-M, the context switch is triggered by the **PendSV** exception (Pended Supervisor Call). FreeRTOS and most other RTOSes use PendSV at the lowest possible priority so that all real ISRs complete before the switch occurs.

### Code: Context switch in assembly (ARM Cortex-M, GCC syntax)

```asm
/*
 * context_switch.s — Minimal PendSV context switch for ARM Cortex-M
 *
 * Globals used:
 *   current_tcb  — pointer to TCB_t* of the currently running task
 *   next_tcb     — pointer to TCB_t* of the task to switch to
 *                  (set by the scheduler before pending PendSV)
 *
 * TCB layout assumption:
 *   offset 0 = saved_sp  (uint32_t *)
 */

    .syntax unified
    .thumb

    .extern current_tcb     /* TCB_t **current_tcb */
    .extern next_tcb        /* TCB_t **next_tcb    */

    .global PendSV_Handler
    .type   PendSV_Handler, %function

PendSV_Handler:
    /*
     * On PendSV entry, hardware has already pushed:
     *   xPSR, PC, LR, R12, R3, R2, R1, R0
     * onto the current task's stack (MSP or PSP).
     *
     * We use PSP (Process Stack Pointer) for tasks and
     * MSP (Main Stack Pointer) for the RTOS kernel.
     * This is the standard Cortex-M RTOS model.
     */

    /* 1. Disable interrupts during the switch */
    CPSID   I

    /* 2. Get the current task's PSP (process stack pointer) */
    MRS     R0, PSP

    /* 3. Save callee-saved registers R4–R11 onto PSP stack
     *    STMDB = Store Multiple, Decrement Before (push descending) */
    STMDB   R0!, {R4-R11}

    /* 4. Save updated SP into current task's TCB
     *    current_tcb is TCB_t** — load the pointer, then store SP */
    LDR     R1, =current_tcb
    LDR     R1, [R1]            /* R1 = *current_tcb  (= TCB_t *)   */
    STR     R0, [R1, #0]        /* TCB.saved_sp = R0 (updated PSP)  */

    /* 5. Load next task's SP from its TCB
     *    next_tcb was set by the scheduler before PendSV was pended */
    LDR     R2, =next_tcb
    LDR     R2, [R2]            /* R2 = *next_tcb  (= TCB_t *)      */
    LDR     R0, [R2, #0]        /* R0 = next TCB.saved_sp            */

    /* 6. Update current_tcb = next_tcb */
    LDR     R3, =current_tcb
    STR     R2, [R3]

    /* 7. Restore callee-saved registers R4–R11 from next task's stack
     *    LDMIA = Load Multiple, Increment After (pop ascending) */
    LDMIA   R0!, {R4-R11}

    /* 8. Write the new SP back to PSP */
    MSR     PSP, R0

    /* 9. Re-enable interrupts */
    CPSIE   I

    /*
     * 10. Return from exception using EXC_RETURN.
     *     LR still holds EXC_RETURN (set by hardware on entry).
     *     BX LR triggers hardware unstacking of
     *     R0–R3, R12, LR, PC, xPSR from the NEW task's stack.
     *     CPU jumps to next task's PC — the switch is complete.
     */
    BX      LR

    .size PendSV_Handler, .-PendSV_Handler
```

## Task Creation — Wiring It All Together

With the TCB, stack initialisation, and context switch defined, task creation becomes straightforward:

```c
/*
 * task_create.c — Allocate a TCB, initialise its stack, add to ready list
 */

#include <string.h>
#include "tcb.h"

/* Statically allocated TCB pool (no heap required) */
#define MAX_TASKS  8
static TCB_t tcb_pool[MAX_TASKS];
static uint8_t tcb_count = 0;

/* Head of the ready list — singly linked, priority sorted */
TCB_t *ready_list_head = NULL;

/* Scheduler's current task pointer */
TCB_t *current_tcb = NULL;
TCB_t *next_tcb    = NULL;

/* Declare stack_init from task_stack_init.c */
extern uint32_t *stack_init(uint32_t *, TaskFunc_t, void *);

/*
 * task_create() — Create a new task.
 *
 * Parameters:
 *   func       : task function  void func(void *arg)
 *   arg        : passed to func as first argument
 *   stack_buf  : caller-provided stack buffer
 *   stack_size : size of stack_buf in bytes
 *   priority   : scheduling priority (0 = highest)
 *   name       : human-readable name (debug only)
 *
 * Returns pointer to TCB, or NULL if the pool is exhausted.
 */
TCB_t *task_create(TaskFunc_t   func,
                   void        *arg,
                   uint32_t    *stack_buf,
                   uint32_t     stack_size,
                   uint8_t      priority,
                   const char  *name)
{
    if (tcb_count >= MAX_TASKS) return NULL;

    TCB_t *tcb     = &tcb_pool[tcb_count++];
    memset(tcb, 0, sizeof(*tcb));

    tcb->stack_base = stack_buf;
    tcb->stack_size = stack_size;
    tcb->priority   = priority;
    tcb->name       = name;
    tcb->state      = TASK_READY;

    /* Calculate stack top and pre-fill the exception frame */
    uint32_t *stack_top = stack_buf + (stack_size / sizeof(uint32_t));
    tcb->saved_sp = stack_init(stack_top, func, arg);

    /* Insert into ready list, sorted by priority (lower number first) */
    TCB_t **pp = &ready_list_head;
    while (*pp && (*pp)->priority <= priority) {
        pp = &(*pp)->next;
    }
    tcb->next = *pp;
    *pp = tcb;

    return tcb;
}

/* -- Usage example -- */

/* Stack buffers — statically declared, sized per task's needs */
static uint32_t stack_led[256];    /*  256 words = 1024 bytes */
static uint32_t stack_uart[512];   /*  512 words = 2048 bytes */
static uint32_t stack_sensor[256];

/* Task functions — each written as a simple infinite loop */
void task_led(void *arg)
{
    (void)arg;
    while (1)
    {
        led_toggle();
        vTaskDelay(500);   /* yield CPU for 500 ticks — covered in Ch 5 */
    }
}

void task_uart(void *arg)
{
    (void)arg;
    uint8_t byte;
    while (1)
    {
        if (uart1_read_byte(&byte))
            uart1_send_byte(byte);
        vTaskDelay(1);
    }
}

void task_sensor(void *arg)
{
    (void)arg;
    while (1)
    {
        uint16_t adc_val = adc_read();
        process_sensor(adc_val);
        vTaskDelay(10);
    }
}

void rtos_main(void)
{
    /* Create tasks — each with its own private stack */
    task_create(task_led,    NULL, stack_led,    sizeof(stack_led),    2, "LED");
    task_create(task_uart,   NULL, stack_uart,   sizeof(stack_uart),   1, "UART");
    task_create(task_sensor, NULL, stack_sensor, sizeof(stack_sensor), 0, "Sensor");

    /* Start the scheduler — never returns */
    scheduler_start();
}
```

Notice how each task is now **sequential, readable code**. No state machines. No `if (elapsed >= 500)` checks. Each task just does its job and calls `vTaskDelay()` to yield. The RTOS handles the rest.

## The Ready List — How the Scheduler Sees Tasks

The scheduler maintains lists of TCBs. The simplest structure is a priority-sorted linked list of all READY tasks.

![Ready List](rtos/diagrams/ch3_ready_list.png){ width=75% }

## The Unsolved Tension

We now have tasks, each with its own stack, its own context, and written as simple sequential code. The illusion of parallelism is working. But a new question has emerged:

```
The Problem of "Who Runs Next?"
-------------------------------------------------------------------------

  Three tasks, all READY:
  +---------------+  +---------------+  +---------------+
  |  Sensor P=0   |  |  UART   P=1   |  |  LED    P=2   |
  |  READY        |  |  READY        |  |  READY        |
  +---------------+  +---------------+  +---------------+

  Questions that remain unanswered:
  1. Does Sensor run forever, starving UART and LED?
  2. How long does each task get before it is switched out?
  3. What if Sensor has nothing to do — does it still hold the CPU?
  4. Who triggers the switch — the task itself or the RTOS?
  5. What happens when two tasks have the same priority?

  These questions define SCHEDULING POLICY — the subject of Chapter 4.
-------------------------------------------------------------------------
```

*End of Chapter 3. We can create tasks, switch between them, and each task believes it runs alone. The missing piece is the policy that governs which task runs and for how long. That is the scheduler — and it is what Chapter 4 builds.*

> **Chapter 4 Preview — The Scheduler**
> We will implement preemptive and cooperative scheduling from scratch, understand the tick interrupt as a scheduling heartbeat, explore priority-based and round-robin policies, and see exactly what FreeRTOS's scheduler does inside `vTaskSwitchContext()`.
