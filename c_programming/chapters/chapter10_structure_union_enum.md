
# User-Defined Data Types: Structures, Unions, and Enums

C provides fundamental primary data types (like `int`, `char`, `float`), but dealing with complex entities requires grouping multiple pieces of data together. For example, an Employee has an ID, a Name, and a Salary. Creating 100 distinct variables for 100 employees is terrible programming practice. Instead, C offers a provision to create User-Defined Data Types using three powerful keywords: `struct`, `union`, and `enum`. This chapter explores how to construct, align, pack, and manipulate these custom data structures to write modular and efficient programs.

*   [Introduction to Structures](#introduction-to-structures)
*   [Structure Initialization and Operations](#structure-initialization-and-operations)
*   [Structure Padding and Packing](#structure-padding-and-packing)
*   [Bit Fields](#bit-fields)
*   [Pointers and Operator Priority](#pointers-and-operator-priority)
*   [Containership and Nested Structures](#containership-and-nested-structures)
*   [Array of Structures](#array-of-structures)
*   [Self-Referential Structures](#self-referential-structures)
*   [Typedef and Anonymous Structures](#typedef-and-anonymous-structures)
*   [Enumerations](#enumerations)
*   [Unions](#unions)

***

## Introduction to Structures

A structure is a user-defined data type that groups related variables under a single name. The variables declared inside a structure are strictly called **Structure Members**. Memory is allocated for the structure variable, *not* the structure members themselves.

Because memory is not dynamically allocated to members during definition, applying storage classes (like `auto`, `extern`, or `static`) directly to a structure member causes a compilation error. Furthermore, attempting to initialize a member with a default value inside the structure blueprint is strictly invalid.

To access members, C provides two binary operators (member selector operators):

1.  **Dot Operator (`.`):** The left side must strictly be a structure *variable*.
2.  **Arrow Operator (`->`):** The left side must strictly be a structure *pointer*.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* VALID DEFINITION (GOOD) */      |   | /* INVALID DEFINITION (BAD) */     |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| struct emp {                       |   | struct emp {                       |
|     int id;                        |   |     // ERROR: Cannot initialize    |
|     char name;                 |   |     int id = 1;                    |
|     int salary;                    |   |                                    |
| };                                 |   |     // ERROR: Storage class        |
|                                    |   |     auto int salary;               |
| int main() {                       |   | };                                 |
|     struct emp e1;                 |   |                                    |
|     e1.id = 1;                     |   | int main() {                       |
|     printf("%d", e1.id);           |   |     struct emp e1;                 |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**Key Summary: Introduction to Structures**

*   Structures group mixed data types into a single user-defined type.
*   Memory is allocated to the structure variable, never to the structure members.
*   The Dot (`.`) operator connects variables to members, while the Arrow (`->`) operator connects pointers to members.

***

## Structure Initialization and Operations

Assigning values to a structure can be done member-by-member or via a grouped initialization block (`{}`). If you only know a few values at initialization, you can explicitly map them using the Dot Operator inside the initializer block. 

When performing operations between two structure variables, you must be extremely careful. The only universally valid operator between two complete structures is the **Assignment Operator (`=`)**, which performs a deep, member-by-member copy.

Relational comparison (`==`) or arithmetic addition (`+`) on entire structures is completely invalid because the compiler does not know which internal parameter determines "greater than" or "sum". You must explicitly perform math or comparisons on the individual members instead.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* VALID STRUCT OPS (GOOD) */      |   | /* INVALID STRUCT OPS (BAD) */     |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| struct emp { int id, sal; };       |   | struct emp { int id, sal; };       |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     struct emp e1 = {1, 3000};     |   |     struct emp e1 = {1, 3000};     |
|                                    |   |     struct emp e2 = {2, 5000};     |
|     // Assignment performs copy    |   |                                    |
|     struct emp e2 = e1;            |   |     // ERROR: Cannot use ==        |
|                                    |   |     // if (e1 == e2) { }           |
|     // Member math is valid        |   |                                    |
|     int total = e1.sal + e2.sal;   |   |     // ERROR: Cannot add structs   |
|     return 0;                      |   |     // struct emp e3 = e1 + e2;    |
| }                                  |   |     return 0;                      |
| ```                                |   | }                                  |
|                                    |   | ```                                |
+------------------------------------+---+------------------------------------+

For initializing partial structures efficiently, modern C relies on designated initializers:

```c
#include <stdio.h>

struct config {
    int port;
    int timeout;
    int max_users;
};

int main() {
    // Standard partial: unmentioned members default to 0
    struct config c1 = {8080, 0, 0}; 
    
    // Designated Initializer: Clean and robust mapping!
    struct config c2 = { .port = 8080, .max_users = 100 };
    
    printf("Port: %d, Timeout: %d\n", c2.port, c2.timeout); 
    // Prints: Port: 8080, Timeout: 0
    
    return 0;
}
```

**Key Summary: Structure Initialization and Operations**

*   Missing initialization values automatically default to `0` or `NULL`.
*   Directly comparing or adding two entire structure variables throws a compilation error.
*   Assignment (`=`) copies data cleanly from one structure to another member-by-member.

***

## Structure Padding and Packing

Compilers organize memory to optimize CPU fetching. Characters require a 1-byte offset, while integers require a 4-byte offset. If a `char` is followed immediately by an `int`, the compiler will forcefully inject empty, wasted bytes (Holes) between them to ensure the integer starts perfectly on a multiple of 4. 

This process of adding extra memory for alignment is called **Structure Padding**, and it increases the structure's overall size drastically. To save memory, programmers can rearrange members from smallest to largest (Structure Packing) or forcibly instruct the compiler to disable padding entirely.

Disabling padding is extremely critical when mapping structures to precise file headers or network packets (like an MP3 metadata header), where injected bytes would destroy the fixed binary template.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* PADDING PROVEN (WASTAGE) */     |   | /* FORCED PACKING (COMPACT) */     |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| struct pad {                       |   | // Force multiples of 1 byte       |
|     char c1;   // 1 byte           |   | #pragma pack(1)                    |
|     // 3 bytes wasted here!        |   | struct pack {                      |
|     int i1;    // 4 bytes          |   |     char c1;                       |
|     char c2;   // 1 byte           |   |     int i1;                        |
|     // 3 bytes wasted here!        |   |     char c2;                       |
| };                                 |   | };                                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     // Output: 12 bytes!           |   |     // Output: 6 bytes exactly!    |
|     printf("%lu", sizeof(struct    |   |     printf("%lu", sizeof(struct    |
|            pad));                  |   |            pack));                 |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**Key Summary: Structure Padding and Packing**

*   **Structure Padding:** The compiler injecting empty bytes to align memory for CPU speed.
*   **Structure Packing:** The programmer rearranging elements or using `#pragma pack(1)` to prioritize memory space over speed.
*   Padding must be disabled when processing strict byte streams like MP3 files.

***

## Bit Fields

By default, an `int` consumes 16 or 32 bits of memory. However, if a parameter strictly stores a value of `0` or `1` (like a toss result), allocating 16 bits is a massive waste of resources. 

C provides **Bit Fields** to reserve memory exactly down to the bit level. 

There are strict rules regarding Bit Fields:

1.  They strictly apply to integral types (no `float` or `double`).
2.  The size cannot be negative and cannot exceed the architecture's max integer bits (e.g., 16 or 32).
3.  **Unnamed Bit Fields:** By specifying `: 0;`, you can forcibly conclude the current byte and push the next parameter into a brand new memory byte.

If you omit the `unsigned` keyword, the compiler defaults the bit field to a **signed** format. The MSB (Most Significant Bit) acts as a negative weight, completely changing the output of small binary sequences.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* SIGNED BIT FIELD TRAP (BAD) */  |   | /* UNSIGNED BIT FIELD (GOOD) */    |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| struct bit_a {                     |   | struct bit_b {                     |
|     int i : 3; // Signed 3 bits    |   |     unsigned int i : 3; // Unsigned|
| };                                 |   | };                                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     struct bit_a a;                |   |     struct bit_b b;                |
|     a.i = 5;                       |   |     b.i = 5;                       |
|     // 5 is Binary 101.            |   |     // 5 is Binary 101.            |
|     // MSB '1' has weight -4.      |   |     // MSB '1' has weight +4.      |
|     // -4 + 1 = -3                 |   |     // 4 + 1 = 5                   |
|     printf("%d", a.i); // -3       |   |     printf("%d", b.i); // 5        |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

```c
#include <stdio.h>

struct match {
    unsigned int type : 2;   // T20, ODI, Test
    unsigned int toss : 1;   // Head, Tail
    unsigned int : 0;        // Unnamed boundary (forces new byte!)
    unsigned int status : 3; // Scheduled, Ongoing, Completed
    
    // ERROR: Bit field too large (max 32 on GCC)
    // unsigned int error_field : 40; 
};

int main() {
    printf("Bit Fields save memory significantly!\n");
    return 0;
}
```

**Key Summary: Bit Fields**

*   Reserves physical memory at the exact bit level using the syntax `type variable : bits;`.
*   Floating-point types and addresses (`&`) are completely invalid for bit fields.
*   Omitting `unsigned` creates signed bit fields where the MSB mathematically forces negative readouts.

***

## Pointers and Operator Priority

Accessing members via pointers heavily tests your knowledge of operator precedence. The Dot (`.`) and Arrow (`->`) operators both share the absolute highest precedence alongside Indexing (`[]`). If both appear together, execution parses strictly **left to right**.

When converting logic from a Pointer into a Variable notation, an explicit dereference `(*ep)` requires mandatory parentheses. Because the dot operator has higher priority than the indirection star (`*`), writing `*ep.id` fails completely, as the compiler attempts to apply the dot to `ep` *before* the star.

```c
#include <stdio.h>

struct emp {
    int id;
    int *ip;
};

int main() {
    int val = 888;
    struct emp a;
    a.id = 1;
    a.ip = &val;
    
    // Pointer to Structure
    struct emp *ep = &a;
    
    /* --- PRIORITY TRACING --- */
    // 1. ep->id
    printf("Arrow: %d\n", ep->id); 
    
    // 2. (*ep).id (Variable Conversion)
    printf("Dot Conversion: %d\n", (*ep).id);
    
    // 3. *ep->ip 
    // Left of arrow is 'ep'. Right is 'ip'. 
    // Resolves ep->ip to get address, THEN applies '*' to print 888.
    printf("Star Arrow: %d\n", *ep->ip);
    
    /* --- INVALID TRAPS (Uncommenting causes errors) --- */
    // *ep.id;   // ERROR: Dot applies to pointer ep.
    // ep->*ip;  // ERROR: Invalid syntax. Right of arrow must be member.
    
    return 0;
}
```

**Key Summary: Pointers and Operator Priority**

*   `*x.y` executes `.` first, then `*`.
*   `*x->y` executes `->` first, then `*`.
*   `x->y` is mathematically identical to `(*x).y`. The parentheses are mandatory.

***

## Containership and Nested Structures

Containership (or Composition) occurs when one structure acts as a member within another outer structure. For example, a graphical `Rectangle` requires points; instead of hard-coding coordinates, a `Rectangle` can simply contain four `Point` structure members.

When dealing with nested structures, initialization spans deeply using nested curly braces. To access the innermost data, the member selector operators are strictly chained from the outermost element inwards.

```c
#include <stdio.h>

// Inner Structure
struct point {
    int x;
    int y;
};

// Outer Structure containing Point variables
struct rect {
    struct point p1;
    struct point p2;
};

int main() {
    // Nested Initialization
    struct rect r1 = { {2, 5}, {7, 10} };
    
    // Accessing through the container
    printf("P1 X: %d\n", r1.p1.x); // Prints: 2
    
    // Struct Pointer Access
    struct rect *rp = &r1;
    
    // Arrow for 'rp', but 'p2' is a variable, so Dot for 'x'
    printf("P2 Y: %d\n", rp->p2.y); // Prints: 10
    
    return 0;
}
```

**Key Summary: Containership and Nested Structures**

*   Inner structures must be fully defined before being used inside outer structures.
*   Accessing deep parameters requires operator chaining (e.g., `r1.p1.x`).
*   If using a pointer to the outer container, only the first jump utilizes the Arrow operator (`rp->p2.y`).

***

## Array of Structures

An array is a collection of similar data types. An Array of Structures operates identically but allocates chunks of contiguous memory per structure block. To iterate or manipulate arrays of structures safely, programmers use array indices mapped with pointers.

Incrementing a pointer interacting with an array of structures tests standard evaluation priorities.

```c
#include <stdio.h>

struct emp {
    int id;
    int salary;
};

int main() {
    struct emp arr = { {1, 1000}, {2, 2000}, {3, 3000} };
    struct emp *p = arr; // Points to first employee
    
    // Priority: Arrow executes FIRST, then Increment
    // Extracts 1000, then increments the value to 1001. 
    // Pointer remains safely on Employee 1.
    int res1 = ++p->salary;
    printf("Increment Value: %d\n", res1); 
    
    // Priority: Brackets force pointer increment FIRST
    // Pointer jumps fully to Employee 2. Extracts 2000.
    int res2 = (++p)->salary;
    printf("Increment Pointer: %d\n", res2);
    
    return 0;
}
```

**Key Summary: Array of Structures**

*   Declaring `struct emp arr` creates a contiguous block equal to `3 * sizeof(struct emp)`.
*   Pointer arithmetic correctly jumps by the entire struct size (`p++` moves to the next employee).
*   `++p->sal` modifies the salary value; `(++p)->sal` modifies the pointer to the next employee.

***

## Self-Referential Structures

A structure **cannot** contain a standard variable of its own type. When the compiler parses a structure, it must dynamically calculate the size in bytes. If a structure embeds a variable of itself, the compiler triggers an infinite sizing loop.

However, a structure **can** contain a *pointer* of its own type. Because the size of any pointer is always fixed (e.g., 2 bytes or 4 bytes), the compiler effortlessly resolves the memory size. Creating a pointer of the same type inside a structure is called a **Self-Referential Structure**, and it forms the entire foundation of Linked List data structures.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* INVALID (INFINITE SIZE) */      |   | /* VALID (FIXED POINTER SIZE) */   |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| struct bad_node {                  |   | struct good_node {                 |
|     int data;                      |   |     int data;                      |
|     // ERROR: Size unknown!        |   |     // Points to same type!        |
|     struct bad_node next;          |   |     struct good_node *next;        |
| };                                 |   | };                                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     struct bad_node n1;            |   |     struct good_node n1;           |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**Key Summary: Self-Referential Structures**

*   A structure cannot contain a variable of its exact own type.
*   A structure can contain a pointer to its exact own type.
*   Self-Referential architectures link multiple disconnected structures together in dynamic memory (Linked Lists, Trees).

***

## Typedef and Anonymous Structures

The `typedef` keyword provides a new alias name to an existing data type; it does not create a new type. In the industry, programmers heavily utilize `typedef` on structures to remove the requirement of typing the `struct` keyword repeatedly. 

A structure declared without a name is called an **Anonymous Structure**. You can only declare variables for it at the immediate closing brace. However, combining an Anonymous Structure with `typedef` creates a beautifully clean, industry-standard data type definition.

```c
#include <stdio.h>

// Standard Industry Practice: Typedef Anonymous Struct
// Append _t to indicate it's a Type Def alias.
typedef struct {
    int x;
    int y;
} point_t;

int main() {
    // Clean variable declaration! No "struct" keyword needed.
    point_t p1 = {10, 20};
    
    printf("Point X: %d\n", p1.x);
    return 0;
}
```

**Key Summary: Typedef and Anonymous Structures**

*   `typedef` creates an alias name. Standard convention appends `_t`.
*   Structures without names are anonymous and bind strictly to the variables created at their closure.
*   Applying `typedef` to an anonymous structure provides an incredibly clean shorthand for future variable declarations.

***

## Enumerations

An Enumeration (`enum`) assigns user-readable symbolic names to integer constants, greatly improving code clarity. Internally, an `enum` is strictly aliased to an `int`, meaning they evaluate completely interchangeably with `%d` specifiers.

If values are omitted, the very first enumerator defaults to `0`, and all subsequent enumerators default to their `previous value + 1`.

Programmers can assign custom integer constants directly (`e = -7`). Duplicate values across different enumerators are completely legal, but using `float` constants is strictly prohibited and throws an error.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* VALID ENUM LOGIC (GOOD) */      |   | /* INVALID ENUM TRAPS (BAD) */     |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| enum status {                      |   | enum status {                      |
|     LOCKED,     // 0               |   |     // ERROR: Floats invalid       |
|     UNLOCKED=5, // 5               |   |     // LOCKED = 3.5,               |
|     OPEN,       // 6               |   |                                    |
|     CLOSED=5    // 5 (Duplicate)   |   |     // ERROR: Cannot increment     |
| };                                 |   |     // a constant directly!        |
|                                    |   |     // UNLOCKED++                  |
| int main() {                       |   | };                                 |
|     enum status d1 = OPEN;         |   |                                    |
|     printf("%d", d1); // 6         |   | int main() {                       |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**Key Summary: Enumerations**

*   Groups integer constants under descriptive uppercase labels.
*   Values auto-increment. First value initializes strictly at `0` unless overridden.
*   Enums cannot hold floats, and their constant labels cannot be mathematically mutated (e.g., `OPEN++`).

***

## Unions

A `union` shares similar syntax to a `struct`, but operates entirely differently at the memory level. 

*   **Structure Size:** The sum of all its members (plus padding). All members occupy separate, unique memory addresses.
*   **Union Size:** Strictly matches the size of its *largest* single member. All members physically share the exact same starting memory address.

Because all variables overlap in a union, modifying one variable instantly corrupts or mutates the other variables. 

While this sounds like a drawback, unions are heavily used in low-level parsing (like Network Protocols or IMEI validation). They allow a programmer to feed specific data pieces into separate internal variables, but instantly extract the entire overlapped block uniformly using a single overlapping output buffer.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* STRUCTURE: SEPARATE MEMORY */   |   | /* UNION: SHARED OVERLAP */        |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| struct test_s {                    |   | union test_u {                     |
|     int a; // 4 bytes              |   |     int a; // 4 bytes              |
|     int b; // 4 bytes              |   |     int b; // 4 bytes              |
| };                                 |   | };                                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     struct test_s t;               |   |     union test_u u;                |
|     t.a = 10;                      |   |     u.a = 10;                      |
|     t.b = 20;                      |   |     u.b = 20; // Overwrites 'a'!   |
|                                    |   |                                    |
|     printf("%d", t.a); // 10       |   |     printf("%d", u.a); // 20       |
|     // Size: 8 bytes               |   |     // Size: 4 bytes               |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

```c
#include <stdio.h>

// IMEI Network Parser Logic Using Unions
union imei_parser {
    struct {
        char country_code;
        char vendor_code;
        char unique_serial;
    } in;
    
    // The exact same memory bytes accessed as a unified string!
    char output_buffer;
};

int main() {
    printf("Unions brilliantly pack multi-source data into single buffers!\n");
    return 0;
}
```

**Key Summary: Unions**

*   Allocates memory strictly equal to its largest member.
*   All members start at the exact same physical memory address.
*   Modifying one member inherently overwrites the data accessed by the other members.
