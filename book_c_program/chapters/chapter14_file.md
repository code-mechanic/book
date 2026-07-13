# File Handling in C

Standard C programs execute in memory, and any output directed to the console is permanently lost the moment the program or console window is closed. To save the results of an application persistently—such as creating diagnostic log files, saving user progress, or tracking network statuses—programmers must redirect data to the hard disk. This concept is called File Handling. Files in C are broadly categorized into two types: Text files (like `.txt` documents) and Binary files (like images, audio, and raw structure blocks). 

*   [File Streams and Opening Files](#file-streams-and-opening-files)
*   [Writing and Appending Data](#writing-and-appending-data)
*   [Reading Data and EOF](#reading-data-and-eof)
*   [Binary Mode: Arrays and Structures](#binary-mode-arrays-and-structures)
*   [Updating and Cursor Movement](#updating-and-cursor-movement)
*   [Finding File Size Using ftell](#finding-file-size-using-ftell)
*   [Summary of File Operation APIs](#summary-of-file-operation-apis)

***

## File Streams and Opening Files

When you use `printf`, C communicates to the console using a predefined output stream called `stdout`. To communicate with a file on the hard disk, the programmer must manually create a new stream using the `fopen()` function. 

`fopen` requires two arguments: the file path (using double backslashes `\\` to escape directory characters) and the desired mode (e.g., `"w"` for write, `"r"` for read). 

If the file opens successfully, `fopen` returns a `FILE *` pointer (a predefined structure from `<stdio.h>`). If the file fails to open—due to invalid naming, missing drives, or restricted folder permissions—the function strictly returns `NULL`.

```c
#include <stdio.h>

int main() {
    // Creating a file pointer and opening the stream
    // Double backslash is required for Windows directory paths!
    FILE *fp = fopen("D:\\abc.txt", "w"); 
    
    // Mandatory NULL check to prevent fatal crashes
    if (fp == NULL) {
        printf("Error: File could not be created or opened.\n");
        return 1; 
    }
    
    printf("File opened successfully!\n");
    
    // Always close the stream to release the memory lock
    fclose(fp); 
    
    return 0;
}
```

**Key Summary: File Streams and Opening Files**

*   Files require a custom communication stream managed by a `FILE *` pointer.
*   Failing to check for a `NULL` pointer before writing data will crash the application.
*   `fclose(fp)` strictly terminates the stream and safely locks the file data on the disk.

***

## Writing and Appending Data

To write basic text data to a file, C uses `fprintf()`. It operates identically to `printf`, but requires the target `FILE *` pointer as its very first argument. 

The behavior of `fprintf` is entirely dictated by the mode chosen in `fopen`:

*   **Write Mode (`"w"`):** If the file does not exist, it creates a new one. If the file *already* exists, it permanently deletes the old data and overwrites it from the beginning.
*   **Append Mode (`"a"`):** If the file does not exist, it creates a new one. If the file exists, it safely protects the old data and attaches the new data strictly to the end of the file.

+------------------------------------+---+------------------------------------+
| ```c                               |   | ```c                               |
| /* WRITE MODE (OVERWRITES) */      |   | /* APPEND MODE (ADDS TO END) */    |
| #include <stdio.h>                 |   | #include <stdio.h>                 |
|                                    |   |                                    |
| int main() {                       |   | int main() {                       |
|     FILE *fp = fopen("abc.txt","w");|  |     FILE *fp = fopen("abc.txt","a");|
|     if (fp != NULL) {              |   |     if (fp != NULL) {              |
|         // Erases all old data!    |   |         // Preserves old data!     |
|         fprintf(fp, "New %d", 10); |   |         fprintf(fp, "More %d", 20);|
|         fclose(fp);                |   |         fclose(fp);                |
|     }                              |   |     }                              |
|     return 0;                      |   |     return 0;                      |
| }                                  |   | }                                  |
| ```                                |   | ```                                |
+------------------------------------+---+------------------------------------+

**The Console Redirect Trick:** If you pass the predefined `stdout` stream into `fprintf` instead of a custom file pointer, the function will simply print the data to the console, entirely bypassing the need for `printf`.

***

## Reading Data and EOF

To read data from a file, we open it in Read Mode (`"r"`). The `fgetc(fp)` function isolates the character exactly where the cursor is currently blinking, returns that character, and automatically moves the cursor forward one step to the next character.

Because we never know exactly how large a file is, we place `fgetc` inside an infinite loop. When the cursor reaches the absolute end of the file, `fgetc` evaluates to the `EOF` (End of File) macro, which is internally represented as `-1`.

```c
#include <stdio.h>

int main() {
    FILE *fp = fopen("D:\\abc.txt", "r");
    if (fp == NULL) return 1;
    
    char ch;
    int lines = 0;
    int chars = 0;
    
    // Infinite loop breaks when EOF (-1) is encountered
    while (1) {
        ch = fgetc(fp); 
        
        if (ch == EOF) {
            break; 
        }
        
        chars++; // Count every valid character
        
        // If the character is a newline, increment the line counter
        if (ch == '\n') {
            lines++; 
        }
    }
    
    printf("Characters: %d, Lines: %d\n", chars, lines);
    fclose(fp);
    return 0;
}
```

By adding standard relational conditions inside this loop (e.g., `ch >= 'a' && ch <= 'z'`), programmers can dynamically count lower-case letters, digits, or spaces on the fly.

**Key Summary: Reading Data and EOF**

*   `fgetc` automatically advances the internal file cursor after every read.
*   `EOF` is a macro from `<stdio.h>` representing `-1`. It strictly indicates the termination boundary of the file stream.

***

## Binary Mode: Arrays and Structures

While `fprintf` is excellent for strings and single integers, it becomes a nightmare for complex data types. If an Employee structure contains 100 parameters, writing `fprintf` with 100 `%d` and `%s` specifiers is terrible programming practice. 

```c
// BAD PROGRAMMING PRACTICE
                                
#include <stdio.h>                   
                
struct emp {
    int id;
    char name[20];
    float salary;
}

int main() {                         
    FILE *fp = fopen("arr.txt","wb");
    int arr[4] = {10, 20, 30, 40};
    struct emp emp_dict[4] = {
        {1, "abc", 3000},
        {2, "def", 4000},
        {3, "ghi", 5000}
    }
                                     
    if (fp != NULL) {                
        for (int i = 0; i < 4; i++) {
            fprintf(fp, "%d ", arr[i]);
            fprintf(fp, "%d %s %f\n", emp_dict[i].id, emp_dict[i].name, emp_dict[i].salary);

        }                               
        fclose(fp);                  
    }                                
    return 0;                        
}                                    
```                                  

To write entire arrays or structures seamlessly, C provides `fwrite()` and `fread()`. Because these functions operate on raw memory blocks rather than text strings, you should strictly append a `b` to the file mode (`"wb"` for Write Binary, `"rb"` for Read Binary). 

These functions take exactly four arguments:

1.  **Source/Target Address:** Where the data is stored in RAM (`&emp`).
2.  **Item Size:** The byte size of a single element (`sizeof(struct emp)`).
3.  **Number of Items:** How many elements to copy (`1` for a single struct, or `n` for an array).
4.  **File Pointer:** The destination stream (`fp`).

+--------------------------------------+---+--------------------------------------+
| ```c                                 |   | ```c                                 |
| /* BINARY WRITE (fwrite) */          |   | /* BINARY READ (fread) */            |
| #include <stdio.h>                   |   | #include <stdio.h>                   |
|                                      |   |                                      |
| int main() {                         |   | int main() {                         |
|     FILE *fp = fopen("arr.txt","wb");|   |     FILE *fp = fopen("arr.txt","rb");|
|     int arr[] = {10, 20, 30, 40};    |   |     int arr[4];                      |
|                                      |   |                                      |
|     if (fp != NULL) {                |   |     if (fp != NULL) {                |
|         // Writes all 4 integers     |   |         // Reads block into array    |
|         // in a single statement!    |   |         fread(arr, sizeof(int),      |
|         fwrite(arr, sizeof(int),     |   |               4, fp);                |
|                4, fp);               |   |                                      |
|         fclose(fp);                  |   |         printf("%d", arr[1]); // 20  | 
|     }                                |   |         fclose(fp);                  |
|     return 0;                        |   |     }                                |
| }                                    |   | }                                    |
| ```                                  |   | ```                                  |
+--------------------------------------+---+--------------------------------------+

**Key Summary: Binary Mode: Arrays and Structures**

*   `fwrite` and `fread` move raw memory blocks directly into files, ignoring formatting completely.
*   Binary files are generally more compact than text files because data isn't converted into string representations.

***

## Updating and Cursor Movement

Standard modes strictly limit operations. `w` can only write, and `r` can only read. To perform both simultaneously, programmers use **Update Modes** by appending a `+` symbol (`"r+"`, `"w+"`, `"a+"`). 

To modify a specific character securely, you must navigate the internal cursor directly to that byte index using the `fseek()` function. 

`fseek(file_pointer, offset, position_macro)` accepts three positional macros:

*   `SEEK_SET` (0): Starts navigating strictly from the beginning of the file.
*   `SEEK_CUR` (1): Navigates relative to the cursor's current location.
*   `SEEK_END` (2): Navigates relative to the absolute end of the file.

### Visual Cursor Movement Diagram

```text
File Content:   A   B   C   D   E   F   G   H   I   EOF
Set Index:      0   1   2   3   4   5   6   7   8   9

[ SCENARIO 1: SEEK_SET ]
fseek(fp, 3, SEEK_SET);
--> Navigates strictly to index 3. Cursor blinks at 'D'.

[ SCENARIO 2: SEEK_CUR (Negative Offset) ]
Assume cursor is currently at 'D' (Index 3).
fseek(fp, -2, SEEK_CUR);
--> Moves 2 steps backward. Cursor blinks at 'B' (Index 1).

[ SCENARIO 3: SEEK_END (Negative Offset) ]
fseek(fp, -2, SEEK_END);
--> Starts from the very end (Index 9), moves 2 steps backward.
--> Cursor blinks at 'H' (Index 7).
```

```c
#include <stdio.h>

int main() {
    // "r+" means Read and Update (Modify)
    FILE *fp = fopen("D:\\abc.txt", "r+");
    if (fp == NULL) return 1;
    
    // Move from START to 3rd character (Index 3 = 'D')
    fseek(fp, 3, SEEK_SET); 
    
    // Replaces 'D' with 'X'
    fprintf(fp, "%c", 'X'); 
    
    // Ensure cursor goes back to absolute start before reading again!
    fseek(fp, 0, SEEK_SET); 
    
    char ch = fgetc(fp); // Reads 'A'
    printf("First char: %c\n", ch);
    
    fclose(fp);
    return 0;
}
```

**Key Summary: Updating and Cursor Movement**

*   `fseek` offsets are zero-based when calculating from `SEEK_SET`.
*   You can traverse backward through the file by supplying a negative offset (e.g., `-2`).
*   Executing `fseek(fp, 0, SEEK_SET)` is the fastest way to "rewind" a file to the absolute beginning.

***

## Finding File Size Using *ftell*

While `fseek` moves the cursor, the `ftell(fp)` function strictly answers the question: *"At exactly what index is the cursor currently blinking?"*. It returns a `long int` representing the exact byte offset from the start of the file.

An elite industry trick to find the absolute total byte size of a file dynamically is to combine `fseek` and `ftell`:

1.  Forcibly thrust the cursor to the absolute end of the file using `fseek`.
2.  Ask `ftell` for the current cursor location. Since it's at the very end, the offset is mathematically identical to the total number of bytes in the file!

```c
#include <stdio.h>

int main() {
    FILE *fp = fopen("D:\\abc.txt", "r");
    if (fp == NULL) return 1;
    
    // 1. Move cursor 0 steps from the absolute END
    fseek(fp, 0, SEEK_END); 
    
    // 2. Extract the current position of the cursor
    long int size = ftell(fp); 
    
    // Since each char is 1 byte, this is the total file size!
    printf("Total File Size: %ld bytes\n", size); 
    
    fclose(fp);
    return 0;
}
```

**Key Summary: Finding File Size Using ftell**

*   `ftell` returns the current zero-based index of the cursor in memory.
*   Combining `fseek` to the `SEEK_END` and reading `ftell` instantly bypasses the need for costly character-by-character while loops.

Here is a new section summarizing the standard file operation functions based on the provided text, formatted for your reference document:

## Summary of File Operation APIs

**`fopen`**

*   **Description:** Creates a new communication stream to a file on the hard disk.
*   **Arguments:**
    *   `filepath` (Input): The path to the file, using double backslashes (`\\`) to escape directory characters.
    *   `mode` (Input): The desired operation mode, such as `"w"` (write), `"r"` (read), `"a"` (append), or `"wb"`/`"rb"` (binary modes).
*   **Return Value:** Returns a `FILE *` pointer on success, or strictly `NULL` if the file fails to open.

**`fclose`**

*   **Description:** Safely locks the file data on the disk and terminates the stream.
*   **Arguments:**
    *   `fp` (Input): The `FILE *` pointer of the stream to be closed.
*   **Return Value:** Not explicitly stated in the sources, but functionally terminates the stream.

**`fprintf`**

*   **Description:** Writes formatted text data to a file.
*   **Arguments:**
    *   `fp` (Input): The target `FILE *` pointer. (If `stdout` is passed instead, it prints to the console).
    *   `format` and variables (Input): The string and format specifiers (like `%d`) to write to the file.
*   **Return Value:** Not explicitly detailed in the text.

**`fgetc`**

*   **Description:** Reads a single character from the file at the current cursor location and automatically advances the cursor.
*   **Arguments:**
    *   `fp` (Input): The `FILE *` pointer of the stream being read.
*   **Return Value:** Returns the character read (Output), or the `EOF` macro (End of File, internally represented as `-1`) when the end of the file is reached.

**`fwrite`**

*   **Description:** Writes entire arrays or structures seamlessly as raw memory blocks into a binary file.
*   **Arguments:**
    *   `address` (Input): The source address in RAM where the data is stored (e.g., `&emp` or an array name).
    *   `item_size` (Input): The byte size of a single element (e.g., `sizeof(int)`).
    *   `item_count` (Input): The number of elements to copy.
    *   `fp` (Input): The destination `FILE *` pointer.
*   **Return Value:** Not explicitly detailed in the text.

**`fread`**

*   **Description:** Reads raw memory blocks directly from a binary file into a variable or array.
*   **Arguments:**
    *   `address` (Output): The target address in RAM where the data will be stored.
    *   `item_size` (Input): The byte size of a single element being read.
    *   `item_count` (Input): The number of elements to read.
    *   `fp` (Input): The source `FILE *` pointer.
*   **Return Value:** Not explicitly detailed in the text.

**`fseek`**

*   **Description:** Securley navigates the internal cursor directly to a specific byte index inside the file.
*   **Arguments:**
    *   `fp` (Input): The `FILE *` pointer being manipulated.
    *   `offset` (Input): The number of bytes to move, which can be negative to traverse backward.
    *   `position_macro` (Input): The reference point for the movement. Must be `SEEK_SET` (start of file), `SEEK_CUR` (current cursor location), or `SEEK_END` (end of file).
*   **Return Value:** Not explicitly detailed in the text.

**`ftell`**

*   **Description:** Determines the exact byte offset where the internal cursor is currently located.
*   **Arguments:**
    *   `fp` (Input): The `FILE *` pointer being checked.
*   **Return Value:** Returns a `long int` representing the exact zero-based byte offset from the start of the file (Output).
