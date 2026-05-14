\newpage
# Introduction to C

- Comparision between English language and C programming language

| **English Language**               | **C Language**       |
|------------------------------------|----------------------|
| 1. Alphabets (`a, b, c, ...`)      | 1. Keywords (`32`)   |
| 2. Works (`More than 10K`)         | 2. Operators (`45`)  |
| 3. Sentance (`Grammer makes this`) | 3. Separators (`14`) |
|                                    | 4. Constants         |

- Constants

| **Item** | **value**                       | **C datatype** |
|----------|---------------------------------|----------------|
| Integer  | `5`, `-5`, `0`                  | int            |
| real     | `5.12`, `0.39`, `5.00`, `-3.25` | float          |
| charater | `'a'`, `'5'`                    | char           |

- Reason for the name float but why not real?
    - 100.`231452156`
        - `.` is decimal point
        - `231452156`: This keep on changing So `float`

- Primary / Primitive / Fundamental / Basic data types in C
    - `Data` is a meaningfull information
    - `Datatype` is a different kind of data like `int`, `float` and `Char`

| **Format Specifier** | **Data Type**          | **Description**                                                 |
|----------------------|------------------------|-----------------------------------------------------------------|
| %c                   | char                   | Prints a single character                                       |
| %s                   | char *                 | Prints a string                                                 |
| %d                   | int                    | Signed decimal integer                                          |
| %i                   | int                    | Signed integer (same as `%d` in `printf`)                       |
| %u                   | unsigned int           | Unsigned decimal integer                                        |
| %hd                  | short int              | Signed short integer                                            |
| %hu                  | unsigned short int     | Unsigned short integer                                          |
| %ld                  | long int               | Signed long integer                                             |
| %lu                  | unsigned long int      | Unsigned long integer                                           |
| %lld                 | long long int          | Signed long long integer                                        |
| %llu                 | unsigned long long int | Unsigned long long integer                                      |
| %f                   | float                  | Floating-point number (`printf` promotes float to double)       |
| %lf                  | double                 | Double-precision floating-point (`scanf` uses `%lf` for double) |
| %Lf                  | long double            | Long double floating-point                                      |
| %e / %E              | float, double          | Scientific notation                                             |
| %g / %G              | float, double          | Shortest representation of `%f` or `%e`                         |
| %x                   | unsigned int           | Hexadecimal integer (lowercase)                                 |
| %X                   | unsigned int           | Hexadecimal integer (uppercase)                                 |
| %o                   | unsigned int           | Octal integer                                                   |
| %p                   | void *                 | Pointer address                                                 |
| %%                   | —                      | Prints `%` character                                            |
| %zu                  | size_t                 | Unsigned size type                                              |
| %td                  | ptrdiff_t              | Pointer difference type                                         |
| %jd                  | intmax_t               | Largest signed integer type                                     |
| %ju                  | uintmax_t              | Largest unsigned integer type                                   |


## List of all Operators

![Operators](c_programming/diagrams/chapter1_introduction/operator_table.png){ width=75% }

## Assignment Operator

- It requires 2 arguments
- Left side arg must be variable
- Right side arg can be a variable / constant / expression
- Left side value is called l-value

```C
// Not valid
a = 5
a = ;
  = 10;
10 = 20;

// Valid
a = 5;
b = a;
c = 2 + 3;
```

- Every expression is replaced with constant

```C
a = 5;
b = -3;
c = 9;

a = b;  // a = -3
b = -c; // b = -9
a = -b; // a = 9

-c = a; // Error because l-value is expresion not a variable
```

- In C language each and every statement ends with `;`
- Semicolon is called statement terminator (or) end of statement
- Why `.` is not used as terminator?
    - because `.` is used as decimal point in float number
- What is l-value error?
    - On the left hand side of assignment operation we should provide a variable but by mistake if we provide constant (or) expression then we get l-value required error.

## Arithmetic Operators

```C
// Example 1: Expression evaluation
a = 2 + 3;
a = 2 + 3 + 4;
a = 6 - 2 + 3 - 4 + 1;
a = 2 + 3 * 5;
a = (2 + 3) * 5;
a = 2 * 3 + 3 * 2;
```

