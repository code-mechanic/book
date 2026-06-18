\newpage

# Data Types

## Number System

### Types of Number Systems
There are many number systems, but four are highly popular and essential in programming and digital electronics.

| **Number System** | **Base** | **Available Digits** | **Description / Reason for Base** |
| :--- | :---: | :--- | :--- |
| **Decimal** | 10 | 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 | Base is 10 because there are exactly 10 digits available. E.g., 379 internally is $3 \times 10^2 + 7 \times 10^1 + 9 \times 10^0$. |
| **Octal** | 8 | 0, 1, 2, 3, 4, 5, 6, 7 | Base is 8 because there are 8 digits available. |
| **Hexadecimal** | 16 | 0-9 and A, B, C, D, E, F | Hexa means 6, Decimal means 10, so Hexadecimal means 16. It is **case-insensitive** (you can use `a-f` or `A-F` mixed). |
| **Binary** | 2 | 0, 1 | Base is 2 because there are only two possible values. |

### Binary Terminology and Storage Units
*   **Bits:** The values `0` and `1` are called *binary digits*. If you take "b" from binary and "it" from digits, you get the short form **bits**.
*   **Nibble:** 4 bits are considered 1 nibble.
*   **Byte:** 8 bits are considered 1 byte (derived from the words "**bi**nary **te**rm").
*   **Higher Units:**
    *   1024 Bytes = 1 Kilobyte (KB)
    *   1024 Kilobytes = 1 Megabyte (MB)
    *   1024 Megabytes = 1 Gigabyte (GB)
    *   1024 Gigabytes = 1 Terabyte (TB)

### Number System Conversions
There are exactly 12 conversions between these 4 number systems. 

**A. Decimal Conversions (Involving Decimal)**

*Rule:* From Decimal $\rightarrow$ perform repeated division (referred to as LCM operation in the lecture). Into Decimal $\rightarrow$ multiply by base powers.  

*   **Decimal to Binary:** Repeated division (LCM) by 2 until the quotient is less than 2.
*   **Binary to Decimal:** Multiply each bit by powers of 2 (e.g., $2^0, 2^1, 2^2$) and sum them.
*   **Decimal to Octal:** Repeated division (LCM) by 8.
*   **Octal to Decimal:** Multiply each digit by powers of 8. 
*   **Decimal to Hexadecimal:** Repeated division (LCM) by 16.
*   **Hexadecimal to Decimal:** Multiply each digit by powers of 16.

**B. Non-Decimal Conversions (Group/Ungroup Operations)**

*Rule:* If decimal is *not* involved, you must use bit grouping or ungrouping.

*   **Octal $\leftrightarrow$ Binary:** Octal requires exactly **3 bits** for representation ($2^2, 2^1, 2^0$ mapping to $4, 2, 1$).
    *   *Octal to Binary:* **Ungroup** each octal digit into 3 individual bits.
    *   *Binary to Octal:* **Group** every 3 bits starting from the right side.

*   **Hexadecimal $\leftrightarrow$ Binary:** Hexadecimal requires exactly **4 bits** for representation ($2^3, 2^2, 2^1, 2^0$ mapping to $8, 4, 2, 1$).
    *   *Hexadecimal to Binary:* **Ungroup** each hex digit into 4 individual bits.
    *   *Binary to Hexadecimal:* **Group** every 4 bits starting from the right side.

*   **Octal $\leftrightarrow$ Hexadecimal:** *There is no direct conversion.* You must first convert to Binary as an intermediate step, and then group/ungroup appropriately.

### Representing Number Systems in C
In C programming, compilers and editors cannot read subscript bases (like $135_{10}$ or $87_{16}$). Instead, C relies on specific literal formats and format specifiers.

| **Number System** | **Representation in C** | **Format Specifier** | **Example** |
| :--- | :--- | :--- | :--- |
| **Decimal Integer** | Written normally | `%d` or `%i` | `71`, `135` |
| **Octal Integer** | Starts with `0` (zero) | `%o` (lowercase o) | `05`, `0135` |
| **Hexadecimal Integer**| Starts with `0x` or `0X` | `%x` (lowercase) / `%X` (uppercase) | `0xFACE`, `0x1AF` |

*   *Validation Note:* Writing `018` in C will cause a compilation error ("illegal octal") because 8 is not a valid octal digit. `0xBAT` is also invalid because 'T' is not a valid hexadecimal character.

### Format Specifiers and Formatter Operations
*   **Crucial Rule:** A format specifier in `printf` **does not** convert data from one data type to another. It only *formats* the existing data from one representation form to another representation form (e.g., formatting an octal-form integer into a decimal-form output).

