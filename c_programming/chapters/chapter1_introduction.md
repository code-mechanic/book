\newpage
# Introduction to C

- \underline{Comparision between English language and C programming language}

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


## List of all operators

![Operators](c_programming/diagrams/chapter1_introduction/operator_table.png){ width=75% }

## Assignment operator

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

printf(%d + %d", 5 + 2);
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

## Declaration Rules


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


## Relational & Logical Operators
