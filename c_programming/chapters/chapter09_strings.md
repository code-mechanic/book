# Strings and Character Arrays

In C, there is no native "string" data type. Instead, a string is strictly defined as an array of characters terminated by a special Null character (`\0`). To fully master strings, programmers must first understand ASCII character representation, memory segments, pointer arithmetic on character addresses, and how standard input/output streams handle character buffers. This chapter explores string construction, formatted printing traps, advanced input scanning, and the manual implementation of core `<string.h>` library functions.

*   [Character Representation and Escape Sequences](#character-representation-and-escape-sequences)
*   [String Construction and Memory Architecture](#string-construction-and-memory-architecture)
*   [Printing Strings and Pointer Arithmetic](#printing-strings-and-pointer-arithmetic)
*   [Multi-Dimensional Strings](#multi-dimensional-strings)
*   [String Input and Stream Flushing](#string-input-and-stream-flushing)
*   [The string.h Library and Core Functions](#the-stringh-library-and-core-functions)
*   [Advanced Functions and Recursion](#advanced-functions-and-recursion)

***

## Character Representation and Escape Sequences

The ASCII committee initially defined 128 standard characters (0 to 127). To represent these, C provides the `signed char` data type. Later, the ASCII set was extended to 256 characters (128 to 255) to include mathematical symbols like the degree sign (`°`). To access this extended set, programmers must strictly use the `unsigned char` data type.

Because some characters (like the Enter key or the degree symbol) cannot be typed directly as visual output, C allows character constants to be represented in multiple ways, most notably using Escape Sequences (`\`). 

Escape sequences alter the compiler's parsing rules. The behavior of certain escape sequences varies heavily between the Turbo C and GCC (Linux) compilers.

**Special characters**

| No. | Name | Escape Sequence |
| --- | --- | --- |
| 1 | newline | `'\n'` |
| 2 | tab | `'\t'` |
| 3 | back space | `'\b'` |
| 4 | Carriage return | `'\r'` |
| 5 | beep Sound | `'\a'` |
| 6 | Single quote | `'\''` |
| 7 | double quote | `'\"'` |
| 8 | back slash | `'\\'` |
| 9 | percentile | `'%%'` |
| 10 | formfeed | `'\f'` |

**Escape Sequence Examples**

**1. Basic Print (No Escape Sequence)**

```c
printf("hello"); 
printf("world");
// Output: helloworld_ (Cursor stays at the end of the line)

```

**2. Newline (`\n`)**

```c
printf("hello\n"); 
printf("world");
/* Output: 
hello
world
*/

```

**3. Multiple Newlines**

```c
printf("he\nll\no");
/* Output:
he
ll
o
*/

```

**4. Horizontal Tab (`\t`)**

```c
printf("hello\tind");
// Output: hello    ind (Inserts a tab space)

```

**5. Single Backspace**

```c
printf("hello\b");

```

* **tc (Non-destructive):** Cursor moves left under the 'o'.
* **gcc (Terminal-dependent Destructive):** The 'o' is deleted resulting in `hell_`.

**6. Multiple Backspaces**

```c
printf("hello\b\b\b");

```

* **tc:** Cursor moves left 3 spaces to sit under the first 'l'. Output still looks like `hello`.
* **gcc:** Deletes the last 3 characters resulting in `he_`.

**7. Backspace and Overwrite**

```c
printf("hello\b\b\b\bx");

```

* **tc:** Cursor moves left 4 spaces (under 'e'). 'x' overwrites 'e'.
* **gcc:** Deletes 4 characters, prints 'x', resulting in `hx_`.

**8. Single Carriage Return**

```c
printf("hello\r");

```

* **tc:** Cursor jumps back to the beginning of the line (under 'h'). Word remains visible as `hello`.
* **gcc:** The board indicates the line is cleared entirely.

**9. Carriage Return and Overwrite**

```c
printf("hello\rhai");

```

* **tc:** Cursor jumps to the beginning. "hai" overwrites the first three letters ("hel"). The "lo" remains. Output: `hailo`.
* **gcc:** The board indicates it prints `hai_` (ignoring or clearing the rest of the original string).

**10. Newline followed by Carriage Return**

```c
printf("hello\n\r");
/* Output:
hello
_ (Cursor is strictly at the very beginning of this new line)
*/

```

**11. System Beep**

```c
printf("hello\ahai\n");
// Output: Prints "hello", triggers a system beep sound, then prints "hai" and moves to a new line.

```

```c
// 12. Standard print
printf("hello"); 
// Output: hello

// 13, 14, 15. Unescaped quotes inside a string
printf(""hello""); // Compiler Error (C.E) - The compiler sees empty strings and unknown text.
printf("""hello"""); // hello
printf(""""hello""""); // C.E

// 16. Correctly escaping double quotes
printf("\"hello\""); 
// Output: "hello"

```

```c
// 17. Dangling escape character
printf("\"); 
// Compiler Error - The compiler thinks you are escaping the closing quote!

// 18. Escaping the backslash
printf("\\"); 
// Output: \

// 19. Standard newline
printf("\n"); 
// Output: (Moves cursor to the next line)

// 20. Escaping the backslash before 'n'
printf("\\n"); 
// Output: \n (Prints the literal characters '\' and 'n')

// 21. Escaped backslash followed by an active newline
printf("\\\n"); 
// Output: \
// (and then moves to the next line)

```

```c
// 22 & 23. Mixing literal percents and format specifiers
printf("%d %%d = %d", 5, 2, 5%2);
// Output: 5 %d = 1
printf("%d %% %d = %d", 5, 2, 5%2); 
// Output: 5 % 2 = 1 
// (The '%%' prints a literal '%')

// 24. Single dangling percent
printf("%"); 
// Turbo C (tc) Output: %
// GCC Output: no output (or a compiler warning)

// 25. Correct way to print a percent sign
printf("%%"); 
// Output: %

// 26. Three percent signs (Undefined/Compiler dependent)
printf("%%%"); 
// tc Output: %%
// gcc Output: %

// 27. Four percent signs (Two literal % signs)
printf("%%%%"); 
// Output: %%

// 28. Standard format specifier
printf("%d", 10); 
// Output: 10

// 29. Missing argument
printf("%d"); 
// Output: GV (Garbage Value - reads whatever is currently in memory)

// 30. Literal percent followed by 'd'
printf("%%d", 10); 
// Output: %d (The 10 is ignored because there is no active format specifier)

// 31. Literal percent followed by an active format specifier (Missing Argument)
printf("%%%d"); 
// Output: %GV (Prints '%', then a Garbage Value for the missing argument)

// 32. Literal percent followed by an active format specifier (With Argument)
printf("%%%d", 10); 
// Output: %10

```

```c
printf("hello\fhai");

```

* **Purpose:** It was designed for physical printers, not modern screens.
* **Behavior:** When sent to a printer, `\f` tells the printer to eject the current page and start printing on the top of the next page.
* **Result:**
    * **Paper 1:** prints `hello`
    * *(Page Ejects)*
    * **Paper 2:** prints `hai`

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* TURBO C (INSERT MODE) */        |   | /* GCC LINUX (DELETE MODE) */      |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     // \b moves cursor back        |   |     // \b moves cursor AND deletes |
|     // Data is NOT deleted         |   |     // Data IS deleted             |
|     printf("Hello\b\b\bX\n");      |   |     printf("Hello\b\b\bX\n");      |
|                                    |   |                                    |
|     // Output: HeXlo               |   |     // Output: HeX                 |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

To print a literal percentage sign (`%`) or a backslash (`\`), programmers must use duplicate symbols. Like `\b`, percentage printing behaviors also vary by compiler.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* TURBO C COMPILER */             |   | /* GCC LINUX COMPILER */           |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     // 1 % prints a % sign         |   |     // 1 % is IGNORED!             |
|     printf("Value: % \n");         |   |     // MUST use 2 % signs          |
|                                    |   |     printf("Value: %% \n");        |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+


**Character Representation**

```c
#include <stdio.h>

int main() {
    /* 6 WAYS TO REPRESENT A CHARACTER */
    char c1 = 'A';       // Character Constant
    char c2 = 97;        // Decimal Integer Constant ('a')
    char c3 = 0141;      // Octal Integer Constant ('a')
    char c4 = 0x61;      // Hexadecimal Integer Constant ('a')
    char c5 = '\141';    // Octal Character Constant ('a')
    char c6 = '\x61';    // Hexadecimal Character Constant ('a')
    
    // The Null character is strictly an Octal Character Constant
    char null_char = '\0'; 
    
    // integer 0 vs character '0' vs null '\0'
    printf("Integer 0: %d\n", 0);           // 0
    printf("Character '0' ASCII: %d\n", '0');// 48
    printf("Null '\\0' ASCII: %d\n", '\0');  // 0
    
    return 0;
}
```

Whenever there are some characters that cannot represent using the keyboard then we should use `Octal Character Constant` or `Hexadecimal Character Constant`

```c
void main()
{
    char ch = '\401';
    printf("%d", ch);
    // Output Compiler error: Out of range

/*
Octal Character Constant Range:

╭╮╭──╮╭─╮
0000 0000 = '\000' (min range)
╭╮╭──╮╭─╮
1111 1111 = '\377' (max range)

Hexadecimal Character Constant Range:

╭──╮ ╭──╮
0000 0000 = '\x00' (min range)
╭──╮ ╭──╮
1111 1111 = '\xFF' (max range)
*/
}
```

**Key Summary: Character Representation and Escape Sequences**

*   `unsigned char` is required to use Extended ASCII symbols (128-255).
*   `\0` is not just a symbol; it is strictly the Octal Character Constant for the integer `0`.
*   Escape sequences like `\b` (Backspace) behave differently across compilers (Turbo C moves the cursor; GCC physically deletes the character).

***

## String Construction and Memory Architecture

Every string enclosed in double quotes (`"hello"`) is inherently a **String Constant**. The compiler stores this string constant in the Read-Only (RO) Data Segment of memory and replaces the double quotes in your code with the string's starting base address.

Programmers can construct strings using an Array of Characters or a Character Pointer. 

*   **Array Construction:** Allocates fresh memory on the stack and copies the string into it. The programmer can freely modify the characters.
*   **Pointer Construction:** Simply points to the Read-Only memory segment where the string constant lives. Any attempt to modify it causes a Segmentation Fault.

> `%s` is not a format specifier for string. it is for character pointer (char *).

```c
void main() 
{
    char ch[] = {'a', 'b', 'c', 'd', 'e', 'f', '\0'};
    
    // 1. Standard string print
    printf("%s", ch);     // Output: abcdef
    
    // 2. Printing the base address (assuming it resides at 500)
    printf("%d", ch);     // Output: 500 
    
    // 3. Early string termination
    ch[3] = '\0';
    printf("%s", ch);     // Output: abc
    
    // 4. Restoring the character (ASCII 100 is 'd')
    ch[3] = 100;
    printf("%s", ch);     // Output: abcdef
    
    // 5. Overwriting the null terminator
    ch[6] = 'g';
    printf("%s", ch);     // Output: abcdefgGCGCGC..... 
                          // (Prints garbage until it hits a random '\0' in memory)
    
    // 6. Restoring the null terminator (0 is equivalent to '\0')
    ch[6] = 0;
    
    // 7. Printing from a specific offset
    printf("%s", &ch[3]); // Output: def
    // &ch[3] = &*(ch + 3)
    //        = ch + 3
    //        = 500 + 3
    //        = 503
    
    // 8. Attempting to increment the array base address
    printf("%s", ++ch);   // C.E: L-value required

/*
╭─────────────────────────────────── ch ────────────────────────────────────╮
╭── [0] ──╮╭── [1] ──╮╭── [2] ──╮╭── [3] ──╮╭── [4] ──╮╭── [5] ──╮╭── [6] ──╮
┌─────────┬──────────┬──────────┬──────────┬──────────┬──────────┬──────────┐
│   'a'   │   'b'    │   'c'    │   'd'    │   'e'    │   'f'    │   '\0'   │
└─────────┴──────────┴──────────┴──────────┴──────────┴──────────┴──────────┘
500       501        502        503        504        505        506
*/
}
```

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* STRING AS ARRAY (MUTABLE) */    |   | /* STRING AS POINTER (READ-ONLY)*/ |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     // Allocates new memory        |   |     // Points to RO Data Segment   |
|     char s1[] = "hello";           |   |     char *s2 = "hello";            |
|                                    |   |                                    |
|     // VALID: Data is mutable      |   |     // CRASH: Data is read-only    |
|     s1[0] = 'H';                   |   |     // s2[0] = 'H';                |
|                                    |   |                                    |
|     // ERROR: Array name is fixed  |   |     // VALID: Pointer can move     |
|     // ++s1;                       |   |     ++s2;                          |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**Memory Layout: Array (`char s1[50]`)**

When you declare an array, the compiler allocates a contiguous block of memory (50 bytes in this case) on the stack. It then copies the characters `'h', 'e', 'l', 'l', 'o', '\0'` into that block. The remaining 44 bytes are initialized to zero.

```text
   ╭───────────────────────────────── s1 (Array of 50 chars) ─────────────────────────────────╮
   ╭── [0] ──╮╭── [1] ──╮╭── [2] ──╮╭── [3] ──╮╭── [4] ──╮╭── [5] ──╮      ╭────── [49] ──────╮
   ┌─────────┬──────────┬──────────┬──────────┬──────────┬──────────┬─...──┬──────────────────┐
   │   'h'   │   'e'    │   'l'    │   'l'    │   'o'    │   '\0'   │      │       '\0'       │
   └─────────┴──────────┴──────────┴──────────┴──────────┴──────────┴─...──┴──────────────────┘
      500       501        502        503        504        505                   549

```

**Memory Layout: Pointer (`char *s2`)**

When you declare a character pointer, the string literal `"hello"` is stored in the **Read-Only segment** of memory. The variable `s1` is just a standard pointer allocated on the stack (or registers) that holds the starting address (e.g., 500) of that read-only string.

```text
s1 (Pointer Variable)            String Literal (Read-Only Memory Segment)
    ╭─ s1 ─╮      ╭── [0] ──╮╭── [1] ──╮╭── [2] ──╮╭── [3] ──╮╭── [4] ──╮╭── [5] ──╮
    ┌──────┐ ┆    ┌─────────┬──────────┬──────────┬──────────┬──────────┬──────────┐
    │ 500  │─┼─>  │   'h'   │   'e'    │   'l'    │   'l'    │   'o'    │   '\0'   │
    └──────┘ ┆    └─────────┴──────────┴──────────┴──────────┴──────────┴──────────┘
      900          500       501        502        503        504        505

```

**Key Differences & Pointer Arithmetic**

Both declarations allow you to read data identically:

* `*(s1 + 2)` $\Rightarrow$ `'l'`
* `s1[2]` $\Rightarrow$ `'l'`

However, they behave completely differently when you try to modify the pointer or the data:

```c
#include <stdio.h>

int main() {
    // If constructed element-by-element, YOU must provide the Null!
    char manual_str[] = {'h', 'e', 'l', 'l', 'o', '\0'};
    
    // If constructed with quotes, Compiler provides the Null!
    char auto_str[] = "hello"; // same, char auto_str[] = {"hello"}; 
    
    // Every string evaluates strictly to its base address.
    // 500 + 0 evaluates to 500. This format variable prints "hello".
    printf("%s\n", "hello" + 0); 
    
    return 0;
}
```

```c
char s1[] = "hello"; 
int a = 10;

// --- Passing to a format specifier ---
printf("%s", "hello"); // Output: hello
printf("%s", s1);      // Output: hello

// --- Standard direct printing ---
printf("hello");       // Output: hello

/*
 * In C, both the string literal "hello" and the array name 's1' 
 * decay into a pointer to their first character (address 500).
 * So under the hood, printf is basically receiving:
 */
printf(500);           // Output: hello 

// --- Variable vs Literal evaluation ---
printf("%d", a);       // Output: 10
printf("%d", 10);      // Output: 10

```

**The `printf` Function Signature & Mechanics**

```c
int printf(char *format, ...)

```

* **`char *format`**: The first argument is always a character pointer.
* **`...` (Ellipsis)**: This indicates **Var-args** (Variable Arguments), meaning the function can accept an unknown number of subsequent arguments of varying types.

Essentially, when you call `printf("hello")`, you are passing the base address of that string literal (e.g., `500`) into the `format` pointer. `printf` then loops through that memory address, printing every character it finds until it hits the `\0` (NULL) terminator.

**Memory Layout Diagrams**

Here is how the memory is laid out for the `s1` array, and how the internal `format` pointer inside `printf` points to it.

**The `s1` Array Layout:**

```text
   ╭────────────────────────────── s1 ──────────────────────────────╮
   ╭── [0] ──╮╭── [1] ──╮╭── [2] ──╮╭── [3] ──╮╭── [4] ──╮╭── [5] ──╮
   ┌─────────┬──────────┬──────────┬──────────┬──────────┬──────────┐
   │   'h'   │   'e'    │   'l'    │   'l'    │   'o'    │   '\0'   │
   └─────────┴──────────┴──────────┴──────────┴──────────┴──────────┘
      500       501        502        503        504        505
```

**Inside `printf` Execution:**

When `printf(s1)` is called, the base address `500` is copied into the local `format` pointer variable inside the `printf` function's stack frame.

```text
    printf() Stack Frame
   ╭──────── format ───────╮
   ┌───────────────────────┐
   │          500          │─╮
   └───────────────────────┘ │     Reads data from this address
                             │       until it hits the '\0'
                             ╰─>  ┌───┬───┬───┬───┬───┬────┐
                                  │ h │ e │ l │ l │ o │ \0 │
                                  └───┴───┴───┴───┴───┴────┘
                                   500
```

**Key Summary: String Construction and Memory Architecture**

*   String constants (`"..."`) are evaluated strictly as their base memory addresses.
*   Array strings (`char s[]`) are mutable but their base address cannot be incremented.
*   Pointer strings (`char *s`) can be incremented, but their targeted data is strictly Read-Only.

***

## Printing Strings and Pointer Arithmetic

The `%s` format specifier explicitly requires a character address (`char *`). When provided an address, `%s` relentlessly prints characters one-by-one until it physically encounters a `\0` (Null) character in memory.

Because double quotes evaluate to a base address, you can perform deep pointer arithmetic directly on raw string constants inside a `printf` statement.

```c
#include <stdio.h>

int main() {
    char s1[] = "hello";
/*
   ╭────────────────────────────── s1 ──────────────────────────────╮
   ╭── [0] ──╮╭── [1] ──╮╭── [2] ──╮╭── [3] ──╮╭── [4] ──╮╭── [5] ──╮
   ┌─────────┬──────────┬──────────┬──────────┬──────────┬──────────┐
   │   'h'   │   'e'    │   'l'    │   'l'    │   'o'    │   '\0'   │
   └─────────┴──────────┴──────────┴──────────┴──────────┴──────────┘
      500       501        502        503        504        505
*/

    printf("%s\n", s1); // hello
    printf("%s\n", s1 + 2); // llo
    printf(s1 + 2);  // llo
    
    printf("%s\n", "hello"); // hello 
    printf("%s\n", "hello" + 2); //llo
    printf("hello" + 2); //llo
    printf("hello" + '-' - '-'); // hello
    
    // 2. Dereferencing a String Constant
    // *("hello") is value at 500 -> 'h'
    printf("%c\n", *"hello"); 
    
    // 3. Dereferencing with Offset
    // *("hello" + 2) is value at 502 -> 'l'
    printf("%c\n", *("hello" + 2)); 
    printf("%c\n", "hello"[2]); 
    printf("%c\n", 2["hello"]); 
    printf("%c\n", *(2 + "hello")); 
    
    printf(&2["hello"]); //llo

    
    // 4. Indexing a String Constant
    // "hello" is identical to *("hello" + 2) -> 'l'
    printf("%c\n", "hello"); 
    
    // 5. Address of Index
    // &"hello" evaluates to address 502. %s prints -> "llo"
    printf("%s\n", &"hello"); 
    
    printf("%s", ++"hello"); // C.E: L-value required
    
    return 0;
}
```

### The Format Specifier Trap

There are multiple ways to print a string. However, passing the string array directly as the first argument to `printf` opens a massive vulnerability if the string contains actual format specifier symbols (`%d`, `%c`).

```c
void main() {
    // --- Scenario A: A safe, standard string ---
    char s1_safe[] = "hello";
    
    // 1, 2, and 3 are functionally the same
    printf("%s", s1_safe);    // Output: hello
    printf("%s", "hello");    // Output: hello
    printf("hello");          // Output: hello
    
    // 4. Works, but is conceptually DIFFERENT from 1, 2, and 3
    printf(s1_safe);          // Output: hello 


    // --- Scenario B: A string containing format specifiers ---
    char s1[] = "hello%dabcd%d";
    
    // Safely prints the exact contents of the array
    printf("%s", s1);         // Output: hello%dabcd%d
    
    // DANGEROUS: The string is parsed as the format parameter
    printf(s1);               // Output: helloGVabcdGV  (GV = Garbage Value)
    
    // Works as intended if arguments are provided to match the embedded specifiers
    printf(s1, 10, 20);       // Output: hello10abcd20
}
```

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* DIRECT PRINTING TRAP (BAD) */   |   | /* FORMATTED PRINTING (GOOD) */    |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     char s[] = "User %d login";    |   |     char s[] = "User %d login";    |
|                                    |   |                                    |
|     // %d acts as a specifier!     |   |     // %d is treated as pure text! |
|     // Prints GARBAGE VALUE        |   |     // Safely prints exact string  |
|     printf(s);                     |   |     printf("%s", s);               |
|                                    |   |                                    |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**Key Summary: Printing Strings and Pointer Arithmetic**

*   `%s` requires an address and stops exclusively at `\0`. If `\0` is missing, it will print garbage memory infinitely until a random `\0` is found.
*   String constants can be mathematically offset (e.g., `"hello" + 2`) to substring outputs dynamically.
*   Never use `printf(str)`. Always use `printf("%s", str)` to prevent accidental format specifier evaluation.

***

## Multi-Dimensional Strings

When managing multiple strings (like a list of cities), programmers can utilize a 2-Dimensional Character Array or an Array of Character Pointers. 

In a 2D array, the row size is optional during initialization, but the column size is **mandatory**. If you omit inner curly braces for row boundaries, the compiler simply wraps the string sequentially based strictly on the column size.

**Basic 2D Array Construction**

![2D Array memory layout](c_programming/diagrams/two_d_array.png)

```c
#include <stdio.h>

int main()
{
    // Individual 1D arrays
    char s1[] = "hyderabad";
    char s2[] = "pune";
    char s3[] = "chennai";
    char s4[] = "delhi";
    
    // INVALID: You cannot declare a 2D array of strings without specifying column size
    // char s[][] = {"hyderabad", "pune", "chennai", "delhi"}; // ERROR
    
    // VALID: You must specify the maximum number of columns (characters per string)
    char s[][10] = {"hyderabad", "pune", "chennai", "delhi"};
    
    /*
             [0]  [1]  [2]  [3]  [4]  [5]  [6]  [7]  [8]  [9]
           ╭─────────────────────────────────────────────────╮
     s[0]  │ 'h'│ 'y'│ 'd'│ 'e'│ 'r'│ 'a'│ 'b'│ 'a'│ 'd'│'\0'│  (Addresses: 500 - 509)
           ├────┼────┼────┼────┼────┼────┼────┼────┼────┼────┤
     s[1]  │ 'p'│ 'u'│ 'n'│ 'e'│'\0'│'\0'│'\0'│'\0'│'\0'│'\0'│  (Addresses: 510 - 519)
           ├────┼────┼────┼────┼────┼────┼────┼────┼────┼────┤
     s[2]  │ 'c'│ 'h'│ 'e'│ 'n'│ 'n'│ 'a'│ 'i'│'\0'│'\0'│'\0'│  (Addresses: 520 - 529)
           ├────┼────┼────┼────┼────┼────┼────┼────┼────┼────┤
     s[3]  │ 'd'│ 'e'│ 'l'│ 'h'│ 'i'│'\0'│'\0'│'\0'│'\0'│'\0'│  (Addresses: 530 - 539)
           ╰─────────────────────────────────────────────────╯
    */
    
    /* --- Array size and address debug --- */

    printf("Array s base address                        : %p\n", &s);
    printf("Array s size in bytes                       : %d 0x%x\n", sizeof(s), sizeof(s));
    printf("Array s base address + (1 * size of Array s): %p\n", &s + 1);
    printf("Array s base address + (2 * size of Array s): %p\n", &s + 2);
    printf("Array s base address + (3 * size of Array s): %p\n", &s + 3);
    printf("\n");

    /* --- Pointers to Base address of 1D array in 2D Array --- */
    // s + i
    // Points to the base address of ith Array

    printf("%p %s\n", s + 0, s);
    printf("%p %s\n", s + 1, s + 1);
    printf("%p %s\n", s + 2, s + 2);
    printf("%p %s\n", s + 3, s + 3);
    printf("\n");

    /* --- Pointers to address of each element in 1D array --- */
    // *(s + i) + j = s[i] + j
    // Points to the address of jth element of ith Array

    /*                       0th 1D array                  */
    // 0th element
    printf("%s\n", *(s + 0) + 0);
    printf("%s\n", *(s + 0));
    printf("%s\n", *s);
    printf("%s\n", s[0]);
    printf("%s\n", s[0] + 0);
    printf("\n");

    // 1st element
    printf("%s\n", *(s + 0) + 1);
    printf("%s\n", *s + 1);
    printf("%s\n", s[0] + 1);
    printf("\n");
    
    // 2nd element
    printf("%s\n", *(s + 0) + 2);
    printf("%s\n", *s + 2);
    printf("%s\n", s[0] + 2);
    printf("\n");

    /*                       1st 1D array                  */
    // 0th element
    printf("%s\n", *(s + 1) + 0);
    printf("%s\n", *(s + 1));
    printf("%s\n", s[1]);
    printf("%s\n", s[1] + 0);
    printf("\n");

    // 1st element
    printf("%s\n", *(s + 1) + 1);
    printf("%s\n", s[1] + 1);
    printf("\n");
    
    // 2nd element
    printf("%s\n", *(s + 1) + 2);
    printf("%s\n", s[1] + 2);
    printf("\n");

    /*                       2nd 1D array                  */
    // 0th element
    printf("%s\n", *(s + 2) + 0);
    printf("%s\n", *(s + 2));
    printf("%s\n", s[2]);
    printf("%s\n", s[1] + 0);
    printf("\n");

    // 1st element
    printf("%s\n", *(s + 2) + 1);
    printf("%s\n", s[2] + 1);
    printf("\n");
    
    // 2nd element
    printf("%s\n", *(s + 2) + 2);
    printf("%s\n", s[2] + 2);
    printf("\n");

    /* --- Value at address of each element in 1D array --- */
    // *(*(s + i) + j) = *(s[i] + j) = s[i][j]
    // Points to the address of jth element of ith Array

    /*                       0th 1D array                  */
    // 0th element
    printf("%c\n", *(*(s + 0) + 0 ));
    printf("%c\n", **(s + 0));
    printf("%c\n", **s);
    printf("%c\n", *(s[0] + 0 ));
    printf("%c\n", s[0][0]);
    printf("\n");

    // 1st element
    printf("%c\n", *(*(s + 0) + 1 ));
    printf("%c\n", *(s[0] + 1 ));
    printf("%c\n", s[0][1]);
    printf("\n");

    /*                       1st 1D array                  */
    // 0th element
    printf("%c\n", *(*(s + 1) + 0 ));
    printf("%c\n", **(s + 1));
    printf("%c\n", *(s[1] + 0 ));
    printf("%c\n", s[1][0]);
    printf("\n");

    // 1st element
    printf("%c\n", *(*(s + 1) + 1 ));
    printf("%c\n", *(s[1] + 1 ));
    printf("%c\n", s[1][1]);
    printf("\n");

    /* --- More Examples --- */
    printf("%s %s\n", *(s+2), s[2]); // chennai chennai
    printf("%s %s\n", *(s+2)+2, s[2]+2); // ennai ennai
    printf("%c\n", *(*(s+2)+2)); // e
    printf("%s %s\n", *(s+3)+2, s[3]+2); // lhi lhi
    printf("%c %c\n", *(*(s+1)+2)+3, s[1][3] + 3); // q h
    printf("%c\n", **(s+3)); // d
    printf("%s\n", *(s+3)); // delhi
    printf("%s\n", *s+2); // derabad


    return 0;
}
```

### Initialization of 2D Array for string

```c
// Option 1
char s[][10] = { "hyderabad", "pune", "chennai", "delhi" };

// Option 2
char s[][10] = { {"hyderabad"}, {"pune"}, {"chennai"}, {"delhi"} };

// Option 3:
char s[][10] = {
    { 'h', 'y', 'd', 'e', 'r', 'a', 'b', 'a', 'd', '\0' },
    { 'p', 'u', 'n', 'e', '\0' },
    { 'c', 'h', 'e', 'n', 'n', 'a', 'i', '\0' },
    { 'd', 'e', 'l', 'h', 'i', '\0' }
};

// Option 4
char s[][10] = { 
    'h', 'y', 'd', 'e', 'r', 'a', 'b', 'a', 'd', '\0', 
    'p', 'u', 'n', 'e', '\0', 
    'c', 'h', 'e', 'n', 'n', 'a', 'i', '\0', 
    'd', 'e', 'l', 'h', 'i', '\0' 

/*
Memory layout of option 1, 2, 3

        [0] [1] [2] [3] [4] [5] [6] [7] [8] [9]
       ╭───────────────────────────────────────╮
 s[0]  │ h │ y │ d │ e │ r │ a │ b │ a │ d │\0 │ 
       ├───┼───┼───┼───┼───┼───┼───┼───┼───┼───┤
 s[1]  │ p │ u │ n │ e │\0 │\0 │\0 │\0 │\0 │\0 │ 
       ├───┼───┼───┼───┼───┼───┼───┼───┼───┼───┤
 s[2]  │ c │ h │ e │ n │ n │ a │ i │\0 │\0 │\0 │ 
       ├───┼───┼───┼───┼───┼───┼───┼───┼───┼───┤
 s[3]  │ d │ e │ l │ h │ i │\0 │\0 │\0 │\0 │\0 │ 
       ╰───────────────────────────────────────╯

Memory layout of option 4

        [0] [1] [2] [3] [4] [5] [6] [7] [8] [9]
       ╭───────────────────────────────────────╮
 s[0]  │ h │ y │ d │ e │ r │ a │ b │ a │ d │\0 │ (Perfect fit: 10 chars)
       ├───┼───┼───┼───┼───┼───┼───┼───┼───┼───┤
 s[1]  │ p │ u │ n │ e │\0 │ c │ h │ e │ n │ n │ (Pulled from "chennai"!)
       ├───┼───┼───┼───┼───┼───┼───┼───┼───┼───┤
 s[2]  │ a │ i │\0 │ d │ e │ l │ h │ i │\0 │\0 │ (The rest flows here)
       ╰───────────────────────────────────────╯
*/
};
```

### Array of pointers

```c
// Individual pointers to read-only string literals
char *s1 = "apple";
char *s2 = "mango";
char *s3 = "orange";

// Grouping them into an Array of Pointers
char *s[] = {"apple", "mango", "orange"};

/*
       ╭────────────────────── s (Array of char*) ────────────────╮
       ╭────── s[0] ──────╮╭────── s[1] ──────╮╭────── s[2] ──────╮
       ┌──────────────────┬───────────────────┬───────────────────┐
       │       500        │        600        │        700        │
       └──────────────────┴───────────────────┴───────────────────┘
        │     100                  102     │           104       │
        │                                  │                     │   
        V                                  │                     │    
        ╭──────── "apple"\0 ────────╮      │                     │    
        │  a  |  p  |  p  |  l  | e │      │                     │   
        └───────────────────────────┘      │                     │       
        500                                V                     │          
                            ╭──────── "mango"\0 ────────╮        │        
                            │  m  |  a  |  n  |  g  | o │        │        
                            └───────────────────────────┘        │          
                            600                                  V            
                                            ╭─────── "orange"\0 ────────╮ 
                                            │  o  |  r  |  a  |  n  | g │
                                            └───────────────────────────┘
                                            700
*/
```

**Key Summary: Multi-Dimensional Strings**

*   `char s` allocates fixed 40 bytes.
*   `char *s` allocates an array of pointers, referencing varying-length RO strings, saving memory space.
*   In 2D arrays, providing `*(*(s+1)+2)` extracts a single character using pure pointer indirection.

***

## String Input and Stream Flushing

Whenever data is typed on a keyboard, it does not immediately enter the program's variables. It is first stored in a hardware buffer called a **Stream** (specifically `stdin`). Functions like `scanf` continuously fetch from this stream.

### The Multi-Word Trap and get/fgets

The standard `scanf("%s")` is strictly incapable of reading multi-word strings. As soon as it encounters a Space, Tab, or Enter key, it injects a `\0` and stops scanning. 
To read multi-word strings with spaces, older C relied on `gets()`. However, `gets()` possesses no boundary checking, allowing buffer overflows that crash the application. The modern, secure industry standard is `fgets()`.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* gets() BUFFER OVERFLOW (BAD) */ |   | /* fgets() SECURE BOUNDS (GOOD) */ |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     char s;                        |   |     char s;                        |
|                                    |   |                                    |
|     // If user types "HelloWorld"  |   |     // Stops securely at 4 chars.  |
|     // Memory is breached! CRASH!  |   |     // Reserves 1 for Null!        |
|     gets(s);                       |   |     fgets(s, sizeof(s), stdin);    |
|                                    |   |                                    |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

### Regular Expressions in scanf

You can forcibly instruct `scanf` to accept multi-word strings or specific character ranges using Regular Expressions (`%[]`).

```c
#include <stdio.h>

int main() {
    char s;
    
    // 1. Scan everything until a Newline (Enter) is pressed.
    // This allows spaces! (Acts like gets)
    // scanf("%[^\n]", s); 
    
    // 2. Scan until the character 'A' is found.
    // scanf("%[^A]", s); 
    
    // 3. Scan ONLY uppercase letters. Stops at first non-uppercase.
    // scanf("%[A-Z]", s); 
    
    // 4. Scan until ANY vowel is encountered.
    // scanf("%[^AEIOUaeiou]", s);
    
    return 0;
}
```

### Stream Flushing 

If a stray 'Enter' key (`\n`) is left in the `stdin` stream from a previous input, the next `scanf` or `fgets` will absorb it and terminate instantly without waiting for user input. You must flush the input stream to clear it.

*   **Windows/Turbo C:** `fflush(stdin);` or `flushall();`
*   **Linux/GCC:** `fflush(stdin)` is technically undefined behavior for input streams by ANSI standards. Linux environments use `__fpurge(stdin);` from `<stdio_ext.h>`.

**Key Summary: String Input and Stream Flushing**

*   `scanf` terminates string collection at the first space.
*   `gets()` reads spaces but causes fatal buffer overflows. `fgets()` securely limits the input length.
*   The `stdin` buffer must be flushed if stray characters bypass scanning logic.

***

## The string.h Library and Core Functions

Standard operators fail completely when applied to strings. 
*   `s2 = s1` (Assignment fails: Arrays are constant pointers).
*   `s1 == s2` (Equality fails: Compares two memory addresses, not the text).
*   `s1 + s2` (Addition fails: Cannot mathematically add two addresses).

To manipulate strings, C provides the `<string.h>` library.

### Custom strlen and strcpy

`strlen` returns the length of the string, explicitly excluding the `\0`.
`strcpy(target, source)` copies data from the source to the target until `\0` is reached.

```c
#include <stdio.h>

// Custom String Length
int custom_strlen(char *s) {
    int count = 0;
    while (*s != '\0') {
        count++;
        s++;
    }
    return count;
}

// Custom String Copy (Highly optimized single-line logic)
char* custom_strcpy(char *target, char *source) {
    char *temp = target; // Save base address for return
    
    // Post-increments fetch the character, assign it to target,
    // and instantly evaluate it. When '\0' is assigned, while(0) is False!
    while (*target++ = *source++); 
    
    return temp;
}

int main() {
    char dest;
    custom_strcpy(dest, "Hello");
    printf("Len: %d, Str: %s\n", custom_strlen(dest), dest);
    return 0;
}
```

### Custom strcat and strcmp

`strcat(target, source)` appends the source to the end of the target.
`strcmp(s1, s2)` compares character-by-character and returns the ASCII difference. 
*   `0`: Strings are equal.
*   `< 0`: s1 comes *before* s2 in the dictionary.
*   `> 0`: s1 comes *after* s2 in the dictionary.

```c
#include <stdio.h>

// Custom String Concatenation
char* custom_strcat(char *target, char *source) {
    char *temp = target;
    
    // 1. Move target pointer to its own Null character
    while (*target) {
        target++;
    }
    
    // 2. Copy source directly over target's Null character
    while (*target++ = *source++);
    
    return temp;
}

// Custom String Compare
int custom_strcmp(char *s1, char *s2) {
    // Loop while characters match AND we haven't hit Null
    while (*s1 == *s2 && *s1 != '\0') {
        s1++;
        s2++;
    }
    // Return the ASCII difference of the first mismatch
    return (*s1 - *s2);
}

int main() {
    char s1 = "Apple";
    custom_strcat(s1, "Pie");
    printf("Cat: %s, Cmp: %d\n", s1, custom_strcmp("Apple", "Banana"));
    return 0;
}
```

**Key Summary: The string.h Library and Core Functions**
*   Because operators process addresses, we must use `string.h` functions to process the actual text content.
*   `strcpy` and `strcat` lack boundary checking; using `strncpy` and `strncat` is safer.
*   `strcmp` returns integers specifically designed to help sort strings alphabetically.

***

## Advanced Functions and Recursion

### String Reversal and Palindromes

`strrev(str)` reverses a string in-place. Because it modifies the original array, checking if a string is a Palindrome requires either copying the string to a temporary buffer first, or manually comparing the ends utilizing a two-pointer approach.

```c
#include <stdio.h>

// Palindrome check without mutating the original string
int is_palindrome(char *str) {
    int len = 0;
    while (str[len] != '\0') len++; // Get length
    
    int start = 0;
    int end = len - 1;
    
    while (start < end) {
        if (str[start] != str[end]) {
            return 0; // 0 means Not a Palindrome
        }
        start++;
        end--;
    }
    return 1; // 1 means Palindrome
}

int main() {
    printf("Is 'racecar' palindrome? %d\n", is_palindrome("racecar"));
    return 0;
}
```

### String Tokenization (strtok)

`strtok(string, delimiter)` splits a string (like a CSV file) into isolated tokens. It works by maliciously replacing the discovered delimiter inside your original string with a `\0` character. 
To retrieve subsequent tokens from the *same* string, you must strictly pass `NULL` as the first argument in the following calls.

```c
#include <stdio.h>
#include <string.h>

int main() {
    char data[] = "Name,Age,Salary";
    
    // First call requires the string base address
    char *token = strtok(data, ",");
    
    while (token != NULL) {
        printf("Token: %s\n", token);
        
        // Subsequent calls REQUIRE NULL to resume from the last saved \0
        token = strtok(NULL, ","); 
    }
    return 0;
}
```

### Complex String Recursion

Strings can be traversed recursively without loops by utilizing pointer offsets.

```c
#include <stdio.h>

void test(char *s1) {
    // 1. Print current string
    printf("%s\n", s1); 
    
    // 2. Base Condition: If value at pointer is NOT null
    if (*s1) {
        // Recursive Call: Pass the address of the NEXT character
        test(s1 + 1); 
    }
    
    // 3. This prints during the recursive "unwinding" phase
    printf("%s\n", s1); 
}

int main() {
    char str[] = "HAI";
    test(str);
    /* Output Trace:
       HAI
       AI
       I
       (Empty Null Print)
       (Empty Null Print)
       I
       AI
       HAI
    */
    return 0;
}
```

**Key Summary: Advanced Functions and Recursion**

*   Checking a palindrome requires length calculation and a two-pointer intersection logic.
*   `strtok` mutates the original string by replacing delimiters with `\0`.
*   Passing `NULL` to `strtok` tells the internal static pointer to resume searching from the last injected `\0`.