**Code Example:**
```c
#include <stdio.h>

void main() {
    /* Example 1: Formatting a Decimal Integer */
    // 135 is Decimal. 
    // %o converts the output to Octal (207)
    // %x converts the output to Hexadecimal (87)
    printf("%d %i %o %x \n", 135, 135, 135, 135); 
    // Output: 135 135 207 87
    
    /* Example 2: Formatting an Octal Integer */
    // 0135 starts with 0, meaning it is an Octal integer.
    // %d computes its decimal equivalent (5*8^0 + 3*8^1 + 1*8^2 = 93)
    // %x computes its hexadecimal equivalent (5D)
    printf("%d %i %o %x \n", 0135, 0135, 0135, 0135);
    // Output: 93 93 135 5d
    
    /* Example 3: Formatting a Hexadecimal Integer */
    // 0x1AF starts with 0x, meaning it is a Hexadecimal integer.
    // %d computes its decimal equivalent (431)
    // %o computes its octal equivalent (657)
    printf("%d %i %o %x \n", 0x1AF, 0x1AF, 0x1AF, 0x1AF);
    // Output: 431 431 657 1af
}
```
*Note on `%x` vs `%X`:* Using `%x` will print alphabetical hex digits in lowercase (e.g., `5d`, `1af`). Using `%X` will print them in uppercase (e.g., `5D`, `1AF`). The leading `0` or `0x` used for input representation is never printed in the output.

## Intro To Data Types

### Prerequisite: Binary Addition
Before diving into data types, understanding binary addition is crucial for programming. The principles of decimal addition apply directly to binary, but with different carry-over thresholds. 

**Binary Addition Rules & Carry Logic:**

*   $0 + 1 = 1$
*   $1 + 1 = 2$ (Decimal) $\rightarrow$ **`10`** in Binary (`1` is the carry, `0` is the result)
*   $1 + 1 + 1 = 3$ (Decimal) $\rightarrow$ **`11`** in Binary (`1` is the carry, `1` is the result)
*   $1 + 1 + 1 + 1 = 4$ (Decimal) $\rightarrow$ **`100`** in Binary (`10` is the carry, `0` is the result)
*   $7$ (Decimal) $\rightarrow$ **`111`** in Binary (`11` is the carry, `1` is the result)
*   $8$ (Decimal) $\rightarrow$ **`1000`** in Binary (`100` is the carry, `0` is the result)

*Note on carries:* Just like in decimal addition (where adding to get 357 means placing 7 and carrying over 35 to the next highest place value), binary carries are passed to the next most significant bit.

### Default Nature of a Variable
When a programmer writes a simple variable declaration like `int i;`, the C compiler implicitly expands this statement.

*   Internally, the compiler converts `int i;` to: **`auto short signed int i;`**.
*   Therefore, the **default nature of a variable** in C is `auto short signed`.

To understand this expanded definition, we must look at the types of specifiers in C:

1.  **Storage Class Specifiers (4 types):** `auto`, `static`, `extern`, `register`.
2.  **Size / Type Specifiers (2 types):** `short`, `long` (There is no "medium" or "extra long").
3.  **Sign / Type Specifiers (2 types):** `signed`, `unsigned`.

### Understanding MSB and LSB
*   **MSB (Most Significant Bit):** The bit that has the **highest power** (not strictly the "leftmost" bit, though it often appears there).
*   **LSB (Least Significant Bit):** The bit that has the **lowest power**.
*   *Crucial Compiler Shortcut:* 
    *   If a data type is **`signed`**, the compiler considers the MSB as **negative**.
    *   If a data type is **`unsigned`**, the compiler considers the MSB as **positive**.

### Signed Data Type Analysis
Assuming a `signed` data type of size 4 bits:

```c
/*
-2^3 2^2 2^1 2^0
-8   4   2   1

0    0   0   0 = 0
0    0   0   1 = 1
0    0   1   0 = 2
0    0   1   1 = 3
0    1   0   0 = 4
0    1   0   1 = 5
0    1   1   0 = 6
0    1   1   1 = 7  (max)
1    0   0   0 = -8 (min)
1    0   0   1 = -7
1    0   1   0 = -6
1    0   1   1 = -5
1    1   0   0 = -4
1    1   0   1 = -3
1    1   1   0 = -2
1    1   1   1 = -1
*/
```

*   The MSB is negative. The bit weights are: $2^0$ (1), $2^1$ (2), $2^2$ (4), and **$-2^3$ (-8)**.
*   **Minimum Value:** `-8` (Binary: `1000`).
*   **Maximum Value:** `7` (Binary: `0111`).
*   **Deriving the Range:** The range progresses by incrementing from 0 up to the maximum (7), and then wrapping to the minimum (-8) and incrementing up to -1.
*   **Range Formula for `n` bits:** **$-2^{n-1}$ to $2^{n-1} - 1$**.

**Important Binary Shortcuts for Signed Types:**

*   If the MSB is `0`, the number is **positive**.
*   If the MSB is `1`, the number is **negative**.
*   The **Maximum** value is always `0` followed by all `1`s (e.g., `0111`).
*   The **Minimum** value is always `1` followed by all `0`s (e.g., `1000`).
*   The value **`-1`** is always represented by **all `1`s** (e.g., `1111`).

