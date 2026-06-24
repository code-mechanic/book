# Dynamic Memory Allocation

C provides mechanisms to manage memory manually, allowing programs to be highly efficient and adaptable. Instead of fixing memory sizes beforehand, dynamic memory allocation allows a program to request exact memory amounts strictly during execution. To perform dynamic memory management, programmers utilize four essential predefined functions—`malloc`, `calloc`, `realloc`, and `free`—all of which are located within the `<stdlib.h>` library.

*   [Static vs Dynamic Memory Allocation](#static-vs-dynamic-memory-allocation)
*   [The malloc Function](#the-malloc-function)
*   [The free Function and Memory Leaks](#the-free-function-and-memory-leaks)
*   [Dangling Pointers and Double Free Errors](#dangling-pointers-and-double-free-errors)
*   [The calloc Function](#the-calloc-function)
*   [The realloc Function](#the-realloc-function)

***

## Static vs Dynamic Memory Allocation

There is a widespread misconception that standard variable declaration (like `int a;`) is "Compile-Time Memory Allocation". In C, memory is **never** actually allocated during compilation. Compilers merely note the scope and size requirements. Static memory allocation occurs strictly *after* compilation, but right *before* the `main` function begins executing. 

This means that for static variables, memory is compulsorily allocated even if the actual line of code is bypassed by flow control. In contrast, dynamic memory allocation happens strictly at **Runtime**—meaning memory is only requested from the heap manager if the specific execution flow physically reaches and triggers the function call.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* STATIC ALLOCATION (FIXED) */    |   | /* DYNAMIC ALLOCATION (RUNTIME) */ |
| #include <stdio.h>                 |   | #include <stdlib.h>                |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     // False condition!            |   |     // False condition!            |
|     if (2 > 3) {                   |   |     if (2 > 3) {                   |
|         // Memory IS allocated     |   |         // Memory NOT allocated    |
|         // before execution starts!|   |         // Function never runs!    |
|         int a;                     |   |         malloc(10);                |
|     }                              |   |     }                              |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

To prove that static memory is allocated before execution regardless of scope bypassing, we trace the default garbage values using the `goto` jump.

```c
#include <stdio.h>

int main() {
    int a = 10;
    goto inside; // Jump entirely over the nested block
    
    {
        // Compiler noted this scoped variable beforehand.
        // Memory was allocated and filled with a Garbage Value 
        // before main() even started executing!
        int a = 20; 
        
        inside:
        // Prints: Garbage Value (It completely ignores the 10!)
        printf("Inner a is: %d\n", a); 
    }
    
    return 0;
}
```

**Key Summary: Static vs Dynamic Memory Allocation**

*   Static allocation occurs *before* function execution on the Stack. Memory is guaranteed to be reserved even if the code block isn't executed.
*   Dynamic allocation occurs *during* execution on the Heap. If the code block is bypassed, zero memory is consumed.

***

## The malloc Function

The `malloc` (Memory Allocation) function requests a specific number of bytes from the Heap Manager. It takes exactly one argument: the number of bytes required (a positive `size_t` value). 

If the Heap Manager successfully finds contiguous space, it reserves the memory and returns the starting address. Because `malloc` does not know what data type the programmer intends to store in this space, its return type is strictly a `void *` (Generic Pointer). The programmer must manually typecast this address to the desired pointer type. The default value of memory allocated via `malloc` is pure Garbage Value.

If the Heap is completely full and memory cannot be allocated, `malloc` strictly returns `NULL`. Failing to check for this `NULL` return will cause catastrophic crashes if you attempt to assign data to it.

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    // HARD CODE: Requesting strictly 10 bytes
    // Typecasting void* to int*
    int *p1 = (int*)malloc(10); 
    
    // NULL check is mandatory to prevent crashes
    if (p1 == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }
    
    // SOFT CODE: Dynamically sizing based on variable inputs
    int n = 5;
    // Requests exactly enough memory for 5 integers (e.g., 5 * 2 = 10)
    int *p2 = (int*)malloc(n * sizeof(int));
    
    // Populating the dynamic memory
    for(int i = 0; i < n; i++) {
        *(p2 + i) = (i + 1) * 10;
        printf("%d ", *(p2 + i)); // 10 20 30 40 50
    }
    
    return 0;
}
```

**Key Summary: The malloc Function**

*   Takes one argument (total bytes) and allocates a single contiguous block.
*   Returns `void *` on success, or `NULL` on failure.
*   The default data inside the allocated block is a garbage value.
*   Soft coding (e.g., `n * sizeof(int)`) is standard practice to ensure cross-platform compatibility.

***

## The free Function and Memory Leaks

When a standard local variable finishes its scope, the compiler destroys it automatically. However, memory allocated dynamically on the Heap is **never** destroyed automatically. It persists until the program completely terminates, or until the programmer explicitly deletes it using the `free()` function.

If a programmer alters a pointer to point to a new dynamically allocated memory block without freeing the old block first, the address of the old block is permanently lost. This is called a **Memory Leak**. The memory remains reserved on the Heap, but the program is entirely unable to access it.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* MEMORY LEAK TRAP (BAD) */       |   | /* SAFE REALLOCATION (GOOD) */     |
| #include <stdlib.h>                |   | #include <stdlib.h>                |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     // Allocates 10 bytes at 500   |   |     // Allocates 10 bytes at 500   |
|     int *p = malloc(10);           |   |     int *p = malloc(10);           |
|                                    |   |                                    |
|     // Reassigns p to 600.         |   |     // Explicitly release 500!     |
|     // Address 500 is lost forever!|   |     free(p);                       |
|     // This is a MEMORY LEAK.      |   |                                    |
|     p = malloc(20);                |   |     // Safely reuse pointer for 600|
|                                    |   |     p = malloc(20);                |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

Alternatively, if you want to keep the old data alive while utilizing a new block, you must strictly create a temporary duplicate pointer (`int *t = p;`) before reassigning the primary pointer.

**How does `free` know the size?** 

A pointer only points to the first byte of data. When calling `free(p)`, the function successfully deletes the entire block (whether it was 10 bytes or 20 bytes) because `malloc` secretly allocates a hidden 2-byte "Header" immediately before the starting address. This header securely holds the size information of the allocated block, which the `free` function reads.

**Key Summary: The free Function and Memory Leaks**

*   Heap memory must be manually destroyed using `free()`.
*   A Memory Leak occurs when memory is reserved on the heap but its address is lost, rendering it inaccessible.
*   `free()` identifies how many bytes to destroy by reading a hidden header placed directly behind the starting address.

***

## Dangling Pointers and Double Free Errors

The `free()` function strictly destroys the memory located on the Heap. It **does not** destroy the actual pointer variable residing on the Stack. After freeing, the pointer variable still actively holds the old address (e.g., `500`). 

If you attempt to write data to this freed location (`*p = 10;`), you are accessing dead memory—this is known as a **Dangling Pointer** and results in a Segmentation Fault. 

Furthermore, if you attempt to call `free()` on the exact same pointer a second time, the program will crash with a **Double Free Error**. 

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* DOUBLE FREE & DANGLING (BAD) */ |   | /* SECURING THE POINTER (GOOD) */  |
| #include <stdlib.h>                |   | #include <stdlib.h>                |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     int *p = malloc(10);           |   |     int *p = malloc(10);           |
|                                    |   |                                    |
|     free(p); // Memory is deleted  |   |     free(p); // Memory is deleted  |
|                                    |   |                                    |
|     // TRAP 1: Dangling Pointer    |   |     // INSTANTLY SECURE IT!        |
|     *p = 10; // Seg Fault!         |   |     p = NULL;                      |
|                                    |   |                                    |
|     // TRAP 2: Double Free Error   |   |     // Freeing NULL does nothing.  |
|     free(p); // Crash!             |   |     // No double free crash!       |
|                                    |   |     free(p);                       |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**The Stack Targeting Trap:**

The `free()` function is explicitly designed to interact with Heap memory architectures. If you attempt to use `free()` on a pointer that targets a static stack variable (e.g., `int a = 10; int *p = &a; free(p);`), the application will immediately trigger a runtime error.

**Key Summary: Dangling Pointers and Double Free Errors**

*   A Dangling Pointer targets a dead, unreserved memory location.
*   A Double Free Error crashes the program when a freed address is freed again.
*   To prevent both traps, you must strictly assign `p = NULL;` immediately after every `free()` call.
*   `free()` can strictly only be utilized on Heap-allocated addresses.

***

## The calloc Function

The `calloc` (Contiguous Allocation) function is an alternative memory allocator. While `malloc` takes a single argument and defaults to garbage values, `calloc` takes strictly **two arguments**: the number of items, and the byte size of each item. 

Crucially, the default value of all memory allocated via `calloc` is initialized strictly to **zero**. 

As a standard industry practice, `calloc` is utilized when generating predefined primitive arrays (like integers), whereas `malloc` is reserved for complex user-defined data types (like Linked List structures).

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    // Allocates exactly 5 blocks. Each block is 2 (or 4) bytes.
    // 5 * sizeof(int) total bytes.
    int *p = (int*)calloc(5, sizeof(int));
    
    if (p != NULL) {
        // Output strictly proves calloc defaults to zero!
        for(int i = 0; i < 5; i++) {
            printf("%d ", *(p + i)); // Prints: 0 0 0 0 0
        }
        
        free(p);
        p = NULL;
    }
    return 0;
}
```

**Key Summary: The calloc Function**

*   Allocates contiguous blocks of memory using two arguments (`n_items`, `size_per_item`).
*   Automatically initializes all allocated memory to exactly `0`.
*   Returns `void *` on success, or `NULL` on failure (identical to `malloc`).

***

## The realloc Function

If a program allocates memory, populates it, and subsequently realizes the memory size is insufficient, destroying it and allocating a new block would delete all the populated data. To solve this, C provides the `realloc` (Re-Allocation) function.

`realloc(pointer, new_size)` alters the size of an existing dynamically allocated block. It strictly takes a pointer that was previously initialized by `malloc`, `calloc`, or `realloc`. 

**How realloc expands memory:**

1.  It checks if the contiguous adjacent memory bytes are free. If they are, it strictly expands the block in place.
2.  If the adjacent memory is occupied, it creates an entirely new block of the requested size elsewhere on the Heap.
3.  It safely copies the old data into the new block, automatically frees the old block, and returns the new starting address.

Any newly added bytes are filled strictly with **Garbage Values**.

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int *p = (int*)malloc(2 * sizeof(int));
    *p = 10;
    *(p + 1) = 20;
    
    // Expanding block to hold 5 integers safely
    p = (int*)realloc(p, 5 * sizeof(int));
    
    // Decreasing the block size is also perfectly valid
    // This forcibly deletes the data at the end of the block
    p = (int*)realloc(p, 1 * sizeof(int));
    
    // INTERVIEW TRICK: realloc as a free() replacement
    // Requesting 0 bytes forces realloc to destroy the memory block entirely
    p = (int*)realloc(p, 0); 
    p = NULL;
    
    return 0;
}
```

**Key Summary: The realloc Function**

*   Dynamically alters the size of existing memory blocks up or down.
*   Automatically handles data copying and old block deletion when moving addresses.
*   Any newly appended memory spaces default strictly to Garbage Values.
*   Executing `realloc(p, 0)` behaves exactly like executing `free(p)`.
