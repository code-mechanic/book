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
|     s1 = 'H';                   |   |     // s2 = 'H';                |
|                                    |   |                                    |
|     // ERROR: Array name is fixed  |   |     // VALID: Pointer can move     |
|     // ++s1;                       |   |     ++s2;                          |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

```c
#include <stdio.h>

int main() {
    // If constructed element-by-element, YOU must provide the Null!
    char manual_str[] = {'h', 'e', 'l', 'l', 'o', '\0'};
    
    // If constructed with quotes, Compiler provides the Null!
    char auto_str[] = "hello"; 
    
    // Every string evaluates strictly to its base address.
    // 500 + 0 evaluates to 500. This format variable prints "hello".
    printf("%s\n", "hello" + 0); 
    
    return 0;
}
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
    
    // Standard Print
    printf("%s\n", s1); 
    
    // 1. Pointer Arithmetic on String Constant
    // "hello" is address 500. 500 + 2 = 502. 
    // %s prints from 502 to null -> "llo"
    printf("%s\n", "hello" + 2); 
    
    // 2. Dereferencing a String Constant
    // *("hello") is value at 500 -> 'h'
    printf("%c\n", *"hello"); 
    
    // 3. Dereferencing with Offset
    // *("hello" + 2) is value at 502 -> 'l'
    printf("%c\n", *("hello" + 2)); 
    
    // 4. Indexing a String Constant
    // "hello" is identical to *("hello" + 2) -> 'l'
    printf("%c\n", "hello"); 
    
    // 5. Address of Index
    // &"hello" evaluates to address 502. %s prints -> "llo"
    printf("%s\n", &"hello"); 
    
    return 0;
}
```

### The Format Specifier Trap

There are multiple ways to print a string. However, passing the string array directly as the first argument to `printf` opens a massive vulnerability if the string contains actual format specifier symbols (`%d`, `%c`).

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

```c
#include <stdio.h>

int main() {
    // Standard 2D String Array
    char cities = {"Pune", "Delhi", "Chennai", "Hyderabad"};
    
    // Array of Pointers (Ragged Array - Saves memory!)
    char *ptrs[] = {"Pune", "Delhi", "Chennai", "Hyderabad"};
    
    // ODD ONE OUT TRAP: No row boundaries provided!
    // Every 10 characters constitutes exactly one row.
    char odd_array[] = {
        'H','Y','D','E','R','A','B','A','D','\0',
        'P','U','N','E','\0','C','H','E','N','N' 
        // Notice 'Chennai' bleeds across the boundary!
    };
    
    // Accessing via Pointers
    // cities is base address. cities+2 targets the "Chennai" row.
    printf("City: %s\n", *(cities + 2)); 
    
    return 0;
}
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
|     char s;                     |   |     char s;                     |
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