### Unsigned Data Type Analysis
Assuming an `unsigned` data type of size 4 bits:

```c
/*
2^3 2^2 2^1 2^0
8   4   2   1

0   0   0   0 = 0 (min)
0   0   0   1 = 1
0   0   1   0 = 2
0   0   1   1 = 3
0   1   0   0 = 4
0   1   0   1 = 5
0   1   1   0 = 6
0   1   1   1 = 7
1   0   0   0 = 8
1   0   0   1 = 9
1   0   1   0 = 10
1   0   1   1 = 11
1   1   0   0 = 12
1   1   0   1 = 13
1   1   1   0 = 14
1   1   1   1 = 15 (max)
*/
```

*   The MSB is positive. The bit weights are: $2^0$ (1), $2^1$ (2), $2^2$ (4), and **$2^3$ (8)**.
*   Because every bit weight is positive, all possible values are positive.
*   **Minimum Value:** `0` (Binary: `0000`).
*   **Maximum Value:** `15` (Binary: `1111`).
*   **Range Formula for `n` bits:** **$0$ to $2^n - 1$**.

*Use Case Rule:* Use `unsigned` when dealing with strictly positive values (like bank balances). Use `signed` when values can fluctuate between positive and negative (like temperature).

\newpage

### Summary Comparison Table

| Feature | `signed` | `unsigned` |
| :--- | :--- | :--- |
| **MSB Sign** | Negative | Positive |
| **Range (n bits)** | $-2^{n-1}$ to $2^{n-1} - 1$ | $0$ to $2^n - 1$ |
| **Minimum Binary Value** | `1` followed by all `0`s | All `0`s |
| **Maximum Binary Value** | `0` followed by all `1`s | All `1`s |
| **Meaning of "All 1s"**| Equals `-1` | Equals the Maximum Value |

### Important Powers of 2 to Remember
Memorizing these powers of 2 is highly beneficial for future operations:

*   $2^7 = 128$
*   $2^8 = 256$
*   $2^9 = 512$
*   $2^{15} = 32,768$
*   $2^{16} = 65,536$
*   $2^{31} = 2,147,483,648$


## Signed char Data Type

### Basic Properties

*   **Default Nature:** In C, if you write `char` without specifying a sign, the compiler implicitly treats it as `signed char`. It is also valid to write it explicitly as `signed char` or `char signed`.
*   **Size:** 8 bits.
*   **Range Calculation:** Because it is a signed type, the Most Significant Bit (MSB) represents the negative sign. Following the range formula for signed types ($-2^{n-1}$ to $2^{n-1} - 1$), the range for an 8-bit signed char is $-2^7$ to $2^7 - 1$.
*   **Exact Range:** **`-128` to `127`**. The 8-bit space is split equally between positive and negative values.
*   **Format Specifier:** `%c` is used to print characters.

### Character Constants & ASCII Values

*   A character constant is any content represented inside a pair of single quotes (e.g., `'A'`). The content inside the single quotes must have a length of exactly one.
*   Systems and compilers only understand binary data, not alphabetical characters. To standardise this, the ASCII (American Standard Code for Information Interchange) committee assigned integer values to characters.
*   **Important ASCII Values to Remember:**
    *   `'A'` = 65, `'B'` = 66, `'C'` = 67 ... `'Z'` = 90.
    *   `'a'` = 97, `'b'` = 98, `'d'` = 100 ... `'z'` = 122.

### Assigning Different Data Types to char

In C, you can assign integer or even float data to a character variable. The compiler handles the internal conversion to ensure the result matches the variable's type.

```c
char ch1 = 97;      // Valid. Internally stores small 'a'
char ch2 = 100.75;  // Valid. Float is truncated to 100, which internally stores 'd'
```

### Understanding Format Specifiers & Internal Representations

A highly critical concept is that a **format specifier does not convert data**; it only formats existing internal data into a specified output representation.

*   **Binary Data Types:** `char` and `int` are stored internally in standard **binary form**.
*   **Float Data Types:** `float` is *not* stored directly in pure binary; it uses the **IEEE 754 Standard representation**.
*   **Specifier Behavior:**
    *   `%c`, `%d`, `%x`, `%o` take binary data and format it into a character, decimal, hexadecimal, or octal output, respectively.
    *   `%f` expects IEEE 754 float data.
*   **Garbage Values:** 
    *   If you supply a float value (IEEE 754 data) but use `%c` or `%d`, it tries to print standard binary data, resulting in a **garbage value**.
    *   Conversely, if you supply character/integer data (binary data) but use `%f`, it expects IEEE 754 data, also resulting in a **garbage value**.

### Out of Range Assignments (The "Butterfly Diagram" Logic)

If you assign a value to a `signed char` that falls outside its valid range (`-128` to `127`), the compiler does not throw an error; instead, it performs binary addition that results in a cyclical wrap-around.

**Mathematical Wrap-Around Example:**

