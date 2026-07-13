
# User-Defined Data Types: Structures, Unions, and Enums

C provides fundamental primary data types (like `int`, `char`, `float`), but dealing with complex entities requires grouping multiple pieces of data together. For example, an Employee has an ID, a Name, and a Salary. Creating 100 distinct variables for 100 employees is terrible programming practice. Instead, C offers a provision to create User-Defined Data Types using three powerful keywords: `struct`, `union`, and `enum`. This chapter explores how to construct, align, pack, and manipulate these custom data structures to write modular and efficient programs.

*   [Introduction to Structures](#introduction-to-structures)
*   [Structure Initialization and Operations](#structure-initialization-and-operations)
*   [Structure Padding and Packing](#structure-padding-and-packing)
*   [Bit Fields](#bit-fields)
*   [Pointers and Operator Priority](#pointers-and-operator-priority)
*   [Containership and Nested Structures](#containership-and-nested-structures)
*   [Self-Referential Structures](#self-referential-structures)
*   [Array of Structures](#array-of-structures)
*   [Global and Local structure variable](#global-and-local-structure-variable)
*   [Typedef and Anonymous Structures](#typedef-and-anonymous-structures)
*   [Enumerations](#enumerations)
*   [Unions](#unions)

***

## Introduction to Structures

A structure is a user-defined data type that groups related variables under a single name. The variables declared inside a structure are strictly called **Structure Members**. Memory is allocated for the structure variable, *not* the structure members themselves.

Because memory is not dynamically allocated to members during definition,

*   Applying storage classes (like `auto`, `extern`, or `static`) directly to a structure member causes a compilation error.
*   Attempting to initialize a member with a default value inside the structure blueprint is strictly invalid.

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
|     char name[36];                 |   |     int id = 1;                    |
|     int salary;                    |   |                                    |
| };                                 |   |     // ERROR: Storage class        |
|                                    |   |     auto int salary;               |
| int main() {                       |   | };                                 |
|     struct emp e1;                 |   |                                    |
|     e1.id = 1;                     |   | int main() {                       |
|     e1.name = 'abc';               |   |     struct emp e1;                 |
|     e1.salary = 3000;              |   |     return 0;                      |
|     printf("%d", e1.id);           |   | }                                  |
|     return 0;                      |   |                                    |
| }                                  |   |                                    |
|      id     name      salary       |   |                                    |
|   ┌──────┬──────────┬─────────┐    |   |                                    |
|   │  1   │ abc      │  3000   │    |   |                                    |
|   └──────┴──────────┴─────────┘    |   |                                    |
|  500    502        538             |   |                                    | 
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**Key Summary: Introduction to Structures**

*   Structures group mixed data types into a single user-defined type.
*   Memory is allocated to the structure variable, never to the structure members.
*   The Dot (`.`) operator connects variables to members, while the Arrow (`->`) operator connects pointers to members.
*   Datatypes
    * Primary datatypes
        * int
        * char
        * float
        * double
    * Secondary datatypes
        * Derived datatypes
            * signed
            * unsigned
            * short
            * long
            * long long
            * pointers
            * Arrays
            * Strings
        * User-defined datatypes
            * Structures
            * Unions
            * Enums

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
| struct emp { int id; sal; };       |   | struct emp { int id; sal; };       |
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

struct config { int port; int timeout; int max_users; };

int main() {
    // Member by Member: uninitialized members default to garbage value
    struct config c1;
    c1.port = 8080;
    c1.timeout = 0;
    
    // Standard partial: unmentioned members default to 0
    struct config c2 = {8080, 0, 0}; 
    
    // Designated Initializer: Clean and robust mapping!
    struct config c3 = { .port = 8080, .max_users = 100 };
    
    printf("Port: %d, Timeout: %d\n", c3.port, c3.timeout); 
    // Prints: Port: 8080, Timeout: 0
    
    return 0;
}
```

```c
void main()
{
    struct emp e = {1, "abc", 3000};
    
    struct emp *ep; // structure Pointer / Employee Pointer
    ep = &e; 
    
    printf("%d", ep->id); // Outputs: 1
    
    ep->sal = ep->sal + 2000;
    
    printf("%d", ep->sal); // Outputs: 5000
    
    // ep->name[1] Evaluation:
    //
    // -> and [] have the same highest precedence, so it evaluates left-to-right.
    // First, it evaluates ep->name (which points to base address 502).
    // Then, the array index [1] is applied.
    //
    // ep->name[1] is equivalent to *(ep->name + 1)
    // Substituting addresses: *(502 + 1)
    // Evaluating the address gives the character at 503, which is 'b'.
    printf("%c", ep->name[1]); // Outputs: 'b'

/*
      ┌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ┐
           id             name                sal
      ┆ ┌──────┬────────────────────────┬──────────────┐  ┆
        │  1   │ abc                    │ 3000 -> 5000 │
      ┆ └──────┴────────────────────────┴──────────────┘  ┆
       500    502                      538
      └ ╌│╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ┘
         │
         │
    ep   │
 ┌─────┐ │
 │ 500 │─╯
 └─────┘
*/
}
```

**Key Summary: Structure Initialization and Operations**

*   Missing initialization values automatically default to `0` or `NULL`.
*   Directly comparing or adding two entire structure variables throws a compilation error.
*   Assignment (`=`) copies data cleanly from one structure to another member-by-member.

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

```c
struct A1
{
    int  i1;
    char c1;
    int  i2;
    char c2;
};

/*
Memory layout of struct A1

        i1       c1     holes        i2       c2     holes
   ┌───────────┬────┬───────────┬───────────┬────┬───────────┐
   │           │    │  3 Bytes  │           │    │  3 Bytes  │  (16) Bytes
   └───────────┴────┴───────────┴───────────┴────┴───────────┘
  500         504              508         512
   0                            8  <- Address Offset
*/

struct A2
{
    char c1;
    char c2;
    int  i1;
    int  i2;
};

/*
Memory layout of struct A2

     c1   c2   holes        i1          i2
   ┌────┬────┬─────────┬───────────┬───────────┐
   │    │    │ 2 Bytes │           │           │  (12) Bytes
   └────┴────┴─────────┴───────────┴───────────┘
  500  501            504         508
   0    1              4           8 <- Address Offset
*/


// Pack value always in power of 2 (1, 2, 4, 8 etc)
#pragma pack(1) // Disable padding entirely
struct A3
{
    char c1;
    char c2;
    int  i1;
    int  i2;
};
```

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

```text
Create a structure to store below information

1. Match type (2bits)
    - T20  = 0 (00)
    - ODI  = 1 (01)
    - Test = 2 (10)

2. Toss type (1 bit)
    - Head = 0 (0)
    - Tail = 1 (1)

3. Match status (3bits)
    - Scheduled = 0
    - Ongoing   = 1
    - Completed = 2
    - Abonded   = 3
    - Stopped   = 4

4. Match result (2 bits)
    - Won  = 0 (00)
    - Lost = 1 (01)
    - Draw = 2 (10)
```

+----------------------+---+----------------------+
| ```c                 |   | ```c                 |
|                      |   |                      |
| struct match {       |   | struct match {       |
|     int type;        |   |     int type:2;      |
|     int toss;        |   |     int toss:1;      |
|     int status;      |   |     int status:3;    |
|     int result;      |   |     int result:2;    |
| };                   |   | };                   |
| // 8 Bytes allocated |   | // 1 Bytes allocated |
|                      |   |                      |
| ```                  |   | ```                  |
+----------------------+---+----------------------+

```c
struct A
{
    int i:3;
    int j:2;
}; // 1 Bytes

void main()
{
    struct A a;
    a.i = 5;
    a.j = 1;
    printf("%d %d", a.i, a.j); // -3 1

/*
Memory layout of Structure A

                 -2   1  │ -4   2   1
                 -2¹  2⁰ │ -2²  2¹  2⁰
    ┌───┬───┬───┬───┬────┼────┬───┬───┐
    │   │   │   │ 0 │ 1  │ 1  │ 0 │ 1 │
    └───┴───┴───┴───┴────┴────┴───┴───┘
                ╰── j ───╯╰──── i ────╯
*/
}
```

```c
struct A
{
    signed i:3;
    unsigned j:3;
    signed k:2;
    unsigned l:2;
}; // 2 Bytes

void main()
{
    struct A a;
    a.i = a.j = 5;
    a.k = a.l = 1;
    
    printf("%d %u", a.i, a.j); // Outputs: -3 5
    printf("%d %u", a.k, a.l); // Outputs: 1 1
}

/*
Memory layout of Structure A

               2   1 │ -2   1 │  4   2   1 │ -4   2   1
        ... ─┬───┬───┼────┬───┼────┬───┬───┼────┬───┬───┐
             │ 0 │ 1 │  0 │ 1 │  1 │ 0 │ 1 │  1 │ 0 │ 1 │
        ... ─┴───┴───┴────┴───┴────┴───┴───┴────┴───┴───┘
             ╰── l ──╯╰── k ──╯╰──── j ────╯╰──── i ────╯
*/
```

```c
struct A
{
    int i:2;
    int j:20;
};
// Compilation error: bit field too large
```

```c
struct A
{
    int i:2;
    float f:20; 
};
// Bit field must be applicable for integral types
```

```c
struct A
{
    int i:2;
    int j:0; // named bit fields with zero is valid
    int k:3;
};
```

```c
struct A
{
    int i:3;
    int j:2;
    int  :3; // unnamed bit fields is valid
    int k:2;
    int l:6;
    int  :0; // unnamed bit fields is valid
    int m:2;
    int n:5;
    int  :1; // unnamed bit fields is valid
};

/*
                    min length  max length
unmamed bitfield        0          16/32
named bitfield          1          16/32
*/
```

```c
struct A
{
    int i:3;
    int j:-2; // Error min = 1 and max = 16/32
};
```

```c
void main()
{
    int a:3; // bitfileds only valid in struct and union
    a = 5;
    printf("%d", a);
}
```

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

int main()
{
    int val = 888;

    // Structure variable
    struct emp a;
    // Pointer to Structure variable
    struct emp *ap;
    // Pointer to pointer to Structure variable
    struct emp **app;

    a.id = 10;
    a.ip = &val;
    ap = &a;
    app = &ap;

/*
      app         ap   
    ┌─────┐    ┌─────┐
    │ 600 │───>│ 500 │─╮
    └─────┘    └─────┘ │
              600      │    ┌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ┐
                       │         id       ip
                       ╰─>  ┆ ┌──────┬──────────┐ ┆         val
                              │  10  │   100    │─┼─╮     ┌─────┐
                            ┆ └──────┴──────────┘ ┆ ╰─>   │ 888 │
                             500    502                   └─────┘
                            └ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ┘      100

*/
    /* --- Member access via Structure variable --- */

    // Output: 10 <addr> 888 888
    printf("%d %d %d %d\n", 
                            // Access non-pointer member
                            a.id,
                            // Access pointer
                            a.ip,
                            // Dereference pointer member
                            *a.ip, *(a.ip));

    /* --- Member access via Pointer to Structure variable --- */

    // Output: 10 10 <addr> 888 888
    printf("%d %d %d %d %d\n",
                               // Access non-pointer member
                               ap->id, (*ap).id,
                               // Access pointer
                               ap->ip,
                               // Dereference pointer member
                               *ap->ip, *(ap->ip));

    /* --- Member access via Pointer to Pointer to Structure variable --- */
    // Output: 10 10 <addr> <addr> 888 888
    printf("%d %d %d %d %d %d\n",
                               // Access non-pointer member
                               // Error: app->id,
                               // Error: *app->id,
                               (*app)->id, (**app).id,
                               // Access pointer
                               (*app)->ip, (**app).ip,
                               // Dereference pointer member
                               *(*app)->ip, *((*app)->ip)
                               );

    /* --- INVALID TRAPS (Uncommenting causes errors) --- */
    // ERROR: Pointer (ip) is bind with Structure. 
    // We can't dereference structure member alone
    //a.*ip;    
    //ap->*ip;
    
    // ERROR: Dot applies to pointer
    //*ap.id;
    //*(ap).id;

    return 0;
}
```

**Key Summary: Pointers and Operator Priority**

- `x.y` 
    - x = structure variable
    - y = structure member
- `x->y`
    - x = pointer to structure variable
    - y = structure member
- `(*x).y`
    - x = pointer to structure variable
    - y = structure member
- `*x.y`
    - x = structure variable
    - y = structure pointer member
- `*x->y`
    - x = pointer to structure variable
    - y = structure pointer member
- `(*x)->y`
    - x = pointer to pointer to structure variable
    - y = structure member
-  `(**x).y`
    - x = pointer to pointer to structure variable
    - y = structure pointer member

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

// Nested structure
struct org {
    char oname[20];
    char orgno[20];
    struct emp {
        int id;       
        char name[36];
        int salary;   
    }e; // <- This is mandatory to declare the name of the member of struct org
};

int main() {
    // Nested Initialization
    struct rect r1 = { {2, 5}, {7, 10} };
    // Struct Pointer Access
    struct rect *rp = &r1;

/*
       rp (struct rect *)
    ┌───────┐
    │  100  │─╮
    └───────┘ │
   500        │                 r1 (struct rect)
              │    ┌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ┐
              |    ┆ ╭─────── p1 ─────╮╭─────── p2 ──────╮ ┆
              │      ╭── x ──╮╭── y ──╮╭── x ──╮╭── y ───╮
              ╰─>  ┆ ┌────────┬────────┬────────┬────────┐ ┆
                     │   2    │   5    │   7    │   10   │
                   ┆ └────────┴────────┴────────┴────────┘ ┆
                    100      104      108      112          
                   └ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ┘
*/

    struct org org1 = { "ABC", "123", {1, "XYZ", 2000}};

/*
org1 (struct org)
   ╭─ oname[20] ─╮╭─ orgno[20] ─╮╭─────── e (struct emp) ──────────────╮
                                 ╭── id ──╮╭─── name[36] ─╮╭─ salary ──╮
   ┌─────────────┬──────────────┬─────────┬───────────────┬────────────┐  
   │ "ABC\0..."  │ "123\0..."   │    1    │   "XYZ\0..."  │    2000    │
   └─────────────┴──────────────┴─────────┴───────────────┴────────────┘  
  200           220            240       244                           280
*/

    // Accessing through the container
    printf("P1 X: %d\n", r1.p1.x);  // Prints: 2
    printf("id: %s\n", org1.oname); // Prints: ABC
    printf("id: %d\n", org1.e.id);  // Prints: 1
    
    // Arrow for 'rp', but 'p2' is a variable, so Dot for 'x'
    printf("P2 Y: %d\n", rp->p2.y); // Prints: 10
    printf("P2 Y: %d\n", (*rp).p2.y); // Prints: 10
    
    return 0;
}
```

```c
struct A {
    int x;
    int y;
};

struct B {
    struct A *pa;
    int i;
}

void main() {
    struct B b;
    struct B *pb;
    struct A a = {10, 20};

    b.pa = &a;
    b.i = 30;

/*
       pb (struct B *)
    ┌───────┐
    │  600  │─╮
    └───────┘ │
   700        │                  b (struct B)
              │    ┌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ┐
              │       ╭── pa ──╮ ╭─── i ───╮
              ╰─>  ┆ ┌──────────┬──────────┐ ┆
                     │   500    │    30    │
                   ┆ └──────────┴──────────┘ ┆
                    600        608
                   └ ╌ ╌ │╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌┘
                         │
                         │         a (struct A)
                         │  ┌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ┐
                         │    ╭── x ─╮ ╭── y ──╮
                         ╰─>┆┌────────┬────────┐┆
                             │   10   │   20   │
                            ┆└────────┴────────┘┆
                              500      504
                            └ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ┘
*/

    /* --- Member access via variable b --- */
    printf("%d %d", b.pa->x, (*b.pa).x); // 10
    printf("%d %d", b.pa->y, (*b.pa).y); // 20
    printf("%d", b.i);                   // 30

    /* --- Member access via variable pb --- */
    printf("%d", pb->pa->x);     // 10
    printf("%d", (*pb).pa->x);   // 10
    printf("%d", (*pb->pa).x);   // 10
    printf("%d", (*(*pb).pa).x); // 10

    printf("%d", pb->pa->y);     // 20
}
```

**Key Summary: Containership and Nested Structures**

*   Inner structures must be fully defined before being used inside outer structures.
*   Accessing deep parameters requires operator chaining (e.g., `r1.p1.x`).
*   If using a pointer to the outer container, only the first jump utilizes the Arrow operator (`rp->p2.y`).

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

```c

struct emp
{
    int id;
    char name[36];
    int salary;
    struct emp *next;
};

int main()
{
    struct emp e1;
    struct emp e2;
    struct emp e3;

    e1.id = 1;
    e2.id = 2;
    e3.id = 3;

    strcpy(e1.name, "aaa");
    strcpy(e2.name, "bbb");
    strcpy(e3.name, "ccc");

    e1.salary = 3000;
    e2.salary = 3000;
    e3.salary = 3000;

    e1.next = &e2;
    e2.next = &e3;
    e3.next = NULL;

    return 0;
}

#if 0
Memory layout of self-referential structure

       id      name       sal    next
    ┌───────┬──────────┬───────┬───────┐
    │   1   │   aaa    │ 3000  │  600  │─╮
    └───────┴──────────┴───────┴───────┘ │
   500     502        538     540        │
                                         │
 ╭───────────────────────────────────────╯
 │
 │     id      name       sal    next
 ╰─>┌───────┬──────────┬───────┬───────┐
    │   2   │   bbb    │ 3000  │  700  │─╮
    └───────┴──────────┴───────┴───────┘ │
   600     602        638     640        │
                                         │
 ╭───────────────────────────────────────╯
 │
 │     id      name       sal    next
 ╰─>┌───────┬──────────┬───────┬───────┐
    │   3   │   ccc    │ 3000  │ NULL  │
    └───────┴──────────┴───────┴───────┘
   700     702        738     740
#endif
```

**Key Summary: Self-Referential Structures**

*   A structure cannot contain a variable of its exact own type.
*   A structure can contain a pointer to its exact own type.
*   Self-Referential architectures link multiple disconnected structures together in dynamic memory (Linked Lists, Trees).

***

## Array of Structures

An array is a collection of similar data types. An Array of Structures operates identically but allocates chunks of contiguous memory per structure block. To iterate or manipulate arrays of structures safely, programmers use array indices mapped with pointers.

```c
struct emp {
    int id;
    char name[36];
    int sal;
};

void main() {
    // Array of 3 employee structures
    struct emp e[] = { 
        {1, "abc", 3000}, 
        {2, "def", 4000}, 
        {3, "ghi", 5000} 
    };
    
    struct emp *p;
    p = e; // p points to the base address of the array (e[0])

/*
p (struct emp *)
┌─────┐
│ 500 │─╮
└─────┘ │  ┌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ┐
        │  ┆ ╭────────  e[0] ────────╮ ╭───────── e[1] ────────╮ ╭───────── e[2] ────────╮ ┆
        │  ┆ ╭─ id ─╮╭─ name ─╮╭ sal ╮ ╭─ id ─╮╭─ name ─╮╭ sal ╮ ╭─ id ─╮╭─ name ─╮╭ sal ╮ ┆
        ╰─>┆ ┌──────┬─────────┬──────┐ ┌──────┬─────────┬──────┐ ┌──────┬─────────┬──────┐ ┆
           ┆ │  1   │ "abc\0" │ 3000 │ │  2   │ "def\0" │ 4000 │ │  3   │ "ghi\0" │ 5000 │ ┆
           ┆ └──────┴─────────┴──────┘ └──────┴─────────┴──────┘ └──────┴─────────┴──────┘ ┆
           ┆500    502       538      540    542       578      580    582       618       ┆ 
           └ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ╌ ┘
*/
```

1. **`++p->sal` $\Rightarrow$ 3001**

* **Evaluation:** `++(p->sal)`
* **Reason:** `->` has higher precedence. It fetches the salary of `e[0]` (3000) and then increments that integer value by 1.


2. **`(++p)->sal` $\Rightarrow$ 4000**

* **Evaluation:** The parentheses force the pointer `p` to increment first.
* **Reason:** `p` moves from address 500 to 540 (pointing to `e[1]`). It then fetches the salary at that new location (4000).


3. **`++p->name` $\Rightarrow$ C.E: L-values**

* **Evaluation:** `++(p->name)`
* **Reason:** It attempts to increment the base address of the character array (`name`). Array names act as constant pointers (non-modifiable l-values), triggering a compiler error.


4. **`(++p)->name` $\Rightarrow$ "def"**

* **Reason:** Increments the pointer to `e[1]`, then accesses the `name` array ("def").


5. **`e[p->id].name` $\Rightarrow$ "def"**

* **Evaluation:** `p->id` is evaluated first (which is 1).
* **Reason:** It resolves to `e[1].name`, which is "def".


6. **`e[--p->id].sal` $\Rightarrow$ 3000**

* **Evaluation:** `e[--(p->id)].sal`
* **Reason:** `->` evaluates first, getting `id` (which is 1). The prefix `--` decrements it to 0. It resolves to `e[0].sal`, which is 3000.

7. **`e[2].name[1]` $\Rightarrow$ `*(e[2].name + 1)`** (Demonstrates how array indexing is just syntactic sugar for pointer arithmetic).

8. **`(*p)->name` $\Rightarrow$ C.E** (Compiler Error. `*p` yields a `struct emp` value, not a pointer. The `->` operator requires a pointer on its left side).

9. **`*p->name` $\Rightarrow$ 'a'** (Evaluates as `*(p->name)`. Fetches the base address of the `name` array in `e[0]` and dereferences it to get the first character, 'a').

Incrementing a pointer interacting with an array of structures tests standard evaluation priorities.

```c
#include <stdio.h>

struct emp {
    int id;
    int salary;
};

int main() {
    struct emp arr[] = { {1, 1000}, {2, 2000}, {3, 3000} };
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

## Global and Local structure variable

- Global structure declaration is recommended practice

+---------------------------------+---+------------------------------------+
| ```c                            |   | ```c                               |
|                                 |   |                                    |
| // Global structure declaration |   | void main() {                      |
| struct emp {                    |   |     // Local structure declaration |
|     int id;                     |   |     struct emp {                   |
|     char name[36];              |   |         int id;                    |
|     int salary;                 |   |         char name[36];             |
| }                               |   |         int salary;                |
|                                 |   |     }                              |
| void main() {                   |   |                                    |
|     struct emp e; // Valid      |   |     struct emp e; // Valid         |
| }                               |   | }                                  |
|                                 |   |                                    |
| void test() {                   |   | void test() {                      |
|     struct emp e; // Valid      |   |     struct emp e; // Invalid       |
| }                               |   | }                                  |
|                                 |   |                                    |
| ```                             |   | ```                                |
+---------------------------------+---+------------------------------------+

- Never pass structure by value to another function

```c
struct emp {      
    int id;       
    char name[36];
    int salary;   
}

// Storage class: extern
// Memory layout: BSS
struct emp e1;

// Not recommended
void test_by_value(struct emp e) {
    /* Body */
}

// Recommended
void test_by_adress(struct emp e) {
    /* Body */
}

void main() {
    // Storage class: auto
    // Storag class : stack
    struct emp e2;
    test_by_value(e2);   // Not recommended
    test_by_address(e2); // Recommended
}
```

- Memory not allocated for structure members in declaration. But allocated for structure variables.

```c

// Here if memory is allocated in declaration we can directly assign values.
// But memory not allocated for structure members in declaration
// So, assignment in structure declaration is ERROR.

// Invalid Declaration
struct emp {      
    int id = 30;       
    char name[36] = "abc";
    int salary = 2000;   
}

// Since memory is not allocated storage class concept will not applicable for
// Structure members

// Invalid Declaration
struct emp {
    auto int a;
    static int b;
    register int c;
    extern int d;
}
```
***

## Typedef and Anonymous Structures

The `typedef` keyword provides a new alias name to an existing data type; it does not create a new type. In the industry, programmers heavily utilize `typedef` on structures to remove the requirement of typing the `struct` keyword repeatedly. 

A structure declared without a name is called an **Anonymous Structure**. You can only declare variables for it at the immediate closing brace. However, combining an Anonymous Structure with `typedef` creates a beautifully clean, industry-standard data type definition.

```c
/* --- Anonymous Structure --- */
struct 
{
    int id;
    char name[36];
    int salary;
} e1; // <- Variables are only able to create at this location

typedef struct 
{
    int id;
    char name[36];
    int salary;
} emp_noname_t; // <- Aliase name for Anonymous structure

/* --- Named structure --- */
struct emp
{
    int id;
    char name[36];
    int salary;
} e2; // <- Variables creation for named structure

typedef struct emp
{
    int id;
    char name[36];
    int salary;
} emp_t; // <- Aliase name for structure emp

void main()
{
    struct emp e3; // Variables creation for named structure
    emp_noname_t e4;
    emp_t e5;
}
```

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

```c
/*
Enum used to group named constants

Error: 404 -> Page not found
Error: 402 -> Server timeout
Error: 401 -> Conection lost
*/

enum error_status
{
    PAGE_NOT_FOUND = 404,
    SERVER_TIMEOUT = 402,
    CONNECTION_LOST = 401
}
```

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

```c
// Defining an enumeration with named constants
enum doorstatus
{
    LOCKED,   // 0
    UNLOCKED, // 1
    OPEN,     // 2  <-- named constants
    CLOSED    // 3
};

void main()
{
    enum doorstatus d1; // d1 is an enum Variable (acts like an int)
    
    d1 = OPEN;
    
    printf("%d", d1);   // Output: 2
    
    printf("%d", ++d1); // Output: 3 (Valid because d1 is a variable)
    
    printf("%d", ++OPEN); // Compiler Error (C.E): L-value required 
                          // (Invalid because OPEN is a constant, not a variable)
}
```

```c
// Enum Value Assignment
enum A { 
    a,      // 0
    b = 5,  // 5
    c,      // 6  (increments from previous)
    d = 3,  // 3
    e = -7, // -7
    f,      // -6 (increments from previous)
    g = 6   // 6
};
```

```c
// Invalid Enum Values
enum A { 
    a,          // 0
    b,          // 1
    c = 3.75,   // C.E (Compiler Error): floats are not allowed. 
    d           // const integer expression Req (Required)
};
```

```c
// Enumerator Example
enum month { JAN=1, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC };
// Note on board: electronic enumeration (enumerator)
```

```c
// Common Enum Examples & Anonymous Enums

enum Ligthstatus { OFF, ON };

enum bool { FALSE, TRUE };

enum { HEAD, TAIL }; // -> anonymous enum

enum { HEAD, TAIL } t1; // declaring a variable 't1' of an anonymous enum
```

```c
// Using typedef to create aliases for enums
typedef enum toss { HEAD, TAIL } TOSS;
typedef enum boole { TRUE, FALSE } bool_t;

// Enum demonstrating 16-bit integer overflow
enum A { 
    a = 32767, 
    b // Incrementing 32767 rolls over to -32768 in a 16-bit system
};

void main()
{
    enum A k; 
    
    k = b;
    
    printf("%d", k); // Output: -32768
}
```

```c
enum test {a, b, c, d};

printf("%d", sizeof(enum test));

/*
Output: 2 (or) 4

Concept: enum is alias to int

Size Ranges (depending on the compiler/architecture):
16-bit systems (2 bytes): -32768 to 32767
32-bit systems (4 bytes): -2147483648 to 2147483647
*/
```

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

```c
union U
{
    int i;
    char ch;
}; // 2 Bytes

void main()
{
    union U u;
    u.i = 515;
 /*
         ╭─────────────────────── i ──────────────────────╮
         ±2¹⁵                   2⁸ 2⁷                    2⁰
        ┌─────────────────────────┬────────────────────────┐
        │        0000 0010        │        0000 0011       │
        └─────────────────────────┴────────────────────────┘
        501                       500
                                  ╰────────── ch ──────────╯
                                  -2⁷                      2⁰
*/
    printf("%d %d", u.i, u.ch); // Outputs: 515 3

    u.ch = 'A';
 /*
         ╭─────────────────────── i ──────────────────────╮
         ±2¹⁵                   2⁸ 2⁷                    2⁰
        ┌─────────────────────────┬────────────────────────┐
        │        0000 0010        │        0100 0001       │
        └─────────────────────────┴────────────────────────┘
        501                       500
                                  ╰────────── ch ──────────╯
                                  -2⁷                      2⁰
*/
    printf("%d %d", u.i, u.ch); // Outputs: 577 65

}
```

```c
struct A
{
    int i;
    int j;
}; // 4 Bytes

struct B
{
    int x;
    char ch[2];
}; // 4 Bytes

union U
{
    struct A a;
    struct B b;
}; // 4 Bytes

void main()
{
    union U u;
    
    u.a.i = 512;
    u.a.j = 256;
    
    // Outputs: 512 0 1
    printf("%d %d %d", u.b.x, u.b.ch[0], u.b.ch[1]);

/*
       |<──────────────────── u.a ────────────────────>|
       |<─────── u.a.j ───────>|<─────── u.a.i ───────>|
       ┌───────────┬───────────┬───────────┬───────────┐
       │ 0000 0001 │ 0000 0000 │ 0000 0010 │ 0000 0000 │
       └───────────┴───────────┴───────────┴───────────┘
       |<─ ch[1] ─>|<─ ch[0] ─>|<─────── u.b.x ───────>|
       |<──────────────────── u.b ────────────────────>|
*/
}
```

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

While this sounds like a drawback, unions are heavily used in low-level parsing (like Network Protocols or IMEI validation). They allow a programmer to feed specific data pieces into separate internal variables, but instantly extract the entire overlapped block uniformly using a single overlapping output buffer.

```c
/*
IMEI Structure Breakdown

IMEI number => 16 characters total

2 characters => Country Code (cc)
2 characters => Manufacturer Code (mfc)
2 characters => Software Approval Reference (sar)
4 characters => Model Number (mn)
6 characters => Unique Serial Number (usn)
*/
```

+----------------------------------------+---+----------------------------------------+
| ```c                                   |   | ```c                                   |
|                                        |   |                                        |
| struct IMEI                            |   | union OIMEI                            |
| {                                      |   | {                                      |
|     char cc[2];                        |   |     struct IMEI                        |
|     char mfc[2];                       |   |     {                                  |
|     char sar[2];                       |   |         char cc[2];                    |
|     char mn[4];                        |   |         char mfc[2];                   |
|     char usn[6];                       |   |         char sar[2];                   |
| }; // 16 Bytes total                   |   |         char mn[4];                    |
|                                        |   |         char usn[6];                   |
| void main()                            |   |     } in; // 16 Bytes                  |
| {                                      |   |                                        |
|     struct IMEI i;                     |   |     char obuffer[16];                  |
|                                        |   | }; // 16 Bytes total                   |
|     strcpy(i.cc, "10");                |   |                                        |
|     strcpy(i.mfc, "35");               |   | void main()                            |
|     strcpy(i.sar, "12");               |   | {                                      |
|     strcpy(i.mn, "1769");              |   |     union OIMEI o;                     |
|     strcpy(i.usn, "1AB341");           |   |                                        |
|                                        |   |     strcpy(o.in.cc, "10");             |
|     // Outputs: 10351217691AB341       |   |     strcpy(o.in.mfc, "35");            |
|     printf("%s%s%s%s%s", i.cc, i.mfc,  |   |     strcpy(o.in.sar, "12");            |
|             i.sar, i.mn, i.usn);       |   |     strcpy(o.in.mn, "1769");           |
| /*                                     |   |     strcpy(o.in.usn, "1AB341");        |
|    cc     mfc    sar    mn     usn     |   |                                        |
| ┌──────┬──────┬──────┬──────┬────────┐ |   |     // Outputs 10351217691AB341        |
| │  10  │  35  │  12  │ 1769 │ 1AB341 │ |   |     printf("%s", o.obuffer);           |
| └──────┴──────┴──────┴──────┴────────┘ |   | }                                      |
|  2 char 2 char 2 char 4 char  6 char   |   | /*                                     |
| */                                     |   |    cc     mfc    sar    mn      usn    |
| }                                      |   | ┌──────┬──────┬──────┬──────┬────────┐ |
|                                        |   | │  10  │  35  │  12  │ 1769 │ 1AB341 │ |
| ```                                    |   | └──────┴──────┴──────┴──────┴────────┘ |
|                                        |   | |<────────── obuffer[16] ───────────>| |
|                                        |   | */                                     |
|                                        |   |                                        |
|                                        |   | ```                                    |
+----------------------------------------+---+----------------------------------------+

**Key Summary: Unions**

*   Allocates memory strictly equal to its largest member.
*   All members start at the exact same physical memory address.
*   Modifying one member inherently overwrites the data accessed by the other members.
