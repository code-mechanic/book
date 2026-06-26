# Foundations of C: Syntax, Data Types, and Operators

Learning C programming is similar to learning English. In English, we use Alphabets to form Words, Words to form Sentences, and Grammar to construct meaning. In C, we use Keywords (32 alphabets), Operators (45 words), Separators, and Syntax (the grammar) to write programs. This chapter introduces the foundational building blocks of C, including basic data types, input/output formatting, mathematical operations, and the strict rules for defining variables and logic.

- Comparison between English language and C programming language

| **English Language**               | **C Language**       |
|------------------------------------|----------------------|
| 1. Alphabets (`a, b, c, ...`)      | 1. Keywords (`32`)   |
| 2. Words (`More than 10K`)         | 2. Operators (`45`)  |
| 3. Sentence (`Grammar makes this`) | 3. Separators (`14`) |
|                                    | 4. Constants         |


*   [Introduction to C and Constants](#introduction-to-c-and-constants)
*   [The Assignment Operator](#the-assignment-operator)
*   [Arithmetic Operators](#arithmetic-operators)
*   [C-Tokens and printf Function](#c-tokens-and-printf-function)
*   [Variable Declaration Rules](#variable-declaration-rules)
*   [Relational and Logical Operators](#relational-and-logical-operators)

***

## Introduction to C and Constants

A C program is built using basic tokens and strict Syntax (grammar). Violating the syntax results in a compilation error. At the core of data are Constants—fixed values that do not change during program execution.

### Types of Constants

Dennis Ritchie (the creator of C) classified constants into three primary data types:

*   **Integer (`int`):** Any positive number, negative number, or zero without a decimal point (e.g., `5`, `-5`, `0`).
*   **Real (`float`):** Any number containing a decimal point (e.g., `5.25`). It is called "float" because the decimal point can "float" or change positions depending on the number's precision.
*   **Character (`char`):** Any single character strictly enclosed in single quotes. The length inside the quotes must be exactly one (e.g., `'a'` is valid, `'ab'` is invalid).

| **Item** | **Value**                       | **C datatype** |
|----------|---------------------------------|----------------|
| Integer  | `5`, `-5`, `0`                  | int            |
| real     | `5.12`, `0.39`, `5.00`, `-3.25` | float          |
| character | `'a'`, `'5'`                    | char           |

- Primary / Primitive / Fundamental / Basic data types in C
    - `Data` is meaningful information
    - `Datatype` is a different kind of data like `int`, `float` and `Char`

### Comprehensive Format Specifiers

To represent and print these data types, C uses format specifiers. Below is a comprehensive reference table of available specifiers:

| **Specifier** | **Data Type**            | **Description**                                |
| ------------- | ------------------------ | ---------------------------------------------- |
| `%c`          | `char`                   | Prints a single character                      |
| `%s`          | `char *`                 | Prints a string                                |
| `%d` / `%i`   | `int`                    | Signed decimal integer                         |
| `%u`          | `unsigned int`           | Unsigned decimal integer                       |
| `%hd`         | `short int`              | Signed short integer                           |
| `%ld`         | `long int`               | Signed long integer                            |
| `%lld`        | `long long int`          | Signed long long integer                       |
| `%f`          | `float`                  | Floating-point number                          |
| `%lf`         | `double`                 | Double-precision floating-point                |
| `%x` / `%X`   | `unsigned int`           | Hexadecimal integer (lowercase / uppercase)    |
| `%o`          | `unsigned int`           | Octal integer                                  |
| `%p`          | `void *`                 | Pointer address                                |

```c
#include <stdio.h>

int main() {
    int age = 25;
    float price = 10.50;
    char grade = 'A';
    
    // Printing values using matching format specifiers
    printf("Age: %d\n", age);
    printf("Price: %f\n", price);
    printf("Grade: %c\n", grade);
    
    return 0;
}
```

**Key Summary: Intro to C and Constants**

*   **Syntax** is the grammar of C. Violating it causes compilation errors.
*   Constants are divided into `int` (whole numbers), `float` (decimals), and `char` (single quotes of length one).
*   Format specifiers act as placeholders to map variables to output strings.

***

## List of all Operators

![Operators](c_programming/diagrams/chapter1_introduction/operator_table.png){ width=75% }

## The Assignment Operator

The assignment operator (`=`) is used to assign a value to a variable, but it enforces highly strict rules regarding what can be placed on its left side versus its right side.

### The L-Value Rule

The assignment operator strictly requires exactly **two arguments**. 

*   **Right Side:** Can be a variable, a constant, or an expression (e.g., `5`, `A`, `2 + 3`).
*   **Left Side (L-Value):** Must strictly be a **variable** capable of storing data. If you place a constant or an expression on the left side, the compiler throws an **L-value required error**.

### Statement Terminators

In English, a sentence ends with a full stop. In C, every single statement must end with a semicolon (`;`). We do not use a dot (`.`) because the dot is reserved for floating-point numbers.

```c
#include <stdio.h>

int main() {
    int a, b, c;
    
    a = 5;      // Valid: Assigning a constant to a variable
    b = a;      // Valid: Assigning a variable to a variable
    c = 2 + 3;  // Valid: Assigning an expression to a variable
    
    // INVALID EXAMPLES (Uncommenting causes compilation errors):
    // 10 = a;      // ERROR: L-value required (Left is constant)
    // a + b = 10;  // ERROR: L-value required (Left is expression)
    // a = 5        // ERROR: Statement missing semicolon
    //   = 5;       // ERROR: Assignment operator need two arguments
    
    printf("%d %d %d\n", a, b, c);
    return 0;
}
```

Every expression is replaced with a constant

```C
int main() {
    int a = 5;
    int b = -3;
    int c = 9;

    a = b;  // a = -3
    b = -c; // b = -9
    a = -b; // a = 9

    -c = a; // Error because l-value is expression not a variable
}
```

**Key Summary: Assignment Operator**

*   The assignment operator (`=`) requires two arguments and copies data from right to left.
*   The left side must always be a variable memory location (L-value).
*   Missing a semicolon throws a "Statement missing semicolon" error.

***

## Arithmetic Operators

C supports standard arithmetic operators (`+`, `-`, `*`, `/`) and introduces a special operator for remainders (`%`). When evaluating complex expressions, C follows strict priority rules and type conversion behaviors.

### Priority and Type Rules

*   **Priority:** Multiplication (`*`), Division (`/`), and Modulus (`%`) share the highest priority. Addition (`+`) and Subtraction (`-`) share lower priority. The Assignment operator (`=`) has the lowest priority. Evaluation happens from **left to right** if priority is tied.
*   **Type Casting Rule:** 
    *   `int` operated with `int` always results in an `int` (e.g., `5 / 2 = 2`).
    *   If **any** argument is a `float`, the result becomes a `float` (e.g., `5.0 / 2 = 2.5`).

| **Operation on** | **Result** |
|------------------|------------|
| int with int     | int        |
| int with float   | float      |
| float with int   | float      |
| float with float | float      |

### The Modulus Operator

In math, division gives both a quotient and remainder. In C, an operator returns exactly one result. Division (`/`) strictly gives the quotient, and Modulus (`%`) strictly gives the remainder.

**Modulus Strict Rules:**

1.  **Sign Rule:** The result sign is always strictly the **same as the numerator's sign**. It ignores the denominator's sign. (e.g., `-5 % 2 = -1`, but `5 % -2 = 1`).
2.  **No Floats:** You **cannot** apply modulus to float values. Doing so throws an "Illegal use of floating point" error.
3.  **Multiple Detection:** If `x % y == 0`, `x` is a multiple of `y`.
4.  **Unit Place:** Any number `% 10` isolates the last digit (unit place).
5.  **Smaller Numerator:** If the numerator is smaller than the denominator, the result is the numerator itself (e.g., `6 % 12 = 6`).

```c
#include <stdio.h>

int main() {
    int a;
    float f;

    a = 5 / 2;     // int / int -> int result. 'a' gets 2.
    a = -5 / 2;    // -2
    a = 5 / -2     // -2
    a = -5 / -2    // -2

    f = 5.0 / 2;   // float / int -> float result. 'f' gets 2.5.
    f = 5.0 / 2;   // 2.5
    f = 5 / 2.0;   // 2.5
    f = -5 / 2.0   // -2.5
    f = 2 / 5      // 0
    f = 2 / -5     // 0

    a = 17 / 3 / 2;
    /*
    a = 5 / 2
    a = 2
    */

    a = 15 / 2 * 3;
    /*
    a = 7 * 3
    a = 21
    */

    a = 9 * 3 / 4;
    /*
    a = 27 / 4
    a = 6
    */

    a = 6 * 3 / 4 * 5;
    /*
    a = 18 / 4 * 5
    a = 4 * 5
    a = 20
    */

    // Modulus Sign Rules (Remainder)
    int m1 = -5 % 2;  // Numerator is negative -> Result: -1
    int m2 = 5 % -2;  // Numerator is positive -> Result: 1
    
    // Invalid Modulus (Causes compilation error):
    // float err = 5.0 % 2; // ERROR: Illegal use of floating point
    
    printf("a: %d, f: %f, m1: %d, m2: %d\n", a, f, m1, m2);
    return 0;
}
```

| **Division** | **Result of division** | **Modulus** | **Result of modulus** |
|--------------|------------------------|-------------|-----------------------|
| + / +        | +                      | + % +       | +                     |
| + / -        | -                      | + % -       | +                     |
| - / +        | -                      | - % +       | -                     |
| - / -        | +                      | - % -       | -                     |

**Key Summary: Arithmetic Operators**

*   Integer division truncates decimals (`5 / 2` is `2`, not `2.5`).
*   Modulus strictly calculates remainders, and its sign depends entirely on the numerator.
*   Modulus can never be used with floating-point numbers.

***

## C-Tokens and printf Function

A C-Token is the smallest individual unit in a program. To output these tokens and variables visually to the user, we rely heavily on the built-in `printf` function.

### C-Tokens and Indentation

The five C-Tokens are Keywords, Operators, Separators, Constants, and Identifiers. You can place any number of spaces, tabs, or newlines between tokens. However, programmers must use **good indentation** (clean alignment of brackets and spacing) to ensure the code is human-readable and maintainable.

### The printf Rules

1.  `printf` strictly prints the **first argument** on the screen.
2.  The first argument must always be enclosed in double quotes `" "`.
3.  If the first argument contains a format specifier (like `%d`), `printf` sequentially matches it to the next arguments provided after commas.
4.  If a format specifier lacks a matching argument, or data types mismatch, the result is an unpredictable **garbage value**.

```c
#include <stdio.h>

int main() {
    // Prints first argument exactly as written
    printf("Hello World\n"); 
    
    // First %d matches 10, second %d matches 20
    printf("Values: %d and %d\n", 10, 20); 
    
    // Operator inside quotes vs outside quotes
    printf("3 + 2 = %d\n", 3 + 2); // Prints: 3 + 2 = 5
    
    // Expects two integers, but only one is provided
    // Output: Missing args: 10 and <random_garbage_value>
    printf("Missing args: %d and %d\n", 10); 

    printf("    Hello    ");
    // ....Hello....
    // (Spaces are retained)

    printf("Hello%dadc%d", 10, 20);
    // Hello10abc20

    printf("%d %d %d", 10, 20, 30);
    // 10 20 30

    printf("%d%d%d", 10, 20, 30);
    // 102030

    printf("%d,%d,%d", 10, 20, 30);
    // 10,20,30

    printf("%d %d %d", 10, 20);
    // 10 20 <GV/Junk>

    printf("%d %d %d", 10);
    // 10 GV GV

    printf("%d %d %d");
    // GV GV GV

    printf("%d %d %d", 10, 20, 30, 40);
    // 10 20 30

    printf("%d %f %c", 10, 3.75, 'a');
    // 10 3.75 a

    printf("%d", 5.5);
    // GV

    printf("%f", 5);
    // GV

    printf("%d", 5 + 2);
    // 7

    printf("5 + 2");
    // 5 + 2

    printf("%d + %d", 5 + 2);
    // 7 + GV

    printf("%d * %d = %d", 5, 2, 5+2);
    // 5 * 2 = 7

    printf("%d * %d = %d", 5, 2, 5*2);
    // 5 * 2 = 10

    printf("%f", 5/2);
    // GV

    printf("%d", 5/2);
    // 2

    printf("%f", 5.0 % 2);
    // Error

    printf("%d", -5 % -2);
    // -1

    printf("Hello", "Hai", "Bye");
    // Hello

    printf("Hello""Hai""Bye");
    // HelloHaiBye

    printf(""Hello"");
    // Error

    printf("""Hello""");
    // Hello

    printf(""""Hello"""");
    //Error

    printf("%d %d %d", "%d %d", 10, 20, 30, 40, 50);
    // GV 10 20

    printf("10, 20", "%d");
    // 10, 20

    int ts = 7500;
    printf("ts");                 // ts
    printf(ts);                   // Error
    printf("Total sal = %d", ts); // Total sal = 7500
    printf("%d + 1000", ts);      // 7500 + 1000
    printf("%d", ts + 1000);      // 8500

    return 0;
}
```

**Key Summary: Tokens and printf**

*   Tokens are the smallest code units. Space between them is ignored.
*   `printf` only prints the first argument (inside the double quotes).
*   Mismatched or missing arguments in `printf` yield unpredictable garbage values.

***

## Variable Declaration Rules

Before you can use a variable, you must introduce it to the compiler. C language enforces highly specific rules regarding how variables can be named, defined, and assigned initial values.

### Definition vs Declaration

It is critically important to understand the compiler's behavior when introducing variables:

*   **Variable Definition:** The compiler actively **allocates memory** for the variable (e.g., `int a;`). 

```C
int a;
int b = 10;
```

*   **Variable Declaration:** The compiler is simply informed about the variable's existence and type, but it **does not allocate memory** for it yet.

```C
extern int a;
```

### Variable Naming Rules (Identifiers)

Variables must follow strict identifier rules:

1.  Must start with an alphabet (`a-z`, `A-Z`) or an underscore (`_`).
2.  Can contain numbers, but only after the first character.
3.  **No spaces allowed.**
4.  **No keywords allowed.** You cannot name a variable `int` or `float`. (However, keywords can be part of a larger name, e.g., `int_value` is valid).
5.  **No operators allowed.**
6.  Two variables in the same scope cannot have the exact same name (causes a "Multiple declaration" error).
7.  Length should ideally be under 15 characters to preserve readability.

### Initialization vs Assignment

*   **Initialization:** Giving a variable a value strictly at the exact time it is defined (e.g., `int a = 5;`).
*   **Assignment:** Giving a variable a value later in the code. If not initialized, a variable temporarily holds a garbage value.

```c
#include <stdio.h>

int main() {
    // GOOD CONVENTION: Separate lines for easy commenting
    int count = 5;       // Initialization
    float salary = 10.5; // Initialization
    
    // VALID NAMES
    int a1 = 10;
    int _total = 50;
    int int_count = 5;   // 'int' is part of a larger word
    
    // INVALID NAMES (Uncommenting causes errors)
    // int 1a = 5;       // ERROR: Cannot start with a number
    // int total count;  // ERROR: Spaces are not allowed
    // int float = 10;   // ERROR: 'float' is a reserved keyword
    // int a+b = 5;      // ERROR: Operators not allowed
    
    printf("Count: %d, Salary: %f\n", count, salary);

/*************************** Valid definition *********************************/

    int a;
    a = 5; // Assignment

    int a = 5; // Initialization

    int a = 18 / 3 / 5;

    int a = 2 + 5;

    int a = 7.65;

    int a, b, c;
    a = b = c = 10; // Valid

    int a, b, c = a = b = 10;

    int a = a;

    int a1, b1, c1;

    int avgofsallary; // Valid but not readable

    int avg_of_salary;

    int a, A;

    char way2ms;

    char INT;

    int abcdefghijklmnopqrst;

    int _;

    char _1, _2;

/******************************* Not a valid **********************************/
    int a = b = c = 10;

    int 1a, 1b, 1c;

    int avg of salary; // Not a valid. No white space allowed

    int if;

    int a + b;

    int a, a; // Not a valid. same name not allowed

    float 1606y2;

    int 42shared;

    char `a`, `b`, `c`;

    return 0;
}
```

**Key Summary: Declaration Rules**

*   Names must begin with a letter or underscore, and cannot contain spaces, operators, or exact reserved keywords.
*   Definition allocates memory; declaration simply informs the compiler.
*   Defining variables on separate lines improves maintainability.

***

## Relational and Logical Operators

Relational operators are used to establish conditions and compare values. However, directly chaining mathematical comparisons (like `a > b > c`) fails in C. To combine multiple conditions safely, we must use Logical operators.

### Relational Operators and Boolean Logic

C has six relational operators: `>`, `<`, `>=`, `<=`, `==` (equality), and `!=` (not equal). 

*   Unlike other languages, **C does not have a boolean data type**. 
*   Therefore, a true condition strictly returns `1`, and a false condition strictly returns `0`.

| **Operator** | **Name**                 | **Description**                                                       |
|--------------|--------------------------|-----------------------------------------------------------------------|
| `==`         | Equal to                 | Checks whether two operands are equal                                 |
| `!=`         | Not equal to             | Checks whether two operands are not equal                             |
| `>`          | Greater than             | Checks whether left operand is greater than right operand             |
| `<`          | Less than                | Checks whether left operand is less than right operand                |
| `>=`         | Greater than or equal to | Checks whether left operand is greater than or equal to right operand |
| `<=`         | Less than or equal to    | Checks whether left operand is less than or equal to right operand    |

**The Chaining Error:** 

If you evaluate `4 > 3 > 2`, C processes it left-to-right. First, `4 > 3` evaluates to True (`1`). Then, the code evaluates `1 > 2`, which is False (`0`). The mathematical intent fails because of strict boolean conversion.

### Logical Operators

To solve chaining, we combine isolated relational statements using Logical operators (`&&`, `||`, `!`).

*   **Logical AND (`&&`):** Returns `1` if *all* conditions are non-zero. If even one is zero, it returns `0`.
*   **Logical OR (`||`):** Returns `1` if *at least one* condition is non-zero.
*   **Logical NOT (`!`):** Reverses the truth value. `!0` becomes `1`. `!1` becomes `0`. It is heavily used for checking negative test conditions (e.g., checking if memory was *not* allocated).

| **Operator** | **Name**    | **Description**                                |
|--------------|-------------|------------------------------------------------|
| &&           | Logical AND | Returns true if both conditions are true       |
| \|\|         | Logical OR  | Returns true if at least one condition is true |
| !            | Logical NOT | Reverses the logical state of operand          |

| **A** | **B** | **A && B** | **A \|\| B** | **!A** | **!B** |
|-------|-------|------------|--------------|--------|--------|
| 0     | 0     | 0          | 0            | 1      | 1      |
| 0     | 1     | 0          | 1            | 1      | 0      |
| 1     | 0     | 0          | 1            | 0      | 1      |
| 1     | 1     | 1          | 1            | 0      | 0      |

> - Whenever we have 'N' conditions and if we depend on all 'N' conditions, at that time we go for `AND` logic
> - When there are 'N' conditions and if we depend on any 1 condition, at that time we go for `OR` logic
> - `NOT` is used in negative test condition

### Short-Circuit Evaluation and Operand Execution

In C language, there is a strict order of precedence for *operators*, but generally, there is no strict order of execution for *operands* (e.g., in `a = 2 + 3;`, the compiler does not guarantee if 2 or 3 is fetched first).

**The Exceptions (Left-to-Right Execution):**

There are exactly four operators where operands are strictly and compulsorily evaluated from **left to right**:

1.  Logical AND (`&&`)
2.  Logical OR (`||`)
3.  Conditional / Ternary (`?:`)
4.  Comma (`,`)

This strict left-to-right execution allows **Short-Circuiting**:

*   In **AND** (`&&`), if the first argument evaluates to `0` (false), the compiler guarantees the final result is false and entirely bypasses the second argument.
*   In **OR** (`||`), if the first argument evaluates to `1` (true), the compiler guarantees the final result is true and entirely bypasses the second argument.

```c
#include <stdio.h>

int main() {
    int result;
    
    result = (5 == 5); // Relational Truth: True, so result is 1
    
    // The Chaining Logical Error
    // 4 > 3 evaluates to 1. Then 1 > 2 evaluates to 0.
    int wrong_chain = 4 > 3 > 2; 
    
    // The Correct Logical AND Approach
    // (4 > 3) is 1. (3 > 2) is 1. 1 && 1 evaluates to 1.
    int right_chain = (4 > 3) && (3 > 2); 
    
    // Logical NOT: 5 is non-zero (True). !True is False (0).
    int not_example = !5; 
    
    printf("Wrong: %d, Right: %d, Not: %d\n", 
           wrong_chain, right_chain, not_example);

    max = a;
    b > max && (max = b);
    printf("%d", max);

    return 0;
}
```

```C

/* Short circuit Concept

0 && x => 0
1 || x => 1
- x is don't care

1 && arg1 => Output
0 || arg1 => Output
- output depends on arg1

++x + ++y;
// Here ++y executed first or ++x executed first? compiler dependent

++x && ++y
// here ++x only executed first
*/
```

**Key Summary: Relational and Logical**

*   C has no boolean type: True resolves to `1`, False resolves to `0`.
*   Never chain relational operators directly (`a > b > c`). Use logical operators instead (`a > b && b > c`).
*   Logical operators utilize short-circuiting to bypass unnecessary calculations entirely from left to right.