If a programmer tries to assign `128` to a `signed char` (which is out of range):

1.  The compiler internally treats `128` as the maximum valid value `127` + `1`.
2.  The binary for `127` (maximum positive) is `01111111`.
3.  The binary for `1` is `00000001`.
4.  Adding them together yields `10000000`.
5.  In an 8-bit signed integer, an MSB of `1` followed by all `0`s represents the minimum possible value: **`-128`**.

| Assigned Value | Wrap-Around Calculation | Internal Binary Result | Output Result |
| :--- | :--- | :--- | :--- |
| `128` | `127` + `1` | `10000000` | `-128` |
| `129` | `127` + `2` | `10000001` | `-127` |
| `130` | `127` + `3` | `10000010` | `-126` |
| `-129` | `-128` + `-1` | `10000000` + `11111111` = `01111111` | `127` |

**The Butterfly Diagram Analogy:**

```c
/*
 /---\   /---\
|     | ^    |
|     V |    |
|    -128    |
|    -127    |
|     ...    |
|      0     |
|     ...    |
|     126    |
|     127    |
|     | ^    |
|     V |    |
 \---/   \---/
*/
```
Whenever a value crosses the upper bound of the positive range (`127`), it wraps around and continues from the negative bound (`-128`) upwards. Conversely, if a value crosses the lower bound of the negative range (`-128`), it wraps around to the maximum positive value (`127`) and counts downwards. The number of steps you cross out of bounds dictates how many steps you take from the opposite end.

## Unsigned char Data Type

### Basic Properties

*   **Default Nature:** If you write simply `char`, the compiler treats it as `signed` by default. To explicitly use the unsigned version, you must specify `unsigned`.
*   **Syntax Flexibility:** Writing `unsigned char` or `char unsigned` are both perfectly valid and mean exactly the same thing to the compiler.
*   **Size:** 8 bits.
*   **Range Calculation:** Since it is an unsigned data type, the range formula is $0$ to $2^n - 1$. 
    *   Here, $n = 8$. 
    *   $0$ to $2^8 - 1$ $\rightarrow$ $0$ to $256 - 1$.
*   **Exact Range:** **`0` to `255`**.
*   **Format Specifier:** `%c` is used to print characters.
*   **Character Constants:** Any content represented inside a pair of single quotes (e.g., `'A'`, `'+'`, `'D'`, `'9'`, `'K'`) is considered a character constant. *(Note: The specific use cases for choosing between signed and unsigned characters will be deeply explored in later concepts like Strings)*.

### Out of Range Assignments (The Butterfly Diagram)
Just like `signed char`, if you assign a value to an `unsigned char` that falls outside of its `0` to `255` boundary, the compiler does not generate an error. Instead, it performs a cyclical wrap-around, which can be visualized using the "Butterfly Diagram".

**Code Example:**

```c
#include <stdio.h>

void main() {
    unsigned char ch; // ch is an unsigned char variable
    
    // Assigning a value outside the 0 to 255 range
    ch = -1;          
    
    // Printing the integer representation
    printf("%d", ch); 
}
```

**Understanding the Output:**

When `-1` is assigned to `ch`, the compiler recognizes it is out of bounds. There are two ways to derive the internal value:


1.  **Binary Method:** The binary representation for `-1` in memory is "all 1s" (`11111111`). For an unsigned 8-bit integer, all 1s represent the absolute maximum value, which is `255`.
2.  **Butterfly Diagram Method:** Since `-1` is exactly one step below the minimum bound (`0`), the value wraps around to the maximum bound and counts down one step, resulting in `255`. 

**Wrap-Around Examples for `unsigned char`:**

| Programmer Input | Wrap-Around Logic | Final Output Value |
| :--- | :--- | :--- |
| `-1` | One step below `0` wraps to max | `255` |
| `-2` | Two steps below `0` | `254` |
| `-3` | Three steps below `0` | `253` |
| `256` | One step above `255` wraps to min | `0` |
| `257` | Two steps above `255` | `1` |

*Rule of Thumb:* Whenever the value is not in the valid range, you must use the butterfly diagram (wrap-around logic) to determine the equivalent internal value.

## Short int Data Type

This section covers both the signed and unsigned versions of the `short int` data type, detailing their behaviors, ranges, and crucial rules like the Type Promotionality Rule.

### Basic Properties (Signed Short Integer)
*   **Default Nature:** If you write `int`, the compiler considers its default nature to be `signed` and `short`. You can declare it in several interchangeable ways: `short`, `signed`, `short int`, `signed short`, or `int signed short`. In all these cases, the order of keywords does not matter; the compiler treats them all as a 16-bit signed integer.
*   **Size:** 16 bits.
*   **Range Calculation:** Using the formula $-2^{n-1}$ to $2^{n-1} - 1$ (where $n = 16$), the range is $-2^{15}$ to $2^{15} - 1$.
*   **Exact Range:** **`-32768` to `32767`**.
*   **Format Specifier:** `%d` (decimal) or `%i` (integer).