| **Operation on** | **Result** |
|------------------|------------|
| int with int     | int        |
| int with float   | float      |
| float with int   | float      |
| float with float | float      |

```C
// Example 2:
a = 5 / 2;   // 2
a = -5 / 2;  // -2
a = 5 / -2   // -2
a = -5 / -2  // -2

a = 5.0 / 2; // 2.5
a = 5 / 2.0; // 2.5
a = -5 / 2.0 // -2.5
a = 2 / 5    // 0
a = 2 / -5   // 0
```

```C
// Example 3:

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

a = 9 * / 4;
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
```

| **Division** | **Result of division** | **Modulus** | **Result of modulus** |
|--------------|------------------------|-------------|-----------------------|
| + / +        | +                      | + % +       | +                     |
| + / -        | -                      | + % -       | +                     |
| - / +        | -                      | - % +       | -                     |
| - / -        | +                      | - % -       | -                     |

- **Floating point numbers cannot used in modulus only integer is accecptable**

```C
// Example 1

a = 5 / -2; // -2
a = 5 % -2; // 1
```

```C
// Example 2

a = 3.5 * 2 % 7; // Compilation error
```

- The result of modulus operation is remainder
- Result sign is same as numerator sign
    - If numerator is +ve then result is +ve
- Result sign does not depend on denominator
- `Condition 1`: x % y == 0 means then we can say that `x` is multiple of `y`
- `Condition 2`: Numerator % 10 givers last digit of numerator
- `Condition 3`: When numerator is smaller then denominator then result is numerator
- `Condition 4`: When numerator is equal to denominator then result is zero

## C-Tokens

- Smallest individual unit in C language is called C-Token
- C-Token are
    - Keywords
    - Operators
    - Separators
    - Constants
    - Identifiers
- There can be 'N' no. of space / Tabs / Newlines between two C-Tokens
- Program should be in good indentation

```C
void main()
{
    printf("Hello");
}
```

- The above program has following C-Tokens
    - Keyword     : `void`
    - Operator    : `(` `)` `(` `)`
    - Separator   : `{` `;` `}`
    - Constant    : `"Hello"`
    - Identifiers : `main` `printf`
- Total `11` C-Tokens are there in above program

## printf function

- It will print 1st arg on screen
- 1st arg must be in pair of double quotes
- if more than one arg, then evey arg must be separated by commas

```C
printf("Hello");
// Hello

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
```

## Variable definition Rules

- Variable definition ways,

```C
// Method 1:
int a;
int b;
int c;

// Method 2:
int a, b, c;
```

- In the above two style 1st style is recommanded because,
    - Subsequent change in variable type in future is easy
    - Writing and updating a comment is easy

- ***Variable definition***: Compier allocates memory for that variable

```C
int a;
int b = 10;
```

- ***Variable declaration***: Compier doesn't allocates memory for that variable

```C
extern int a;
```

Exmaples:

```C
void main()
{
    int a; // Always say datatype to a variable
    a = 5;
    printf("%d", a);
}

// Output
// 5

void main()
{
    int i;
    float f;
    i = 5;
    f = 5.5;
    printf("%d %f", i, f);
}

// Output
// 5 5.5
```

- In C programming we can assign any type of data to any type of variable. Internally in computer the compiler will take care.
- In printf function only sutiable data is given to format specifier else garbage value is printed.

```C
void main()
{
    int i;
    i = 5.5;
    printf("%d", i); // 5
}

void main()
{
    float f;
    f = 5;
    printf("%f", f); // 5.0
}

void main()
{
    int i;
    i = 5 / 2;
    printf("%d", i); // 2
}

void main()
{
    float f;
    f = 5 / 2;
    printf("%f", f); // 2.0
}

void main()
{
    int i;
    i = 5.0 / 2;
    printf("%d", i); // 2
}

void main()
{
    float f;
    f = 5.0 / 2;
    printf("%f", f); // 2.5
}
```

- More examples

```C
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
```

