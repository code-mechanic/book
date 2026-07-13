# Preprocessor Directives

Before C code is compiled into machine language, it undergoes a crucial intermediate step called Pre-processing. Any statement in C starting with the hash symbol (`#`) is a Preprocessor Directive. These directives do not perform mathematical computing; they strictly perform text and token substitutions, code inclusion, and conditional code filtering. This chapter explores macros, the complete build process, file inclusions, and how conditional compilation makes C capable of hardware-specific optimizations.

*   [The Build Process](#the-build-process)
*   Macros
    *   [Macros and Token Replacement](#macros-and-token-replacement)
    *   [Macro Parsing Traps](#macro-parsing-traps)
    *   [Macro Scope and Redefinition](#macro-scope-and-redefinition)
    *   [Macros vs Const, Typedef, and Functions](#macros-vs-const-typedef-and-functions)
    *   [Nested Macros](#nested-macros)
    *   [Stringification and Token Pasting](#stringification-and-token-pasting)
*   [Conditional Compilation](#conditional-compilation)
*   [File Inclusion and Header Guards](#file-inclusion-and-header-guards)
*   [Miscellaneous Directives](#miscellaneous-directives)

***

## The Build Process

Writing code is only the first step. Converting human-readable `.c` files into a binary executable involves a multi-staged pipeline known as the Build Process. 

The standard build process flows through these strict stages:

1.  **Source Code (`.c`):** Written by the programmer.
2.  **Preprocessor:** Processes all `#` directives. Generates "Expanded Source Code" (intermediate code) where macros and included files are entirely pasted in.
3.  **Compiler:** Verifies syntax and converts the expanded source code into Assembly Language.
4.  **Assembler:** Converts Assembly into Object Code (machine-level instructions).
5.  **Linker:** Combines multiple object codes and library files to generate the final Executable Code (`.exe`, `.out`).
6.  **Loader:** Loads the executable from secondary memory (hard drive) into main memory (RAM) for execution. In embedded systems loader are nothing but flasher tool which is used to program microcontroller.
7. **Debugger:** In host application (linux / windows) gdb software will be used to debug program. In Embedded system additional hardware is required (JTAG) to debug program in microcontroller.

![Build Process](c_programming/diagrams/chapter13_macros/compilation_process.png)

**Key Summary: The Build Process**

*   Preprocessors are executed *before* the compiler ever sees the code.
*   The preprocessor expands the source code, meaning memory is not allocated during this phase.
*   Integrated Development Environments (IDEs) bundle the preprocessor, compiler, assembler, linker, and debugger into a single application.

***

## Macros and Token Replacement

A macro is a preprocessor directive defined using `#define`. Its strict mathematical definition is **Token Replacement**, not just text replacement. The preprocessor actively searches for isolated tokens and swaps them with the defined expansion before compilation.

Macros are divided into two categories:

*   **Normal Macro:** Takes no arguments (e.g., `#define I 5`).
*   **Argumented Macro:** Takes parameters to behave dynamically (e.g., `#define SQUARE(x) x * x`).

```c
#include <stdio.h>

/* Normal Macro */
#define I 5 

/* Argumented Macro */
#define SQUARE(x) x * x 

int main() {
    // 'I' token is safely replaced with 5
    int a = I; 
    
    // SQUARE(4) token is safely replaced with 4 * 4
    int b = SQUARE(4); 
    
    printf("a: %d, b: %d\n", a, b); // Prints: 5, 16
    return 0;
}
```

**Key Summary: Macros and Token Replacement**

*   Macros strictly perform token replacement before compilation.
*   Because macros simply copy-paste tokens, they do not reserve memory or evaluate data types.
*   Nested macros are allowed: One macro template can be part of another macro's expansion.

***

## Macro Parsing Traps

Because macros blindly replace tokens without computing math or checking types, they introduce extremely dangerous syntax traps if not structured meticulously by the programmer. 

Every macro consists of four strict parts separated by spaces: 

1. The `#` symbol.
2. The `define` keyword.
3. The **Template** (e.g., `ADD(a,b)`).
4. The **Expansion** (everything from the space after the template until the Enter key is pressed).

### The Space Trap and Semicolon Trap

If you accidentally put a space between the macro name and its open parenthesis, the preprocessor treats the parenthesis as part of the expansion. Similarly, if you include a semicolon in your definition, that semicolon is pasted literally into your code.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* THE SPACE TRAP (BAD LOGIC) */   |   | /* THE SEMICOLON TRAP (BAD) */     |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| // Space between ADD and (a,b)     |   | // Semicolon included in macro     |
| // Template is just "ADD"          |   | #define I 5;                       |
| #define ADD (a, b) a + b           |   |                                    |
|                                    |   | int main() {                       |
| int main() {                       |   |     // Expands to: int a = 5; + 5; |
|     // Replaced with:              |   |     // ERROR: + 5; is invalid!     |
|     // int x = (a, b) a + b(3, 2); |   |     // int a = I + 5;              |
|     // int x = ADD(3, 2);          |   |                                    |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**Valid Spacing**

```c                              
#include <stdio.h>

#define ADD(  a  ,  b  ) a + b          
                                  
int main() {                      
    // Replaced with:             
    // int x = 3 + 2;
    int x = ADD(3, 2);         
    return 0;                     
}                                 
```                               

### The Argument Formatting Trap

Because computing isn't done, passing expressions into macros can violate BEDMAS (order of operations) if not properly bracketed.

```c
#include <stdio.h>

#define MULT_BAD(x, y) x * y
#define MULT_GOOD(x, y) (x) * (y)

int main() {
    // Expands to: 2 + 3 * 3 + 2
    // Math eval: 2 + 9 + 2 = 13 (Wrong intention!)
    int bad = MULT_BAD(2 + 3, 3 + 2); 
    
    // Expands to: (2 + 3) * (3 + 2)
    // Math eval: 5 * 5 = 25 (Correct intention!)
    int good = MULT_GOOD(2 + 3, 3 + 2);
    
    printf("Bad: %d, Good: %d\n", bad, good);
    return 0;
}
```

### Multi-Line Macros

If a macro expansion requires multiple lines, you cannot simply press Enter, as Enter immediately terminates the macro definition. You must strictly use the Line Continuation Character (Backslash `\`).

```c
#include <stdio.h>

// Backslash tells preprocessor the macro continues on the next line
#define INF_LOOP while(1) \
    { \
        printf("Hello\n"); \
    }

int main() {
    // INF_LOOP; // Uncomment to execute the multi-line replacement
    return 0;
}
```

### More Macro trap Examples

**Program 1**

```c
#define A 100

void main()
{
    // The preprocessor replaces 'A' with '100'.
    // The statement becomes: printf("%d", ++100);
    // You cannot pre-increment a constant value, it requires a variable (an l-value).
    printf("%d", ++A); 
}
// Result: Compilation Error (L-value required)
```

**Program 2**

```c
#define clrscr() 100

void main()
{
    // The preprocessor replaces 'clrscr()' with '100;'.
    // A solitary '100;' is a valid statement in C (it just does nothing).
    clrscr(); 
    
    // The preprocessor replaces 'clrscr()' with '100'.
    // The statement becomes: printf("%d", 100);
    printf("%d", clrscr()); 
}
// Result: 100
```

**Program 3**

```c
#define int 100

void main()
{
    // The preprocessor replaces the isolated word 'int' with '100'.
    // It does NOT replace 'int' inside the string literal.
    // The statement becomes: printf("int = %d", 100);
    printf("int = %d", int); 
}
// Result: int = 100
```

**Program 4**

```c
#define int char

void main()
{
    // The preprocessor replaces 'int' with 'char'.
    // The declaration becomes: char i;
    int i; 
    
    // Since 'i' is now a char, sizeof(i) evaluates the size of a char.
    printf("%d", sizeof(i)); 
}
// Result: 1 (since the size of a char is 1 byte)
```

**Program 5**

```c
#define mul(a,b) a*b

void main()
{
    int x;
    
    // The macro does straight text substitution without adding parentheses.
    // x = mul(2+3, 3+2); becomes: x = 2 + 3 * 3 + 2;
    // According to operator precedence, multiplication happens first: 2 + 9 + 2 = 13.
    x = mul(2+3, 3+2); 
    
    printf("%d", x);
}
// Result: 13
```

**Program 6**

```c
#define f1(x) 100

void main()
{
    // The preprocessor sees f1(k) and replaces the entire macro call with '100'.
    // It does not matter that variable 'k' is undeclared, because it gets completely 
    // replaced before the compiler even checks for variables.
    // The statement becomes: printf("%d", 100);
    printf("%d", f1(k)); 
}
// Result: 100
```

**Program 7**

```c
#define s s[]

void main()
 {
    // char s[] = "Hello";
    char s = "Hello";

    // printf("%s", s[]);
    printf("%s", s);
 }
 // Result: Compilation Error
```

**Key Summary: Macro Parsing Traps**

*   Macros do not check argument types and do not compute math.
*   Spaces strictly define where the template ends and the expansion begins.
*   Always wrap macro arguments in parentheses `()` to protect the order of operations.
*   Use `\` to define a macro spanning multiple lines.

***

## Macro Scope and Redefinition

Unlike variables inside a function body, preprocessor directives have absolutely no concept of local scope.

**Properties of Macros:**

- Preprocessor can be written anywhere in the program.
- Every preprocessor macro possesses a **Global Scope** starting from the exact line it is defined.
- Macros are evaluated strictly from top to bottom.
- You can redefine a macro midway through your code.
- You can explicitly destroy a macro using the `#undef` directive. 

```c
#include <stdio.h>

#define A 100

void test() {
    // 'A' evaluates to 100 here
    printf("Test A: %d\n", A); 
}

// Redefining 'A'. From this line down, 'A' is strictly 10.
#define A 10 

int main() {
    // 'A' evaluates to 10 here
    printf("Main A: %d\n", A); 
    
    test(); // Calls test(). test() was evaluated when 'A' was 100!
    
    // Destroying the macro entirely
    #undef A 
    
    // printf("%d", A); // ERROR: 'A' is undeclared from this point on
    
    return 0;
}
```

**Key Summary: Macro Scope and Redefinition**

*   Macros have a global scope and are parsed top-to-bottom.
*   Macros can be safely redefined mid-program to change their expanded values for subsequent lines.
*   `#undef` completely strips the macro definition from the preprocessor's memory.

***

## Macros vs Const, Typedef, and Functions

**Why we need Macro? Programmer can directly write a value in code! instead Macro**

- Having macro is easy for maintanance. change at one place and reflected in all places.
- Readability is more. Instead of magic number Macro give more understanding.

Because macros replace text blindly, they are often compared against C's built-in compile-time features like `const`, `typedef`, and standard functions. Understanding when to use which is a common architectural decision.

### Macro vs Typedef

`#define` is strictly **Token Replacement**. `typedef` is strictly **Type Replacement**. This fundamental difference becomes catastrophic when declaring multiple pointer variables on a single line.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* MACRO: TOKEN REPLACEMENT */     |   | /* TYPEDEF: TYPE REPLACEMENT */    |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| #define P_INT int*                 |   | typedef int* P_INT;                |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     // Expands to: int* a, b;      |   |     // 'P_INT' is evaluated as a   |
|     // 'a' is a pointer.           |   |     // complete type!              |
|     // 'b' is a NORMAL INTEGER!    |   |     // Both 'a' and 'b' are        |
|     P_INT a, b;                    |   |     // integer pointers!           |
|                                    |   |     P_INT a, b;                    |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

```c
// Typedef variations
typedef int i, *p;

i a, *b;
p c, *d;

// variable | Type
// a        | int
// b        | int*
// c        | int*
// d        | int**
```

### Macro vs Const

Macros are best used for universal constants (e.g., `#define PI 3.14`). However, `const` should strictly be used when interacting directly with hardware or function memory limitations:

1.  To prevent a function from modifying a passed pointer value (`void add(const int *x)`).
2.  To lock a structure member permanently (e.g., an Employee ID that cannot change).
3.  To create a Constant Pointer (`int * const p`).
None of these memory-level protections can be achieved with a macro.

### Macro vs Functions

Functions take time to execute. They suffer from **Stack Overhead**: pushing an activation record to the stack, moving the program counter, executing the core logic, and popping the record back off. 

*   **Macro Advantage:** Macros have absolute zero stack overhead. They are significantly faster because the code is copy-pasted inline.
*   **Function Advantage:** Functions strictly validate data types. Furthermore, debugging functions is easy; debugging a macro is very difficult because the compiler throws errors regarding the expanded source code, not your typed source code.

+--------------------------------------------------------+---+--------------------------------------------------------+
| ```c                                                   |   | ```c                                                   |
|                                                        |   |                                                        |
| #define abs(x) ((x) < 0 ? -(x) : (x))                  |   | int abs(int x) {                                       |
|                                                        |   |     return x < 0 ? -x : x;                             |
| void main() {                                          |   | }                                                      |
|     int a = -5;                                        |   |                                                        |
|     printf("Absolute value of %d is %d\n", a, abs(a)); |   | void main() {                                          |
|     return;                                            |   |     int a = -5;                                        |
| }                                                      |   |     printf("Absolute value of %d is %d\n", a, abs(a)); |
| // Results: L value error                              |   |     return;                                            |
|                                                        |   | }                                                      |
| ```                                                    |   | // Results: Absolute value of -5 is 5                  |
|                                                        |   |                                                        |
|                                                        |   | ```                                                    |
+--------------------------------------------------------+---+--------------------------------------------------------+

**Key Summary: Macros vs Compile-Time Features**

*   Use `typedef` for aliasing data types (especially pointers), never macros.
*   Use `const` for memory locking and pointer protection.
*   Use macros for execution speed (no stack overhead), but use functions for type safety and debuggability.

***

## Nested Macros

A **nested macro** occurs when one macro template is part of another macro expansion. During preprocessing, the C compiler will continue to expand macros until no further macro templates are found within the statement. 

### Example 1: Basic Nested Macro Expansion

To understand the standard expansion, consider a macro designed to calculate a cube, which relies on a macro designed to calculate a square.

```c
#define square(x) x * x
#define cube(x) square(x) * x
```

**How it expands:**

If you call `cube(4)` in your code:

1. The preprocessor first replaces the `cube` macro: `square(4) * 4`.
2. It then identifies the `square` template inside the expansion and replaces it: `4 * 4 * 4`.
3. The final evaluated result is `64`.

**Advantage:**

If a programmer needs the square of a number, they can directly call `square()`, and if they need a cube, they can call `cube()`. Both templates are reusable.

### Example 2: Complex Arithmetic and Precedence Traps

Nested macros act strictly as text replacements (token replacements). Because they do not evaluate mathematical expressions before substituting them, they often lead to operator precedence traps. 

Consider the following macros:

```c
#define f_sub_1(n) n * (n - 1)
#define f_sub_2(n) f_sub_1(n - 1) * n
```

**The Problem:** 

What is the output if you try to print `f_sub_2(8 - 1)`? 

**Step-by-Step Expansion and Evaluation:**

1. **First Expansion (`f_sub_2`):**
   Substitute `8 - 1` as the `n` value for `f_sub_2(n)`.
   *   Expansion: `f_sub_1(8 - 1 - 1) * 8 - 1`.

2. **Second Expansion (`f_sub_1`):**
   Now, substitute `8 - 1 - 1` as the new `n` value into the `f_sub_1(n)` definition.
   *   Expansion: `8 - 1 - 1 * (8 - 1 - 1 - 1) * 8 - 1`.

3. **Mathematical Evaluation (C Operator Precedence):**
   Because macros do not add protective parentheses automatically, we must evaluate this exactly as the C compiler would, following standard operator precedence rules:
   *   **Brackets First:** `(8 - 1 - 1 - 1)` evaluates to `(8 - 3)`, which is `5`.
   *   **Current Expression:** `8 - 1 - 1 * 5 * 8 - 1`.
   *   **Multiplication Next:** `1 * 5 * 8` evaluates to `40`.
   *   **Current Expression:** `8 - 1 - 40 - 1`.
   *   **Subtraction (Left to Right):** `8 - 1` is `7`. Then `7 - 40` is `-33`. Finally, `-33 - 1` gives the final result of **`-34`**.

By doing the math on paper step-by-step, it becomes clear how nested macros substitute tokens exactly as written, which can drastically alter mathematical calculations if variables aren't properly wrapped in parentheses.

***

## Stringification and Token Pasting

Standard macros cannot modify data inside a string (double quotes). C provides two highly advanced preprocessor operators to manipulate strings and merge tokens dynamically: Stringification (`#`) and Token Pasting (`##`).

### Stringification (*#*)

Placing a `#` before a macro argument dynamically wraps that argument in double quotes. This is exclusively used when you need to replace a piece of a string at pre-processing time.

*   `#x` translates strictly to `"x"`.
*   Two adjacent strings in C (`"A"` `"B"`) are automatically concatenated by the compiler into `"AB"`.

```c
#include <stdio.h>

// #int evaluates to "int"
// String concatenation merges the pieces cleanly
#define PRINT_INT(x) printf(#x " is equal to: %d\n", x)

int main() {
    int age = 25;
    
    // Expands to: printf("age" " is equal to: %d\n", age)
    // Output: age is equal to: 25
    PRINT_INT(age); 
    
    return 0;
}
```

### Token Pasting / Merging (*##*)

Placing `##` between two macro arguments physically merges them into a single, brand new token.

*   **Restriction:** If a macro argument is adjacent to a `#` or `##` operator, that argument **will not participate in nested expansion**. It is pasted literally.

```c
#include <stdio.h>

// Merges x and y into a single token
#define PASTE(x, y) x ## y 

// The No-Main Puzzle
// Merges t, s, v, u into "main"
#define ENCODE(s, t, u, v) t##s##v##u

// This actually builds: int main() { ... }
int ENCODE(a, m, n, i)() {
    int ab = 100;
    
    // PASTE(a, b) merges to create the token 'ab'
    printf("Merged token ab: %d\n", PASTE(a, b)); 
    
    return 0;
}
```

```c
#define fun(a, b) a##b 

int main() {
    int val1 = 10, val2 = 20, val3 = 30;

    // Expands: val##1+2 . Here ## is there so no nesting
    //          val1+2
    //          10+2
    //          12
    printf("%d", fun(val, 1+2));
}
```

+------------------------------------------+---+------------------------------------------+
| ```c                                     |   | ```c                                     |
|                                          |   |                                          |
| // NESTING NOT ALLOWED WITH ##           |   | // NESTING ALLOWED WITH ##               |
|                                          |   |                                          |
| #define cat(x, y) x##y                   |   | #define cat(x, y) x##y                   |
|                                          |   | #define xcat(x, y) cat(x, y)             |
| void main() {                            |   |                                          |
|     int abc = 100;                       |   | void main() {                            |
|                                          |   |     int abc = 100;                       |
|     //           cat(   <x>    <y>)      |   |                                          |
|     printf("%d", cat(cat(a, b), c));     |   |     //           xcat(   <x>    <y>)     |
|                                          |   |     printf("%d", xcat(xcat(a, b), c));   |
|     // Expands:                          |   |                                          |
|     // 1. cat(a##b, c)                   |   |     // Expands:                          |
|     //    Here ## is there so no nesting |   |     // 1. xcat(cat(a, b), c)             |
|     // 2. cat(ab, c)                     |   |     // 2. xcat(a##b, c)                  |
|     // printf("%d", cat(ab, c));         |   |     //    Here ## is there so no nesting |
|     return;                              |   |     // 3. xcat(ab, c)                    |
| }                                        |   |     // 4. cat(ab, c)                     |
| // Results: Compilation error            |   |     // 5. ab##c                          |
|                                          |   |     // 6. abc                            |
| ```                                      |   |     // printf("%d", abc);                |
|                                          |   |     return;                              |
|                                          |   | }                                        |
|                                          |   | // Results: 100                          |
|                                          |   |                                          |
|                                          |   | ```                                      |
+------------------------------------------+---+------------------------------------------+

**Key Summary: Stringification and Token Pasting**

*   `#` wraps a token in double quotes, injecting macro arguments directly into strings.
*   `##` strips spacing and merges two tokens together into one identifier.
*   Arguments interacting directly with `#` or `##` ignore further nested expansions.

***

## Conditional Compilation

C is a **Platform Dependent** language (tied heavily to the OS and hardware instruction sets like Intel vs Motorola). To write cross-platform code efficiently, C uses Conditional Compilation. This ensures that based on defined macros, only specific blocks of code are actually sent to the compiler, allowing programmers to bypass entire segments of incompatible code.

### The Story of Platform Independence: C vs. Java

To truly understand how C and Java operate, we must first define what a "platform" actually is. In the world of computing, a **platform is the combination of hardware (the processor) and the underlying software (the operating system)**. When we evaluate programming languages, a critical question arises: is the language platform-dependent or platform-independent? 

C is strictly **platform-dependent**, whereas Java is **platform-independent**. However, this distinction involves a fascinating trade-off between raw speed and supreme portability. 

#### The Mechanics of C: Unmatched Speed

On earth, C remains the absolute fastest programming language to run on a machine, a strength that guarantees its relevance for decades to come. 

When you write a C program and compile it, the resulting executable code is directly tied to the architecture of the machine used for compilation. For example, if you compile your source code on a 16-bit architecture, the length of every instruction in the resulting executable will be exactly 16 bits. 

This creates a rigid dependency:

*   **The Advantage:** Because the instructions perfectly match the 16-bit hardware, the processor can execute them natively and instantly. There is no translation required, making C incredibly fast.
*   **The Disadvantage:** If you take this 16-bit executable and try to run it on a 32-bit or 64-bit machine, it will fail. A 32-bit machine expects 32 bits per machine cycle, so it cannot natively understand the 16-bit instructions. 

Because C prioritizes raw execution speed, it sacrifices portability, making it the perfect language for hardware-specific tasks like **device drivers, compilers, and operating systems**.

#### The Mechanics of Java: Write Once, Run Anywhere

Java solves the portability problem by introducing an intermediate step. When you compile Java code, it does not generate an executable tied to your specific hardware; instead, it generates a `.class` file. 

The instructions inside this `.class` file are universally standardized to be exactly one byte long, which is why it is famously called **byte code**. Because every instruction is one byte, this code cannot run directly on *any* native hardware (whether 16-bit, 32-bit, or 64-bit). 

To run this code, Java relies on an intermediate "person" called the **Java Virtual Machine (JVM)**. 

*   **The Advantage:** The JVM sits between the byte code and the hardware. If you are on a 16-bit machine, the JVM takes two 1-byte instructions and "packs and sends" them as a single instruction to the hardware. On a 32-bit machine, the JVM takes four bytes and feeds them as one instruction. This allows the exact same `.class` file to run anywhere.
*   **The Disadvantage:** This continuous "pack and send" translation process takes time, meaning **Java sacrifices speed in exchange for platform independence**. 

Java is chosen when portability is the premium requirement, such as for general applications that need to run across multiple different operating systems without modification.

#### Bridging the Gap: Conditional Compilation in C

While C is inherently platform-dependent, programmers can strategically use **conditional compilation** to simulate platform independence for their applications. Conditional compilation means that, based on a specific condition, some parts of the code are compiled while other parts are completely ignored by the compiler.

Imagine you are building a software application that needs to run on both an Intel processor and a Motorola processor. You might have a single source file containing 1,500 lines of code:

*   **500 lines** of common logic.
*   **500 lines** of Intel-specific instructions.
*   **500 lines** of Motorola-specific instructions.

If you try to run Motorola instructions on an Intel machine, it will fail. However, by wrapping the hardware-specific code in conditional compilation directives, you can combine everything into a single file. When compiling for Intel, the compiler will select the common code and the Intel code, completely ignoring the Motorola code as if it doesn't even exist. 

This powerful technique allows C programmers to write one comprehensive application that supports multiple platforms, effectively granting C a degree of platform independence without ever sacrificing its legendary speed.

### The Directives

*   `#ifdef MACRO`: Compiles the block if the macro is defined.
*   `#ifndef MACRO`: Compiles the block if the macro is strictly NOT defined.
*   `#if VALUE`: Compiles if the value is non-zero (True).
*   `#elif VALUE`: The "Else-If" variant for chained logic.
*   `#else`: The fallback block.
*   `#endif`: **Mandatory.** Every `#if` or `#ifdef` block must strictly be terminated with `#endif`.

```c
#include <stdio.h>

#define INTEL_ARCH 1 // Assume we are compiling for Intel

int main() {
    
    #ifdef INTEL_ARCH
        // This code is compiled
        printf("Compiling Intel-Specific Code...\n");
    #else
        // This code is DELETED during pre-processing
        // It is never seen by the compiler!
        printf("Compiling Motorola-Specific Code...\n");
    #endif

    #if 0
        // #if 0 is frequently used to comment out massive 
        // blocks of code instantly without using /* */
        printf("This will never execute or compile.\n");
    #endif

    return 0;
}
```

**More examples**

+------------------+---+--------------------+---+--------------------+---+------------------+
| ```c             |   | ```c               |   | ```c               |   | ```c             |
| void main() {    |   | #define ABC        |   | void main() {      |   | #define ABC      |
|     printf('A'); |   |                    |   |     printf('A');   |   |                  |
|     printf('B'); |   | void main() {      |   |     printf('B');   |   | void main() {    |
| #ifdef ABC       |   |     printf('A');   |   | #ifndef ABC        |   |     printf('A'); |
|     printf('C'); |   |     printf('B');   |   |     printf('C');   |   |     printf('B'); |
|     printf('D'); |   | #ifdef ABC         |   |     printf('D');   |   | #ifndef ABC      |
| #endif           |   |     printf('C');   |   | #endif             |   |     printf('C'); |
|     printf('E'); |   |     printf('D');   |   |     printf('E');   |   |     printf('D'); |
|     printf('F'); |   | #endif             |   |     printf('F');   |   | #endif           |
| }                |   |     printf('E');   |   | }                  |   |     printf('E'); |
| // Results: ABEF |   |     printf('F');   |   | // Results: ABCDEF |   |     printf('F'); |
|                  |   | }                  |   |                    |   | }                |
| ```              |   | // Results: ABCDEF |   | ```                |   | // Results: ABEF |
|                  |   | ```                |   |                    |   | ```              |
+------------------+---+--------------------+---+--------------------+---+------------------+


**Key Summary: Conditional Compilation**

*   Allows a single `.c` file to support multiple hardware architectures by filtering which lines are compiled.
*   Missing an `#endif` throws a compilation error.
*   `#if 0` is an elite technique for stripping code from the compiler instantly.

***

## File Inclusion and Header Guards

The `#include` directive instructs the preprocessor to open a specified file and paste its entire contents directly into your current file. The syntax used completely alters where the preprocessor searches for that file.

### Angle Brackets vs Double Quotes

*   **Public Headers (`<file.h>`):** Searches exclusively in the **Include Directory** (the default path where the compiler was installed, containing standard library files like `stdio.h`).
*   **Private Headers (`"file.h"`):** Searches the **Source Directory** first (the folder where your current `.c` code is saved). If the file is not found, it strictly falls back and searches the Include Directory.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* PUBLIC HEADER (ANGLE BRACKETS) */|   | /* PRIVATE HEADER (DOUBLE QUOTES)*/|
|                                    |   |                                    |
| // Searches compiler's directory   |   | // Searches local folder first     |
| #include <stdio.h>                 |   | #include "my_math.h"               |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     printf("Standard Library!\n"); |   |     // Can use relative paths too: |
|     return 0;                      |   |     // #include "../parent.h"      |
| }                                  |   |     return 0;                      |
|                                    |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

### Designing Safe Header Files (Include Guards)

If a header file is `#include`d twice accidentally, its contents are pasted twice, creating duplicate declaration errors and severely increasing compile time. 

To prevent this, every custom header file **must** be wrapped in an Include Guard using conditional compilation.

```c
/* =======================================
 * File: my_math.h
 * ======================================= */

// 1. If this macro is NOT defined yet...
#ifndef _MY_MATH_H 

// 2. Define it immediately!
#define _MY_MATH_H 

// 3. Place strictly Variable Declarations, 
// Structure Declarations, and Macros here.
void calculate_area();
void calculate_circumference();

// 4. End the conditional block
#endif 
```

*(If this file is included a second time, `_MY_MATH_H` is already defined, and the entire block evaluates to false, safely ignoring the duplicate code!)*

**Key Summary: File Inclusion and Header Guards**

*   `< >` searches the compiler directory; `" "` searches the local project directory.
*   Header files should strictly contain declarations and macros, never operational functions or variable definitions.
*   Include guards (`#ifndef`, `#define`, `#endif`) guarantee a header file is compiled exactly once.

***

## Miscellaneous Directives

C provides a set of pre-defined global macros that require absolutely no header files to use. They are heavily utilized for sophisticated error logging and debugging.

### Predefined Global Macros

*   `__LINE__`: Evaluates to the current integer line number.
*   `__FILE__`: Evaluates to the string filename (e.g., "test.c").
*   `__DATE__`: Evaluates to the string compilation date.
*   `__TIME__`: Evaluates to the string compilation time.

### The *#line* Directive

If a 300-line header file is pasted into your code via `#include`, your main function might physically start at line 315 in the expanded source code. To prevent the compiler from throwing confusing error messages at "Line 317", the preprocessor secretly injects `#line` directives to manually reset the visible line numbers back to normal.

```c
#include <stdio.h>

int main() {
    // Standard Global Macros
    printf("Compiling File: %s\n", __FILE__);
    printf("Current Date: %s\n", __DATE__);
    printf("Current Time: %s\n", __TIME__);
    printf("Current Line: %d\n", __LINE__); // Prints 8
    
    // Forcing the next line to arbitrarily be Line 100
    #line 100
    
    printf("Arbitrary Line: %d\n", __LINE__); // Prints 100
    
    return 0;
}
```

**Key Summary: Miscellaneous Directives**

*   Global predefined macros are written with double underscores.
*   They provide exact tracking of files and timestamps for runtime logs.
*   The `#line X` directive forcibly overrides the compiler's internal line counter, starting the next line at `X`.

## Compile time assertion

In C, the way you implement a compile-time assertion depends entirely on the standard of C you are using. Modern C provides this feature out of the box, but if you are working with older, pre-C11 codebases, you will need to implement a clever macro trick.

Here is how to do it in both scenarios.

### The Modern Standard (C11 and newer)

If your compiler supports C11 or later, you don't need to implement anything manually. The language includes `_Static_assert` natively. By including `<assert.h>`, you get access to the friendlier `static_assert` macro.

**Example:**

```c
#include <stdio.h>
#include <assert.h>

struct DataPacket {
    char header;
    int payload;
};

// This will fail at compile-time if the struct isn't exactly 8 bytes long.
static_assert(sizeof(struct DataPacket) == 8, "DataPacket size must be 8 bytes to match hardware constraints");

int main() {
    printf("Compilation succeeded!\n");
    return 0;
}

```

### The Legacy Approach (Pre-C11)

If you are constrained to C89 or C99, you have to force the compiler to throw an error when a condition is false.

The most common and robust way to achieve this is the **negative array size trick**. In C, you cannot declare an array with a negative size. We can exploit this rule using a ternary operator: if the condition is true, the array size is 1 (legal); if the condition is false, the array size is -1 (compile error).

Here is the implementation:

```c
// 1. Helper macros to ensure __LINE__ is expanded properly before concatenation
#define CONCAT_IMPL(a, b) a##b
#define CONCAT(a, b) CONCAT_IMPL(a, b)

// 2. The actual compile-time assert macro
#define STATIC_ASSERT(condition) \
    typedef char CONCAT(compile_time_assert_failed_at_line_, __LINE__)[(condition) ? 1 : -1]

```

**How it works:**

* **The Condition:** `[(condition) ? 1 : -1]` checks your assertion. If it fails, you get a compile-time error like: `error: size of array is negative`.
* **The `typedef`:** Wrapping the array in a `typedef` prevents the compiler from actually allocating any memory for the dummy array. It just checks the type rules.
* **The `CONCAT` Macros:** If you write multiple `STATIC_ASSERT` statements in the same file, you would get a "redefinition of typedef" error. By concatenating the base name with `__LINE__` (e.g., `compile_time_assert_failed_at_line_42`), you ensure every assertion generates a uniquely named `typedef`.

**Example Usage:**

```c
#include <stdio.h>

#define CONCAT_IMPL(a, b) a##b
#define CONCAT(a, b) CONCAT_IMPL(a, b)
#define STATIC_ASSERT(condition) \
    typedef char CONCAT(compile_time_assert_failed_at_line_, __LINE__)[(condition) ? 1 : -1]

// Will compile successfully
STATIC_ASSERT(sizeof(int) >= 4); 

// Uncommenting the next line will break the build with a negative array error
// STATIC_ASSERT(sizeof(char) == 2); 

int main() {
    printf("Legacy asserts passed!\n");
    return 0;
}

```

**Note on Legacy Errors:** The main downside of the pre-C11 approach is that the error message generated by the compiler won't be a neat custom string; it will usually just complain about a negative array size or a bit-field size error. However, it successfully stops the build and points you to the exact line number where the assertion failed.