### Basic Properties (Unsigned Short Integer)
*   **Default Nature:** To use the unsigned version, the `unsigned` keyword is mandatory. You can declare it as `unsigned int`, `unsigned short`, or simply `unsigned`. 
*   **Size:** 16 bits.
*   **Range Calculation:** Using the formula $0$ to $2^n - 1$, the range is $0$ to $2^{16} - 1$.
*   **Exact Range:** **`0` to `65535`**.
*   **Format Specifier:** `%u`.
*   **Unsigned Constants:** To explicitly represent a number as an unsigned integer constant, you append a `u` or `U` to the end of the number (e.g., `5U`, `100u`, `0xFU`).


### Out of Range Assignments (The Butterfly Diagram)
Whenever you assign a value that exceeds the boundaries of a data type, the compiler does not throw an error; instead, it performs a wrap-around.

**1. Signed `short int` Wrap-Around:**

If you try to assign `32767 + 1` to a signed short integer, it crosses the maximum boundary (`32767`). It wraps around to the lowest possible value, resulting in **`-32768`**.

```c
short int s;
s = 32767 + 1;
printf("%d", s); // Output: -32768

s = 200 * 200;   // 40000
if (s == 40000) {
    printf("Equal");
} else {
    printf("Not Equal"); // This will execute
}
```

*   *Multiplication Trap:* If you perform `200 * 200` and store it in a `short int`, the mathematical result is `40000`. Because `40000` is strictly outside the maximum range (`32767`), it wraps around into the negative numbers. If you then write an `if` condition checking if the variable `== 40000`, the condition will be **false** because the variable internally holds a negative number, not `40000`.

```c
// Out of range problematic code
void main() {
    short s;
    s = 1;
    while(s++ >= 1);
    printf("%d", s); // Output: -32768
}
```

**2. Unsigned `short int` Wrap-Around:**

```c
void main() {
    unsigned short u;
    u = -1;
    printf("%d", u); // Output: 65535
    printf("%u", u); // Output: 65535
}
```

If you assign `-1` to an `unsigned short` variable, it falls one step below the minimum boundary of `0`. Wrapping backwards, it takes the maximum possible value for that data type, resulting in **`65535`**.

### The Type Promotionality Rule (Important Concept)
A highly critical rule in C operations is the **Type Promotionality Rule**: Whenever you perform an operation (like addition or comparison), both arguments must be of the same data type. If they are not, the compiler automatically 

**promotes the lower data type to the higher data type**.

*   **What makes a type "Higher"?** A higher data type is the one capable of holding a larger maximum positive value.
*   Comparing `signed short` and `unsigned short`, both are 16 bits (2 bytes). However, `unsigned short` holds up to `65535`, while `signed short` only holds up to `32767`. Therefore, **`unsigned short` is considered the higher data type**.

**Interview Example:**
```c
signed short s = -2;
unsigned short u = 3;

if (s >= u) {
    printf("Hello");
} else {
    printf("Hi");
}
```

*   *Common Misconception:* A programmer might look at `-2 >= 3` and assume it is `False`, printing "Hi".
*   *Actual Compiler Logic:* Because `s` is signed and `u` is unsigned, `s` is promoted to the higher data type (`unsigned`). The internal unsigned equivalent of `-2` is `65534`. The compiler evaluates `65534 >= 3`, which is **True**, printing **"Hello"**.

### The Unsigned Infinite Loop Trap
Using `unsigned` variables in loop conditions can lead to unexpected infinite loops.

**Code Example:**
```c
unsigned short u;
for (u = 5; u >= 0; u--) {
    // Loop body
}
```

*   *Why it is an infinite loop:* The loop correctly counts down from `5` to `0`. However, when `u` is `0` and decrements by 1 (`u--`), it does not become `-1`. Because it is an unsigned variable, it wraps around to **`65535`**. Since `65535` is strictly `>= 0`, the loop condition remains true. An unsigned variable can *never* be less than 0, meaning the condition `u >= 0` is permanently valid.

## Long int Data Type

This lecture covers the `long int` data type, introduces the concept of Type Casting, and explains how compiler architecture dictates the size of standard integers.

### Basic Properties (Signed Long Integer)

*   **Default Nature:** If you omit `signed` or `int` and just write `long`, the compiler assumes it is a `signed long int`. The declarations `long int`, `signed long int`, `signed long`, and `long` are all equivalent.
*   **Size:** 32 bits (4 bytes).
*   **Range:** $-2^{31}$ to $2^{31} - 1$. 
    *   **Exact Range:** **`-2147483648` to `2147483647`**.
*   **Format Specifier:** `%ld` (`l` for long, `d` for decimal) or `%li` (`i` for integer).

### Basic Properties (Unsigned Long Integer)

*   **Default Nature:** To make it unsigned, the `unsigned` keyword is compulsory. You can declare it as `unsigned long int` or `unsigned long`.
*   **Size:** 32 bits (4 bytes).
*   **Range:** $0$ to $2^{32} - 1$.
    *   **Exact Range:** **`0` to `4294967295`**.