- Rules for naming a valid variable Names:
    - An Identifier can contain
        - a - z
        - A - Z
        - 0 - 9
        - _ (underscore)
    - An Identifier name start with alphabet (or) underscore
    - No whitespace, operator are allowed
    - No keyword, but act as a pert of variable
        - Example: `int intfloat`
    - No restriction in length of variable name, but if length is very big then readability is less. Hence programmers recommandation is max of 15 characters

```C
int pwm_analog_read;
int pwm_analog_write;
int pwm_digital_read;
int pwm_digital_write;
```

## Relational Operators

| **Operator** | **Name**                 | **Description**                                                       |
|--------------|--------------------------|-----------------------------------------------------------------------|
| `==`         | Equal to                 | Checks whether two operands are equal                                 |
| `!=`         | Not equal to             | Checks whether two operands are not equal                             |
| `>`          | Greater than             | Checks whether left operand is greater than right operand             |
| `<`          | Less than                | Checks whether left operand is less than right operand                |
| `>=`         | Greater than or equal to | Checks whether left operand is greater than or equal to right operand |
| `<=`         | Less than or equal to    | Checks whether left operand is less than or equal to right operand    |

```C
a = 5 + 2;   // a is int

b = 1.5 * 3; // b is float

c = 4 > 3;   // c and d is boolean (but not available in C)
d = 9 < 7;
```

- The use of this operator
    - To establish relation between two numbers and perform comparition
    - Result of relation operation is either `true` or `false`
    - `true` and `false` are boolean datatype but C does not support that hence
        - `true`  = Non-zero
        - `false` = zero

```C
void main()
{
    int a;
    a = 4 > 3 > 2;
    printf("%d", a); // 0
}
```

- In Maths,
    - a > b and b > C makes a > c. So a > b > c
    - 4 > 3 and 3 > 2. So 4 > 3 > 2
- In English, Lets take below two scentance
    - I am watching movie
    - I am eating popcorn
    - Now, Lets combine two statement blindly
        - I am watching movie eating popcorn `(meaning less)`
    - So, I am watching movie `and` eating popcorn `(meaningful now)`
- In C Language
    - `4 > 3 > 2` makes result in `0` even if we think in matematically and gramatically
    - So, `(4 > 3) && (3 > 2)` makes result `1`

```C
a = 4 + 3 > 2 + 5;
  = 7 > 2 + 5
  = 7 > 7
  = 0

a = 6 > 3 + 2 < 8
  = 6 > 5 < 8
  = 1 < 8
  = 1

a = 6 * 3 >= 5 * 2 + 8 >= 17 + 8 <= 6 * 4 == 8 * 5 != 5 * 3 * 2 + 10 != 40;
// Based on the Associativity of operator all are executed from left to right
// and last operator is !=. So result always will be 1 or 0
```

## Logical Operator

- If we are combining 2 or more relation operator directly then result is unexpected
- To overcome this C people have introduced logical operators
- Thus use of logical operation is to combine two (or) more relational statement and to get compound statement

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

> - Whenever we are having 'N' condition and if we are depend on all 'N' condition at that time we are going for `AND` logic
> - When there are 'N' condition and if we are depend on any 1 condition that time we gone for `OR` logic
> - `NOT` is used in negative test condition

- In c language every Non-zero is true
- Zero is consider as false
- Whenever we are not giving body for `if` then by default compiler will consider upto 1st semicolon as if body
- In C only semicolon is valid and it is called null statement
- The purpose of `;` is provide delay to next instruction

```C

void main()
{
    int a = 10;
    int b = 20;
    int max;

    /* To find max of two integer using if */
    if(a > b) {
        max = a;
    }

    if(b > a) {
        max = b
    }

    /* WAP to find max of 2 integer using only one if */
    max = b;
    if(a > b) {
        max = a;
    }

    /* WAP to find max of 2 integer using 1 if and without 3rd variable */
    if(a > b) {
        b = a;
    }
    printf("MAX = %d", b);

    /* WAP to find max of 2 integer without using any if without 3rd variable */
    max = (a > b) * a + (b < a) * b;

    /* WAP to find max of 2 integer without using any condition */
    max = (a + b + abs(a - b)) / 2;
}
```