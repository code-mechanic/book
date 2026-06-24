# Arrays and Pointers

When managing massive datasets, such as storing 100 employee IDs, manually defining 100 distinct variables (`int id1, id2...`) is an impossible programming practice. Whenever an application requires $N$ variables of the exact same data type to perform a common job, C programmers utilize Arrays. An array strictly provides an indexed collection of homogeneous (same type) elements stored in a contiguous, sequential memory location. Because arrays are intrinsically bound to memory addresses, mastering arrays requires a deep, unified understanding of pointer mechanics, base addresses, and pointer arithmetic.

*   [Array Declarations and Limitations](#array-declarations-and-limitations)
*   [Array Initialization and Boundary Rules](#array-initialization-and-boundary-rules)
*   [Pointers and 1D Arrays](#pointers-and-1d-arrays)
*   [The Exception Rule: sizeof and Address-of](#the-exception-rule-sizeof-and-address-of)
*   [Two-Dimensional Arrays](#two-dimensional-arrays)
*   [Three-Dimensional Arrays](#three-dimensional-arrays)
*   [Array of Pointers vs Pointer to an Array](#array-of-pointers-vs-pointer-to-an-array)
*   [Pre and Post Increment on Pointers](#pre-and-post-increment-on-pointers)
*   [Passing Arrays to Functions](#passing-arrays-to-functions)
*   [Static and Global Initialization Rules](#static-and-global-initialization-rules)

***

## Array Declarations and Limitations

When you declare `int a;`, the compiler internally provisions exactly five integer variables (`a` through `a`) placed continuously in memory. If the starting address is `500`, the next integer occupies `502`, then `504`, assuming a 2-byte integer architecture. 

Array dimensions and boundaries are evaluated carefully by the compiler. While standard arrays use positive constant sizes, C compiler versions (C89 vs C99) and distinct architectures (Turbo C vs GCC) react differently to extreme or variable definitions.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* VALID DECLARATIONS (GOOD) */    |   | /* INVALID DECLARATIONS (BAD) */   |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     // Mathematical constants      |   |     // ERROR: Negative size        |
|     int a1[3 + 2];                 |   |     // int bad1[-5];               |
|                                    |   |                                    |
|     // ASCII conversion (97)       |   |     // ERROR: Size is mandatory    |
|     int a2['a'];                   |   |     // int bad2[];                 |
|                                    |   |                                    |
|     // Float truncates to 4        |   |     // ERROR: Float size           |
|     int a3[(int)4.5];              |   |     // int bad3[2.5];              |
|                                    |   |                                    |
|     // Evaluates to 1 (True)       |   |     int size = 10;                 |
|     int a4[4 > 3];                 |   |     // C89 Error, C99 Valid        |
|     return 0;                      |   |     // int bad4[size];             |
| }                                  |   |     return 0;                      |
| ```                                |   | }                                  |
|                                    |   | ```                                |
+------------------------------------+---+------------------------------------+

An array size of `40000` integers consumes 80,000 bytes. This causes compilation failure in Turbo C (which only tracks 65,535 addresses) but easily compiles in 32-bit GCC architectures.

**Key Summary: Array Declarations and Limitations**

*   Array elements strictly reside in contiguous memory locations.
*   Array sizing strictly demands constant expressions (C89). Variable Length Arrays (VLAs) only became valid in C99.
*   Negative indexes or pure float dimensions fail compiler validation entirely.

***

## Array Initialization and Boundary Rules

To populate arrays, programmers either assign values index-by-index or utilize a grouped initializer block `{}`. 
In C, **there is absolutely no boundary checking** during assignment. If you define a 5-element array and attempt to assign a value to index 50 (`a = 20;`), the compiler will happily overwrite unreserved adjacent memory, causing massive runtime vulnerabilities.

```c
#include <stdio.h>

int main() {
    // 1. Partial Initialization: Unmentioned elements strictly default to 0
    int a = {10, 20, 30}; // a and a are strictly 0.
    
    // 2. Omitted Size: The compiler accurately sizes the array to 3 elements
    int b[] = {10, 20, 30}; 
    
    // 3. Runtime Scanning via Loops (Standard best practice)
    int c;
    for (int i = 0; i < 3; i++) {
        c[i] = i * 10; 
    }
    
    /* INVALID TRAPS (Uncommenting causes compilation errors):
       int x = 10, y = 20;
       int err1[] = {x, y}; // Error: Initializers must be constants.
       
       int err2 = {1, 2, 3}; // Error: Too many initializers.
    */
    
    return 0;
}
```

**Key Summary: Array Initialization and Boundary Rules**

*   Missing initialization values in an initializer block automatically default to `0`.
*   If an initializer block is present, the array size in the brackets becomes strictly optional.
*   Array initializers must be pure constant expressions; standard variables (`x`, `y`) are invalid.

***

## Pointers and 1D Arrays

The absolute core rule of C array architecture is: **The array name will always strictly contain the address of the first element**. Because `A` represents an address (`&A`), the compiler implicitly treats `A` as a constant pointer. 

Because `A` is permanently fixed to the start of its contiguous block, applying increment (`++A`), decrement (`--A`), or assignment (`A = B`) operations to an array name immediately throws an **L-value required** compilation error. You cannot move the base pointer.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* L-VALUE TRAP (BAD) */           |   | /* SAFE POINTER USE (GOOD) */      |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     int a = {10, 20, 30};       |   |     int a = {10, 20, 30};       |
|     int b = {40, 50, 60};       |   |                                    |
|                                    |   |     // Safe: Use a normal pointer  |
|     // ERROR: Array base is fixed  |   |     int *p = a;                    |
|     // a++;                        |   |                                    |
|                                    |   |     // Pointers are mutable!       |
|     // ERROR: Cannot reassign array|   |     p++;                           |
|     // a = b;                      |   |     p = b;                         |
|                                    |   |                                    |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

Every array index operation is secretly intercepted by the compiler and rewritten into pointer arithmetic. `A[i]` is internally rewritten strictly as `*(A + i)`. Because addition is commutative (`A + i` is equal to `i + A`), indexing the value backwards (`i[A]`) is perfectly valid in C!

```c
#include <stdio.h>

int main() {
    int a = {4, 14, 24, 34}; // Let base address 'a' be 500
    
    // 1. Standard index processing: *(500 + 2) -> 24
    printf("a: %d\n", a); 
    
    // 2. Direct Pointer Arithmetic
    printf("*(a + 2): %d\n", *(a + 2)); 
    
    // 3. The Reverse Index Trick! 
    // 2[a] rewrites as *(2 + a), which is mathematically identical.
    printf("2[a]: %d\n", 2[a]); 
    
    // 4. Pointer Indexing with Negative Offsets
    int *p = a + 2; // p is now at 504 (value 24)
    // p[-1] evaluates to *(p - 1) -> moves back to 502 (value 14)
    printf("p[-1]: %d\n", p[-1]); 
    
    return 0;
}
```

**Key Summary: Pointers and 1D Arrays**

*   Array names perpetually point to their starting base address.
*   Incrementing or assigning to an array name causes fatal L-value errors.
*   Array expressions natively execute as pointer logic due to the Base Pointer property (`A[i] == *(A + i)`).
*   Indices strictly begin at `0` because `*(A + 0)` points exactly at the unmodified base address.

***

## The Exception Rule: sizeof and Address-of

Array names continuously decay into standard pointers across nearly all C operations. However, there are exactly **two strict exceptions** where the array name acts specifically as the entire physical array structure:

1.  When subjected to the `sizeof()` operator.
2.  When subjected to the Address-Of (`&`) operator.

`A` contains the address of the first integer element (`int *`). `&A` contains the exact same memory address, but its type encompasses the **entire array** (`int (*)`). Therefore, adding `+1` to them produces completely different memory offsets.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* BASE POINTER DECAY */           |   | /* THE EXCEPTION OPERATORS */      |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     int a = {1, 2, 3, 4, 5};    |   |     int a = {1, 2, 3, 4, 5};    |
|                                    |   |                                    |
|     // 'a' acts as int pointer.    |   |     // Exception 1: Sizeof Array   |
|     // +1 jumps 1 int (2 bytes).   |   |     // Yields 10 bytes             |
|     printf("a + 1: %u\n", a + 1);  |   |     int sz = sizeof(a);            |
|                                    |   |                                    |
|     // +1 operator triggers decay! |   |     // Exception 2: Address-Of     |
|     // sizeof(int *) yields 2 bytes|   |     // +1 jumps 5 ints (10 bytes!) |
|     int p_sz = sizeof(a + 1);      |   |     printf("&a + 1: %u\n", &a + 1);|
|                                    |   |     return 0;                      |
|     return 0;                      |   | }                                  |
| }                                  |   |                                    |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**Key Summary: The Exception Rule**

*   `A` and `&A` output the exact same physical memory address, but behave uniquely under pointer math.
*   `A + 1` skips one element (like walking one flat).
*   `&A + 1` completely skips the entire array block (like walking to the next apartment block).

***

## Two-Dimensional Arrays

Whenever a programmer needs to store values cross-referenced by two parameters (e.g., matching a Student ID to a specific Branch ID), 2D Arrays are required. 2D Arrays act as Matrices constructed using "Rows" and "Columns".

In 2D Arrays, the array name strictly contains the **first row address**, not the first element address. For the compiler to allocate row boundaries correctly during initialization, **the column size is explicitly mandatory**, while the row size remains optional.

```c
#include <stdio.h>

int main() {
    // Row size is optional; Column size is strictly mandatory.
    int a[] = { 
        {4, 14, 24, 34}, // Row 0
        {6, 16, 26, 36}, // Row 1
        {9, 29, 39}      // Row 2 (Partial init: last column is 0)
    };
    
    // In a 2D Array, 'a' contains the First Row Address.
    // +1 increments to the entire Next Row Address!
    printf("Next Row Addr: %u\n", a + 1); 
    
    // Star applied to a Row Address returns the Column Address.
    printf("Col Addr: %u\n", *(a + 1)); 
    
    // Star applied to a Column Address finally yields the Value!
    printf("Value: %d\n", *(*(a + 1) + 2)); // a -> 26
    
    return 0;
}
```

**Key Summary: Two-Dimensional Arrays**

*   In C, 2D arrays are populated strictly sequentially (Row-Major Order).
*   Initialization boundary rule: `int a[][]` fails, `int a[]` compiles perfectly.
*   `A` = Row Address. `*A` = Column Address. `**A` = Value. To extract integer data from a 2D array, you must explicitly apply two dereference stars.

***

## Three-Dimensional Arrays

A 3D Array extends logic by grouping multiple 2D matrices together into distinct **Blocks**. `int A` denotes 3 Blocks, where each Block has 4 Rows, and each Row has 5 Columns.

If 2D arrays require 2 stars, a 3D array (`A[i][j][k]`) internally translates to exactly three cascading indirection layers: `*(*(*(A + i) + j) + k)`. 

```c
#include <stdio.h>

int main() {
    // 2 Blocks. Each block has 3 rows of 4 columns.
    int a = {
        { // Block 0
            {1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}
        },
        { // Block 1
            {13, 14, 15, 16}, {17, 18, 19, 20}, {21, 22, 23, 24}
        }
    };
    
    // 'a' = Block Address. +1 moves to Block 1.
    // Star yields Row Address. +2 moves to Row 2.
    // Star yields Column Address. +3 moves to Col 3.
    // Final Star yields the integer value (24).
    int val = *(*(*(a + 1) + 2) + 3); 
    
    printf("a is: %d\n", val); // 24
    return 0;
}
```

**Key Summary: Three-Dimensional Arrays**

*   `A` contains the first Block Address.
*   `Block + 1` skips an entire matrix block.
*   During initialization, only the outermost Block size is optional. Rows and Columns must be strictly defined.

***

## Array of Pointers vs Pointer to an Array

When parsing complex pointer and array associations, programmers utilize the **Right-Left Rule**: Start at the variable, evaluate the right symbol, then evaluate the left symbol. Parentheses forcibly disrupt this priority.

*   `int *P;` -> P is an **Array** (right) of **Pointers** (left) to integers.
*   `int (*P);` -> P is a **Pointer** (parentheses) to an **Array** (right) of integers.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* ARRAY OF POINTERS */            |   | /* POINTER TO AN ARRAY */          |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     int a = 10, b = 20, c = 30;    |   |     int a = {10, 20, 30};       |
|                                    |   |                                    |
|     // Array holding addresses     |   |     // Pointer holding Array addr  |
|     int *P;                     |   |     int (*P);                   |
|                                    |   |                                    |
|     P = &a;                     |   |     // Pointing to entire array    |
|     P = &b;                     |   |     P = &a;                        |
|                                    |   |                                    |
|     // Accessing value             |   |     // Accessing value             |
|     printf("%d\n", *P); // 10   |   |     printf("%d\n", (*P)); // 10 |
|                                    |   |                                    |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**Key Summary: Array of Pointers vs Pointer to an Array**

*   Brackets `[]` have strictly higher precedence than the `*` symbol.
*   If you assign an entire array's address (`&a`) to a variable, that variable must be structured as a Pointer to an Array (`int (*p)[size]`).

***

## Pre and Post Increment on Pointers

Combining pointer indirection (`*`) with increment operations (`++`) introduces significant priority battles. Both operators inherently share identical precedence, forcing the compiler to parse them strictly from Right to Left.

```c
#include <stdio.h>

int main() {
    int a[] = {10, 20, 30};
    int *p = a; // Let 'p' be at 500
    
    // 1. Pre-Increment Address
    // ++ evaluates first, pushing pointer to 502. 
    // Star extracts 20.
    int b = *++p; 
    
    // Reset
    p = a; 
    
    // 2. Pre-Increment Value
    // Parentheses force star to extract 10 first.
    // ++ increments 10 to 11. Array is mutated!
    int c = ++(*p); 
    
    // Reset
    p = a; 
    
    // 3. Post-Increment Address (Crucial Trap)
    // Post-++ operates on pointer AFTER expression finishes.
    // Extracts 10 to 'd'. THEN increments pointer to 502!
    int d = *p++; 
    
    // Reset
    p = a;
    
    // 4. Post-Increment Value
    // Parentheses force star. Extracts 10 to 'e'.
    // THEN increments 10 to 11. Array is mutated!
    int e = (*p)++; 
    
    return 0;
}
```

**Key Summary: Pre and Post Increment on Pointers**

*   `*p++` retrieves the value currently at `p`, and sequentially pushes the pointer down memory. It specifically does **not** increment the extracted integer.
*   Applying parentheses around the pointer `(*p)++` forces the increment sequence into the physical target data.

***

## Passing Arrays to Functions

When you pass an array name (e.g., `test(A);`) into a function, the compiler intentionally decays it into a pointer carrying the Base Address. Therefore, arrays are fundamentally passed "By Reference".

To handle higher dimensions, the receiving pointer strictly drops exactly one dimension:

*   **1D Array:** Handled by a normal Pointer (`int *p`).
*   **2D Array:** Handled by a Pointer to a 1D Array (`int (*p)[cols]`).
*   **3D Array:** Handled by a Pointer to a 2D Array (`int (*p)[rows][cols]`).

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* 1D DECAY SIGNATURE */           |   | /* 2D DECAY SIGNATURE */           |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| // Syntax `int p[]` evaluates to   |   | // The column size must remain |
| // `int *p`. The is ignored!   |   | // to calculate boundary jumps!    |
| void test1D(int p) {            |   | void test2D(int (*p)) {         |
|     printf("%d\n", p);          |   |     printf("%d\n", p);       |
| }                                  |   | }                                  |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     int a = {1, 2, 3};          |   |     int a = {{1}};           |
|     test1D(a);                     |   |     test2D(a);                     |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**Key Summary: Passing Arrays to Functions**

*   Because arrays degrade into pointers as arguments, the receiving function loses all `sizeof()` sizing context. `sizeof(p)` strictly returns the byte size of a memory pointer.
*   Passing an N-Dimensional array parameterizes to a Pointer pointing strictly to an (N-1) Dimensional structure.

***

## Static and Global Initialization Rules

The C build pipeline compiles code, links files, and subsequently leverages the Loader to place the application into RAM. The Loader provisions External (Global) variables and `static` variables instantly at startup. 

Because Loaders possess absolutely zero concept of runtime execution flow, you cannot initialize a Global or Static variable to an `auto` (local) variable, as the `auto` variable hasn't been spawned yet.

```c
#include <stdio.h>

int a = 10; 

// VALID: Initializes using a Constant Value
int b = 20; 

// INVALID (Compilation Error): 'b' is a variable resolved at runtime. 
// Loader cannot assign it to 'c' during start-up.
// int c = b; 

// VALID: External Address is a constant expression!
int *p = &a; 

int main() {
    // Local scope lacks these loading limitations.
    int local_a = 50;
    
    // ERROR: Static variables adhere to loader rules.
    // static int local_static = local_a;
    
    printf("Values loaded correctly.\n");
    return 0;
}
```

**Key Summary: Static and Global Initialization Rules**

*   Global and Static variables rigorously demand constant expressions.
*   Acceptable constants strictly include: Constant Values (5), Constant Math (2+3), External Variable Addresses (`&a`), and Static Variable Addresses.
*   Standard local (`auto`) variables lack these startup limitations because they are pushed dynamically onto the Stack during function execution.