*   **Format Specifier:** `%lu` (or some compilers allow `%ul`).

### Long Constants and Suffixes
When writing numeric constants, the compiler assigns them a data type automatically based on their value, or you can explicitly enforce a type using suffixes.

*   **`5`**: Standard integer.
*   **`5L`**: Explicit `long` integer.
*   **`5U`**: Explicit `unsigned` integer.
*   **`100UL`**: Explicit `unsigned long` integer.
*   **Implicit Range Promotion:** 
    *   `40000`: Since it exceeds the standard 16-bit `short int` maximum of `32767`, the compiler implicitly treats it as a `long int` (no `L` suffix required).
    *   `40000U`: This is considered an `unsigned short` (because the `unsigned short` limit is `65535`). To make it long, you must write `40000UL`. 
    *   `75000U`: Since it crosses `65535`, it is automatically treated as an `unsigned long`.

### Type Casting (Type Conversion)
Type casting is the process of converting one type of data to another type of data. 

**The Problem Scenario:**

If you want to calculate the average of three integer marks (totaling `185`), dividing integer `185` by integer `3` results in an integer `61`, truncating the decimal `.66`. You cannot just write `total / 3.0` if you strictly want to use your integer variables without hardcoding floats.

**The Solution:**

```c
int total = 185;
// Informing the compiler to temporarily convert 'total' to float for this line
float average = (float)total / 3; 
```

*   **Explicit Type Casting:** This is when the programmer manually forces the conversion (e.g., `(float)total`). The English meaning of "explicit" is "clear".
*   **Implicit Type Casting:** This is when the compiler automatically performs the conversion (e.g., if you write `int a = 3.5;`, the compiler implicitly does `a = (int)3.5;`). The meaning of implicit is "not clear" (hidden).
*   *Note on Permanence:* Type casting is temporary for that specific statement alone. The variable `total` remains an `int` in subsequent lines.

**Priority and Flow of Type Cast Operators:**

*   Type casting is a unary operator, meaning it evaluates from **right to left**.
*   It holds a very high priority—higher than multiplication, division, or modulus.
    *   *Example:* `(int)5.5 % 2` $\rightarrow$ The cast happens first. `5 % 2` evaluates to `1`.
    *   *Nested Casts:* `(char)(int)100.75` $\rightarrow$ First evaluates to `(char)100`, which converts the integer `100` into the ASCII character `'d'`.

### Compiler Architecture and the "Plain int"
A highly critical concept in C is that **the size of a plain `int` is the same as the compiler's bit length**. 

| Feature | 16-bit Compiler (e.g., Turbo C / DOS) | 32-bit Compiler (e.g., GCC / Linux) |
| :--- | :--- | :--- |
| **`short int` Size** | 2 bytes (Fixed) | 2 bytes (Fixed) |
| **`long int` Size** | 4 bytes (Fixed) | 4 bytes (Fixed) |
| **`int` (Plain) Size** | **2 bytes** (Acts as `short`) | **4 bytes** (Acts as `long`) |

*   **Turbo C:** Uses a 16-bit architecture (processes 16 bits per machine cycle). An `int` defaults to 2 bytes.
*   **GCC (GNU C Compiler):** Uses a 32-bit architecture. An `int` defaults to 4 bytes.
*   **Rule of Thumb:**
    *   If you absolutely need 2 bytes, always use `short int`.
    *   If you absolutely need 4 bytes, always use `long int`.
    *   If you want the size to scale with the machine architecture, use plain `int`.

**The 64-bit Evolution (`long long`):**

In newer 64-bit architectures, plain `int` is typically restricted to 4 bytes to maintain compatibility with languages like Java. To handle 8-byte data, C introduced:

*   `long long` (8 bytes).
*   `unsigned long long` (8 bytes).
*   *Use Cases:* This 8-byte format is heavily used in TCP/UDP networking packet structures and embedded electronics protocols (like the CAN protocol).
*   *Constants:* `5LL` (long long int), `0xFULL` (Hex unsigned long long).

### Cross-Platform Wrap-Around Examples
Because `int` size varies by compiler, addition logic behaves differently depending on the architecture:

*   `32767 + 1` in Turbo C (16-bit): Both are 2 bytes. The max bound `32767` is crossed, triggering the butterfly wrap-around. The result is `-32768`.
*   `32767 + 1` in GCC (32-bit): Since `int` is 4 bytes (acting as long), the maximum bound is 2 billion. Therefore, `32767 + 1` easily fits inside the range, simply resulting in `32768`.

## Floating-point Datatypes

This subsection covers how C handles decimal values, the IEEE 754 standard for internal storage, and the critical differences between single and double precision that often lead to comparison errors.

### Default Nature of Decimal Numbers

*   **Crucial Rule:** In C, any decimal point number (e.g., `0.6`, `5.82`, `-18.9`) is considered a **`double`** by default, not a `float`.
*   To explicitly define a decimal number as a `float`, you must append an `f` or `F` to the end of the number (e.g., `3.5F` or `-2.512F`).
*   To define a decimal number as a `long double`, you append an `L` (e.g., `3.5L`).

### Binary Conversion of Fractional Numbers

To convert a fractional decimal number to binary, you multiply it by 2, record the integral part (`0` or `1`), and repeat the process with the remaining fractional part.

*   **Finite Representation (Example: 0.125):**
    *   `0.125 * 2 = 0.25` $\rightarrow$ Take `0`.
    *   `0.25 * 2 = 0.5` $\rightarrow$ Take `0`.
    *   `0.5 * 2 = 1.0` $\rightarrow$ Take `1`.
    *   Remaining is `0.0`, so the process ends. The binary is exactly `0.001` (requires 3 bits).

*   **Infinite Representation (Example: 0.6):**
    *   `0.6 * 2 = 1.2` $\rightarrow$ Take `1`, remaining is `0.2`.
    *   `0.2 * 2 = 0.4` $\rightarrow$ Take `0`, remaining is `0.4`.
    *   `0.4 * 2 = 0.8` $\rightarrow$ Take `0`, remaining is `0.8`.
    *   `0.8 * 2 = 1.6` $\rightarrow$ Take `1`, remaining is `0.6`.
    *   `0.6 * 2 = 1.2` $\rightarrow$ Take `1`, loop repeats.
    *   The binary value is `0.100110011...` extending to infinite bits.

### IEEE 754 Standard and Precision
Because storing infinite bits for numbers like `0.6` would consume the entire memory, a committee introduced the **IEEE 754 Standard** floating-point representation to store these numbers in a finite, standardized format. 

Both `float` and `double` are divided into three parts: a Sign bit, an Exponent (integral part), and a Mantissa (fractional part).

| Feature | `float` | `double` |
| :--- | :--- | :--- |
| **Total Size** | 32 bits (4 bytes) | 64 bits (8 bytes) |
| **Sign Bit** | 1 bit | 1 bit |
| **Exponent Part** | 8 bits | 11 bits |
| **Mantissa (Fractional Part)** | 23 bits | 52 bits |
| **Precision Term** | **Single Precision** | **Double Precision** |

*   **Precision Definition:** Precision refers strictly to the number of bits allocated to represent the fractional part (Mantissa) of the number, not the number of visual decimal digits printed. Using 23 bits is called "single precision" while using 52 bits is called "double precision".

### The Comparison Trap (Precision Loss)
Assigning a double-precision value to a single-precision variable can cause subtle, critical bugs due to **precision loss**.

**Code Example:**
```c
float f1 = 0.125;
if (f1 == 0.125) {
    printf("Hello");
} else {
    printf("Hi");
}
// Output: Hello

float f2 = 0.6;
if (f2 == 0.6) {
    printf("Hello");
} else {
    printf("Hi");
}
// Output: Hi
```

**Why does `f2 == 0.6` print "Hi" (False)?**

1.  `0.6` is a `double` requiring infinite bits, but it is bounded to 52 bits of precision internally.
2.  When assigned to `float f2`, the compiler copies only the first 23 bits and truncates the rest. Because the bits representing `0.6` contain `1`s well past the 23rd bit, truncating them permanently loses value. 
3.  When evaluated, the truncated 23-bit `f2` is compared against the full 52-bit double `0.6`. They are no longer mathematically equal, resulting in `False` ("Hi").
4.  *Why did `0.125` work?* `0.125` completely resolves in just 3 bits. Truncating it from 52 bits down to 23 bits only chops off trailing zeros, meaning exactly zero value is lost. Thus, the comparison remains `True` ("Hello").
*   *Conclusion:* Never assign double-precision data to a single-precision variable if you plan on doing exact equality comparisons, as precision loss is highly probable.

### Summary of Floating-Point Properties
The absolute sizes and ranges depend on the compiler's machine architecture. However, the standard representations are as follows:

| Data Type | Size | Range | Format Specifiers | Example Assignment |
| :--- | :--- | :--- | :--- | :--- |
| **`float`** | 32-bit | $-3.4 \times 10^{38}$ to $3.4 \times 10^{38}$ | `%f`, `%e`, `%g` | `3.5F`, `-7.261F` |
| **`double`** | 64-bit | $-1.7 \times 10^{308}$ to $1.7 \times 10^{308}$ | `%lf`, `%le`, `%lg` | `3.5`, `18.263` |
| **`long double`** | 80-bit | $3.4 \times 10^{4932}$ to $3.4 \times 10^{4932}$ | `%Lf`, `%Le`, `%Lg` | `3.5L`, `18.263L` |

*(Note: `%lf` stands for "long float", which was the historical name used for double in older C standards).*

## Sizeof Operator

This subsection of the Data Types chapter covers the `sizeof` operator, a powerful tool used to determine the exact memory footprint of various elements in a C program, along with its unique behaviors regarding expression evaluation and type promotion.

### The Need for the sizeof Operator

*   The sizes of fundamental data types like `int`, `float`, `double`, and `long double` are not rigidly fixed; they vary from machine to machine (e.g., an `int` could be 2 bytes or 4 bytes).
*   If a programmer needs to know the exact size of a specific data type on the current machine architecture, they must use the `sizeof` operator.
*   **Functionality:** Just as the addition operator yields a sum, `sizeof(X)` yields the size of `X` in the number of bytes.

### Valid Arguments for the sizeof Operator

The argument `X` provided to the `sizeof` operator can be one of four things:

1.  **Data Type:** (e.g., `sizeof(int)`)
2.  **Variable:** (e.g., `sizeof(ch)`)
3.  **Constant:** (e.g., `sizeof(5)`)
4.  **Expression:** (e.g., `sizeof(a + b)`)
*   *Invalid Example:* Writing `sizeof(if)` will result in a compilation error because `if` is a keyword, not a data type, variable, constant, or expression.

### Size of Data Types and Variables

When passing standard data types or variables, the operator returns the byte size allocated by the compiler:

*   `sizeof(char)` $\rightarrow$ `1`.
*   `sizeof(int)` $\rightarrow$ `2` or `4`.
*   `sizeof(long)` $\rightarrow$ `4`.
*   `sizeof(float)` $\rightarrow$ `4`.
*   `sizeof(double)` $\rightarrow$ `8`.

### Size of Constants

When you pass a constant value, the compiler evaluates the default data type of that constant and returns its size:

*   `sizeof(5)` $\rightarrow$ Integer type, returns `2` or `4`.
*   `sizeof(40000)` $\rightarrow$ Exceeds short integer bounds, implicitly treated as `long int`, returns `4`.
*   `sizeof(3.75)` $\rightarrow$ Decimal point numbers default to `double`, returns `8`.
*   `sizeof(3.75F)` $\rightarrow$ The `F` suffix makes it a `float`, returns `4`.
*   `sizeof(3.75L)` $\rightarrow$ The `L` suffix makes it a `long double`, returns `10` or `16` (machine dependent).

### Size of Expressions (The "No-Execution" Rule)

This is a highly critical concept: **Whenever you perform any operation inside the `sizeof` operator, the compiler will completely ignore (not execute) the operation**. It only checks the *expression result type* to determine the size.

**Example A: Increments**
```c
int a = 10;
printf("%d", sizeof(++a)); 
printf("%d", a);
```

*   *Output:* Size is `2` (or `4`), but the value of `a` remains `10`. The compiler evaluates that `++a` results in an `int`, returns the size of an `int`, and completely skips executing the increment.


**Example B: Assignments**
```c
short s = 5;
printf("%d", sizeof(s = 3.75));
printf("%d", s);
```

*   *Output:* Size is `2`, and `s` remains `5`. Even though `3.75` is a double, the assignment operator stores the value into the target variable type (`short`). Thus, the expression result type is `short` (2 bytes), and the assignment itself is never executed.

**Example C: Relational Operations**
```c
sizeof(4.75 > 2.5);
```

*   *Output:* `2` or `4`. Relational operators always return a boolean `1` or `0`, which C treats as an `int`. Therefore, it returns the size of an `int`.


**Example D: Invalid Expressions & Division by Zero**

*   The expression inside must be syntactically valid. `sizeof(5.0 % 2)` results in a compilation error because modulus operations cannot be applied to floating-point numbers.
*   `sizeof(5 / 0)` is syntactically valid (`int` / `int`). Because the operator does not execute the expression, it does not throw a runtime division-by-zero error. It simply returns the size of an `int` (`2` or `4`).

### The Type Promotionality Trap with sizeof
The `sizeof` operator always returns a size, and a memory size is always a strictly positive number. Therefore, the return type of `sizeof` is implicitly an **`unsigned` integer** (also internally defined as `size_t`).

This leads to a famous interview trap using the Type Promotionality Rule:
```c
if (sizeof(int) > -1) {
    printf("Hello");
} else {
    printf("Hi");
}
```

*   *Logical Assumption:* `sizeof(int)` is `2`. `2 > -1` is mathematically True, so it should print "Hello".
*   *Actual Compiler Logic:* `-1` is a signed negative number. `sizeof` returns an `unsigned` positive number. When comparing different data types, the compiler promotes the lower type (`signed`) to the higher type (`unsigned`). The internal unsigned equivalent of `-1` is `65535`. The compiler evaluates `2 > 65535`, which is **False**, resulting in **"Hi"**.

### Operator Priority
The `sizeof` operator resides at the highest level of operator priority, sharing precedence with unary operators like logical NOT (`!`), increment/decrement (`++`, `--`), unary plus/minus (`+`, `-`), and Type Casting. It is evaluated before multiplication, division, addition, and relational checks.
