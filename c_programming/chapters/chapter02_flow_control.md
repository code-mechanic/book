# Flow Control

The order in which statements are executed in a C program is called flow control. Generally, execution flows sequentially from top to bottom. However, we often need to execute a specific piece of code based on a condition, skip statements, or repeat a block of code multiple times. Flow control provides the structural mechanisms—conditional constructs, loops, and unconditional jumps—to manipulate this execution order.

*   [if Conditional Construct](#if-conditional-construct)
*   [if-else Conditional Construct](#if-else-conditional-construct)
*   [conditional Operator](#conditional-operator)
*   [while loop](#while-loop)
*   [Nested while Loops](#nested-while-loops)
*   [For loop](#for-loop)
*   [do while Loop](#do-while-loop)
*   [Break](#break)
*   [Continue](#continue)
*   [goto](#goto)
*   [Switch](#switch)
*   [Summary of Flow Control](#summary-of-flow-control)

***

## if Conditional Construct

Whenever we want to do some extra or specific job based on a condition, we use the `if` conditional construct. For example, going to college is a sequential task, but carrying an umbrella is an extra job done *only* if it is raining. 

### The if Syntax and Flow

The flow always comes from the top to the bottom. If the condition evaluates to true, the compiler enters the `if` body and executes it. If the condition is false, the compiler skips the `if` body entirely and proceeds with the remaining statements. 

In C programming, any non-zero value is considered True, and zero is strictly considered False.

**Syntax**

```c
// (1)

if( condition ) {
    // (2) if body;
}

// (3)
```

- If condition is `True` then (1), (2) and (3) will execute.  
- If condition is `False` then (1) and (3) will execute.

+--------------------------+---+--------------------------+
| ```c                     |   | ```c                     |
|                          |   |                          |
|     void main()          |   |     void main()          |
|     {                    |   |     {                    |
|         printf("A");     |   |         printf("A");     |
|         printf("B");     |   |         printf("B");     |
|                          |   |                          |
|         if(3 > 2) {      |   |         if(3 > 20) {     |
|             printf("C"); |   |             printf("C"); |
|             printf("D"); |   |             printf("D"); |
|         }                |   |         }                |
|                          |   |                          |
|         printf("E");     |   |         printf("E");     |
|         printf("F");     |   |         printf("F");     |
|     }                    |   |     }                    |
|                          |   |                          |
|     // Output            |   |     // Output            |
|     // ABCDEF            |   |     // ABEF              |
| ```                      |   | ```                      |
+--------------------------+---+--------------------------+

### Dummy Statements and Missing Brackets

If the programmer does not provide curly braces `{}` for the `if` body, the compiler will automatically consider the code up to the first semicolon (`;`) as the `if` body. 

+------------------+---+------------------+
| ```c             |   | ```c             |
| void main()      |   | void main()      |
| {                |   | {                |
|     printf("A"); |   |     printf("A"); |
|     printf("B"); |   |     printf("B"); |
|     if(3 > 2)    |   |     if(3 > 20)   |
|     printf("C"); |   |     printf("C"); |
|     printf("D"); |   |     printf("D"); |
|     printf("E"); |   |     printf("E"); |
|     printf("F"); |   |     printf("F"); |
| }                |   | }                |
|                  |   |                  |
| // Output        |   | // Output        |
| // ABCDEF        |   | // ABDEF         |
|                  |   |                  |
| ```              |   | ```              |
+------------------+---+------------------+

A semicolon acting completely alone is called a Null statement, Empty statement, or Dummy statement. The purpose of this solitary semicolon is to provide a delay to the next instruction. 

```c
// Valid program
void main()
{
    ;
}
```

**More examples**

Example 1:

```c
#include <stdio.h>

int main() {
    int a = 1;
    
    // Non-zero is True. 0 is False.
    if(20) {
        printf("A is printed because 20 is True\n");
    }
    
    // Dummy statement example
    // The semicolon immediately ends the if body!
    if(a > 5); 
    {
        // This is unconditionally printed because the if body 
        // was closed by the semicolon above.
        printf("This executes regardless of the condition\n"); 
    }
    
    return 0;
}
```

Example 2:

+------------------+---+------------------+
| ```c             |   | ```c             |
|                  |   |                  |
| void main()      |   | void main()      |
| {                |   | {                |
|     printf("A"); |   |     printf("A"); |
|     printf("B"); |   |     printf("B"); |
|     if(3 > 2);   |   |     if(3 > 20);  |
|     printf("C"); |   |     printf("C"); |
|     printf("D"); |   |     printf("D"); |
|     printf("E"); |   |     printf("E"); |
|     printf("F"); |   |     printf("F"); |
| }                |   | }                |
|                  |   |                  |
| // Output        |   | // Output        |
| // ABCDEF        |   | // ABCDEF        |
|                  |   |                  |
| ```              |   | ```              |
+------------------+---+------------------+

Example 3:

```c
void main()
{
    printf("A");
    printf("B");
    if(3 > 2);        // Compiler will execute this with meaningless
    {                 // Dummy body start
        printf("C");
        printf("D");
    }                 // Dummy body end
    printf("E");
    printf("F");
}

// Output
// ABCDEF
```

Example 4:

+----------------------+---+----------------------+---+----------------------+
| ```c                 |   | ```c                 |   | ```c                 |
|                      |   |                      |   |                      |
| void main()          |   | void main()          |   | void main()          |
| {                    |   | {                    |   | {                    |
|     printf("A");     |   |     printf("A");     |   |     printf("A");     |
|     printf("B");     |   |     printf("B");     |   |     printf("B");     |
|     if(20)           |   |     if(0)            |   |     if( )            |
|     {                |   |     {                |   |     {                |
|         printf("C"); |   |         printf("C"); |   |         printf("C"); |
|         printf("D"); |   |         printf("D"); |   |         printf("D"); |
|     }                |   |     }                |   |     }                |
|     printf("E");     |   |     printf("E");     |   |     printf("E");     |
|     printf("F");     |   |     printf("F");     |   |     printf("F");     |
| }                    |   | }                    |   | }                    |
|                      |   |                      |   |                      |
| // Output            |   | // Output            |   | // Output            |
| // ABCDEF            |   | // ABEF              |   | // Compilation Error |
|                      |   |                      |   |                      |
| ```                  |   | ```                  |   | ```                  |
+----------------------+---+----------------------+---+----------------------+

**Interview-based program**

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

**Key Summary: if Construct**

*   Executes a block of code only when the condition is true.
*   If `{}` are missing, the body is strictly up to the first semicolon.
*   Non-zero values are True, 0 is False.
*   A standalone `;` provides an execution delay.

***

## if-else Conditional Construct

Sometimes we have a dual scenario: if a condition is true, we must do a specific job, and if it is false, we must do a different specific job. For instance, if an ATM pin is correct, allow login; if it is incorrect, throw an error message. This requires the `if-else` construct.

### The Misplaced Else Error

The `else` keyword must be placed immediately after the `if` body. If there is any statement present between the end of the `if` body and the `else` keyword, the compiler will throw a "Misplaced else" or "Else without if" error.

```c
void main()
{
    printf("A");
    printf("B");
    if(3 > 2)
    printf("C");
    printf("D");
    else
    printf("E");
    printf("F");
    printf("G");
    printf("H");
}

// Output
// Compilation Error
```

**Program to find max of 2 integers**

```c
if(a > b) {
    max = a;
} else {
    max = b;
}
```

**Program to find max of 3 integers**

+-------------------------+---+-------------------+
| ```c                    |   | ```c              |
| if((a > b) && (a > c)){ |   | if(a > b) {       |
|     max = a;            |   |     if(a > c) {   |
| } else {                |   |         max = a;  |
|     if(b > c) {         |   |     } else {      |
|         max = b;        |   |         max = c;  |
|     } else {            |   |     }             |
|         max = c;        |   | } else {          |
|     }                   |   |     if(b > c) {   |
| }                       |   |         max = b;  |
|```                      |   |     } else {      |
|                         |   |         max = c;  |
|                         |   |     }             |
|                         |   | }                 |
|                         |   | ```               |
+-------------------------+---+-------------------+

Examples

+-------------------------------+---+-------------------------------+
| ```c                          |   | ```c                          |
|                               |   |                               |
| void main() {                 |   | void main() {                 |
|     int a = 10;               |   |     int a = 10;               |
|     if(a == 5) {              |   |     if(a == 10) {             |
|         printf("Hello%d", a); |   |         printf("Hello%d", a); |
|     } else {                  |   |     } else {                  |
|         printf("Hai%d", a);   |   |         printf("Hai%d", a);   |
|     }                         |   |     }                         |
| }                             |   | }                             |
|                               |   |                               |
| // Output                     |   | // Output                     |
| // Hai5                       |   | // Hello10                    |
|                               |   |                               |
| ```                           |   | ```                           |
+-------------------------------+---+-------------------------------+

### The Dual Action of Assignment

A massive interview trap involves using the assignment operator (`=`) inside an `if` condition instead of the comparison operator (`==`). The assignment operator performs two jobs simultaneously:

1.  It assigns the right-side value to the left-side variable.
2.  It replaces the entire expression with the newly assigned value.

If you write `if (a = 0)`, `0` is assigned to `a`, and the expression evaluates to `0` (False), triggering the `else` block. 

**Why does the Assignment operator have this behaviour?**

```c
int a1, b1, c1;
c1 = b1 = a1 = 10; // This results in all variables assigned to value 10

int a2;
float b2;

a2 = b2 = 3.5 // a2 = 3, b2 = 3.5
b2 = a2 = 3.5 // a2 = 3, b2 = 3.0
```

+-------------------------------+---+-------------------------------+---+-------------------------------+
| ```c                          |   | ```c                          |   | ```c                          |
|                               |   |                               |   |                               |
| void main() {                 |   | void main() {                 |   | void main() {                 |
|   int a = 10;                 |   |   int a = 10;                 |   |   int a = 10;                 |
|   if(a = 0) {                 |   |   if(a = 1) {                 |   |   if(a = 0.75) {              |
|     printf("Hello%d", a);     |   |     printf("Hello%d", a);     |   |     printf("Hello%d", a);     |
|   } else {                    |   |   } else {                    |   |   } else {                    |
|     printf("Hai%d", a);       |   |     printf("Hai%d", a);       |   |     printf("Hai%d", a);       |
|   }                           |   |   }                           |   |   }                           |
| }                             |   | }                             |   | }                             |
|                               |   |                               |   |                               |
| // Output                     |   | // Output                     |   | // Output                     |
| // Hai0                       |   | // Hello1                     |   | // Hai0                       |
|                               |   |                               |   |                               |
| ```                           |   | ```                           |   | ```                           |
+-------------------------------+---+-------------------------------+---+-------------------------------+

**More Analysis**

```c
// What if the below conditions are in if condition?

a == 10;   // Hello10
a == 5;    // Hai10
a == 1;    // Hai10
a == 0;    // Hai10
a == 10.5; // Hai10
a == 10.0; // Hello10
a == 0.75; // Hai10

a = 10;   // Hello10
a = 5;    // Hello5
a = 1;    // Hello1
a = 0;    // Hai10
a = 10.5; // Hello10
a = 10.0; // Hello10
a = 0.75; // Hai10
```

```c
a = 10;
b = 20;
c = a && b = 30;

printf("%d %d %d", a, b, c);

// Output
// Compilation Error: l-value required
```

```c
a = 10;
b = 20;
c = a && (b = 30);

printf("%d %d %d", a, b, c);

// Output
// 10 30 1
```

```c
#include <stdio.h>

int main() {
    int a = 10, b = 20, c = 5, max;
    
    // Example 1: Assignment trap
    if(a = 0) {
        printf("True block\n");
    } else {
        printf("False block. A is now 0\n"); 
    }
    
    // Example 2: Maximum of 3 integers
    if(a > b) {
        if(a > c) {
            max = a;
        } else {
            max = c;
        }
    } else {
        if(b > c) {
            max = b;
        } else {
            max = c;
        }
    }
    
    printf("Max is: %d\n", max);
    return 0;
}
```

**Key Summary: if-else Construct**

*   Executes one block if True, and a completely different block if False.
*   `else` must immediately follow the `if` body.
*   Using `=` instead of `==` alters the variable and relies on the assigned value for truth evaluation.

***

## conditional Operator

The conditional operator is the only operator in C that requires exactly three arguments, earning it the name "ternary operator". It provides a highly compact shorthand for simple `if-else` statements.

### Syntax and Behavior

The syntax consists of three arguments separated by a question mark and a colon: `arg1 ? arg2 : arg3`.

*   If `arg1` (the left argument) is True, the entire expression is replaced by `arg2` (the middle argument).
*   If `arg1` is False, the entire expression is replaced by `arg3` (the right argument).

Every conditional operator can be converted into an `if-else` block, but not every `if-else` block can be converted into a conditional operator (as the conditional operator strictly requires a single expression per outcome).

```c
a = 10  ? 20  : 30;  // 20
a = 0   ? 20  : 30;  // 30
a = 1.5 ? 2.5 : 3.5; // 2.5
a = 100 ? 0   : 200; // 0
a = 100 ? 20  : ;    // Compilation error
```

**Finding max integers**

```c
// Max of 2 integer
max = a > b ? a : b;

// Max of 3 integer
max = a > b && a > c ? a : b > c ? b : c;

// Max of 4 integer
max = a > b && a > c && a > d ? a :
      b > c && b > d          ? b :
      c > d                   ? c :
                                d ;
```

### Grouping and Nested Conditionals

When dealing with complex, nested conditional operators containing multiple `?` and `:` symbols, programmers must follow strict grouping rules. 

To solve them:

1.  Count to ensure the number of `?` strictly equals the number of `:`.
2.  Start from the first colon (`:`) and match it to the nearest available left question mark (`?`).

```c
//        |--------------------------------------------------------|
//        |                    |-----------------|                 |
//        |       |----|       |       |----|    |       |----|    |       |----|
//        V       V    v       V       V    V    V       V    V    V       v    V
a = 4 > 3 ? 6 > 8 ? 10 : 3 > 8 ? 4 > 1 ? 20 : 30 : 4 > 7 ? 40 : 50 : 6 > 8 ? 60 : 70;
//        a       b    1       c       d    2    3       e    4    5       f    6
```

- **Step1:** Number of `?` should be equal to `:`
    - Here 6 `?` and 6 `:` are there so no error we can solve

- **Step2:** Grouping
    - Come to first colon and match with immediate left `?`
    - Pairs are (1, b), (2, d), (3, c), (4, e), (5, a) and (6, f)

- (4 > 3) is True so we need to evaluate

```c
//                     |-----------------|                
//        |----|       |       |----|    |       |----|   
//        V    v       V       V    V    V       V    V   
a = 6 > 8 ? 10 : 3 > 8 ? 4 > 1 ? 20 : 30 : 4 > 7 ? 40 : 50
//        b    1       c       d    2    3       e    4   
```

- (6 > 8) is false

```c
//        |-----------------|                
//        |       |----|    |       |----|   
//        V       V    V    V       V    V   
a = 3 > 8 ? 4 > 1 ? 20 : 30 : 4 > 7 ? 40 : 50
//        c       d    2    3       e    4   
```

- (3 > 8) is false

```c
//        |----|   
//        V    V   
a = 4 > 7 ? 40 : 50
//        e    4   

// Output
// 50
```

```c
#include <stdio.h>

int main() {
    int a = 10, b = 20, c = 30, max;
    
    // Simple conditional operator
    int result = (a > b) ? a : b;
    
    // Nested conditional operator to find maximum of 3 integers
    // Matches if-else logic exactly
    max = (a > b && a > c) ? a : 
          ((b > c) ? b : c);
          
    printf("Max of 3 is: %d\n", max);
    return 0;
}
```

**Key Summary: conditional Operator**

*   Takes three arguments: `arg1 ? arg2 : arg3`.
*   Returns `arg2` if True, `arg3` if False.
*   To evaluate complex expressions, always pair the first colon to the nearest left question mark.

***

## while loop

Writing the same code 100 times sequentially is a terrible programming practice. Whenever we notice a piece of code needs to be repeated, we rely on loops. The `while` loop is the fundamental iterative construct in C.

### The Loop Execution

As long as the condition evaluates to true, the compiler enters the body, executes it, and instantly jumps back to the condition to check it again. It only escapes when the condition evaluates to False. 

### Increment and Decrement Tuning

The behavior of a `while` loop completely depends on the logic provided.

*   If no variable is updated, it causes an **infinite loop**.
*   If the initial value is smaller than the final target, we generally use `<` or `<=` and an **increment factor**.
*   If the initial value is larger than the final target, we use `>` or `>=` and a **decrement factor**.
*   If the logic is contradictory (e.g., `a=5; while(a<=1)`), the loop strictly executes **zero times**.

**Different ways to control the loops**

+------------------+--+------------------+--+------------------+--+------------------+--+------------------+
| ```c             |  | ```c             |  | ```c             |  | ```c             |  | ```c             |
| a = 1;           |  | a = 1;           |  | a = 1;           |  | a = 5;           |  | a = 5;           |
| while(a <= 5)    |  | while(a <= 5)    |  | while(a <= 5)    |  | while(a <= 1)    |  | while(a >= 1)    |
| {                |  | {                |  | {                |  | {                |  | {                |
|                  |  |  a = a - 1;      |  |  printf("A");    |  |  a = a - 1;      |  |  printf("A");    |
| }                |  | }                |  |  a = a + 1;      |  | }                |  |  a = a - 1;      |
|                  |  |                  |  | }                |  |                  |  | }                |
| // Output        |  | // Output        |  |                  |  | // Output        |  |                  |
| // Inf loop      |  | // Inf loop      |  | // Output        |  | // 0 loops       |  | // Output        |
|                  |  |                  |  | // AAAAA         |  |                  |  | // AAAAA         |
| ```              |  | ```              |  |                  |  | ```              |  |                  |
|                  |  |                  |  | ```              |  |                  |  | ```              |
+------------------+--+------------------+--+------------------+--+------------------+--+------------------+

```c
#include <stdio.h>

int main() {
    int a = 1;
    
    // Forward iteration
    while(a <= 3) {
        printf("A is: %d\n", a);
        a = a + 1; // Increment factor
    }
    
    int b = 3;
    
    // Backward iteration
    while(b >= 1) {
        printf("B is: %d\n", b);
        b = b - 1; // Decrement factor
    }
    
    return 0;
}
```

**Different ways of printing sequence numbers.** There is no standard way it is programmers wish.

```c
a = 1;
while(a <= 5) {
    printf("%d", a);
    a = a + 1;
}

// Output
// 12345
```

```c
a = 5;
while(a >= 1) {
    printf("%d", 6 - a);
    a = a - 1;
}

// Output
// 12345
```

```c
a = 10;
while(a >= 1) {
    printf("%d", 6 - (a / 2));
    a = a - 2;
}

// Output
// 12345
```

**Different ways of printing alternate numbers.**

```c
a = 1;
while(a <= 5) {
    if(a%2 == 0) {
        printf("%d", 0);
    } else {
        printf("%d", 1);
    }

    a = a + 1;
}

// Output
// 10101
```

```c
a = 1;
while(a <= 5) {
    printf("%d", a % 2);
    a = a + 1;
}

// Output
// 10101
```

```c
k = 1;
a = 1;
while(a <= 5) {
    printf("%d", k);
    k = !k; // also k = 1 - k;
    a = a + 1;
}

// Output
// 10101
```

**Examples to understand the core while loops**

```c
a = b = 1;
while(a) {
    a = b <= 3;
    printf("%d %d\n", a, b);
    b = b + 1;
}
printf("%d %d\n", a + 10, b + 10);

// Output
/*
1 1
1 2
1 3
0 4
10 15
*/
```

```c
a = b = 10;
while(a) {
    a = b <= 13;
    printf("%d %d\n", a, b);
    b = b + 1;
}
printf("%d %d", a + 10, b + 10);

// Output
/*
1 10
1 11
1 12
1 13
0 14
10 25
*/
```

**Key Summary: while loop**

*   Reduces code repetition.
*   Executes continuously as long as the condition remains True.
*   Failing to update the condition variable causes an infinite loop.

***

## Nested while Loops

When we notice a piece of code repeating, we use a loop. However, when we notice the *loop itself* needs to be repeated multiple times, we place one loop inside another. This is called a nested loop.

**Syntax**

```c
while( condition 1 ) {
    while ( condition 2 ) {

    }
}
```

**Simple use case**

+----------------------+---+--------------------------+
| ```c                 |   | ```c                     |
| a = 1;               |   | k = 1;                   |
| while(a <= 5) {      |   | while(k <= 3) {          |
|     printf("%d", a); |   |     a = 1;               |
|     a = a + 1;       |   |     while(a <= 5) {      |
| }                    |   |         printf("%d", a); |
|                      |   |         a = a + 1;       |
| a = 1;               |   |     }                    |
| while(a <= 5) {      |   |     k = k + 1;           |
|     printf("%d", a); |   | }                        |
|     a = a + 1;       |   |                          |
| }                    |   | // Output                |
|                      |   | /*                       |
| a = 1;               |   | 12345                    |
| while(a <= 5) {      |   | 12345                    |
|     printf("%d", a); |   | 12345                    |
|     a = a + 1;       |   | */                       |
| }                    |   |                          |
|                      |   | ```                      |
| // Output            |   |                          |
| /*                   |   |                          |
| 12345                |   |                          |
| 12345                |   |                          |
| 12345                |   |                          |
| */                   |   |                          |
| ```                  |   |                          |
+----------------------+---+--------------------------+

### Axis Control and Execution

In nested loops, the inner loop strictly controls horizontal processing (x-axis), while the outer loop strictly controls vertical processing (y-axis) to move to new lines.
If an outer loop runs 5 times, and an inner loop runs 5 times per outer iteration, the innermost code block will execute exactly 25 times.

### Fibonacci Series Generation

Nested loops are frequently used in algorithms like the Fibonacci series. In a Fibonacci sequence, the current value and previous value are mathematically added to dynamically generate the next term. Because this formula strictly repeats for every term required, loop iteration handles the calculation seamlessly.

```c
#include <stdio.h>

int main() {
    int k = 1, a = 1;
    
    // Outer loop controls rows (y-axis)
    while(k <= 3) {
        a = 1; 
        
        // Inner loop controls columns (x-axis)
        while(a <= 5) {
            printf("%d ", a);
            a = a + 1;
        }
        
        printf("\n"); // Move to new line
        k = k + 1;
    }
    
    return 0;
}
```

**Examples**

```c
// In this program changing the multiple statements we shall generate multiple
// Patterns

k = 1;
while(k <= 5) {
    a = 1;
    while(a <= k) {
        printf("%d", a);
        a = a + 1;
    }
    k = k + 1;
}

// Output
/*
1
1 2
1 2 3
1 2 3 4
1 2 3 4 5
*/
```

**More Patterns Examples**

```c
/*
1
12
123
1234
12345

5
55
555
5555
55555

1
22
333
4444
55555

1
21
321
4321
54321

5
54
543
5432
54321

5
45
345
2345
12345

12345
2345
345
45
1

12345
1234
123
12
1

*/
```

**Key Summary: Nested while Loops**

*   One loop present inside another is a nested loop.
*   The inner loop runs to completion for every single iteration of the outer loop.
*   Used whenever an output requires both x-axis and y-axis processing.

***

## For loop

While the `while` loop is powerful, the `for` loop consolidates all iteration logic onto a single line. If a programmer knows the exact number of iterations required in advance (such as processing an array), it is highly recommended to use a `for` loop.

### Syntax and Structure

A `for` loop structurally requires three parts separated by semicolons: 

`for(initialization; condition; reinitialization)`.

*   **Initialization:** Executed only once at the very beginning.
*   **Condition:** Checked before entering the loop body.
*   **Reinitialization:** Executed strictly *after* the loop body finishes, just before checking the condition again.

**Syntax**

```c
//  (1)          (2)(5)       (4)(7)
for(statement 1; statement 2; statement 3) {
    // (3)(6) for body
}

/* Recommended */
//   (1)   (2)(5)    (4)(7)
for(init; condition; re-init) {
    // (3)(6) for body
}
```

### The Optional Arguments

In C, the initialization, condition, and reinitialization statements are entirely optional, but the **two semicolons are mandatory**. You can declare multiple variables in the initialization phase separated by commas. If you leave the condition empty, the compiler defaults it to True, resulting in an infinite loop (`for(;;)`).

- Function call can be part of init and re-init.

```c
#include <stdio.h>

int main() {
    int i, j;
    
    // Standard for loop
    for(i = 1; i <= 3; i = i + 1) {
        printf("Loop %d\n", i);
    }
    
    // Multiple initializations and reinitializations
    for(i = 1, j = 10; i <= 3; i = i + 1, j = j - 1) {
        printf("I: %d, J: %d\n", i, j);
    }
    
    return 0;
}
```

```c
void main()
{
    int a;
    for(a = 1; a <= 5; a = a + 1);
    printf("A");
}

// Output
// A
```

+----------------------+---+----------------------+
| ```c                 |   | ```c                 |
| void main()          |   | void main()          |
| {                    |   | {                    |
|     int a;           |   |     int a;           |
|     for( ; ; ) {     |   |     while( ) {       |
|         printf("A"); |   |         printf("A"); |
|     }                |   |     }                |
| }                    |   | }                    |
|                      |   |                      |
| // Output            |   | // Output            |
| // Infinite loop     |   | // Compilation Error |
| ```                  |   | ```                  |
+----------------------+---+----------------------+

```c
void main()
{
    int a;
    for(a = 1; a <= 5; if(a >= 3) printf("Hello")) {
        printf("%d", a);
        a = a + 1;
    }
}

// Output
// 12Hello3Hello4Hello5Hello - User Expected
// Compilation error         - Actual, error because `if` construct is there
//                             but expected is statement
```

**Key Summary: For loop**

*   Best utilized when the exact number of iterations is known.
*   Contains 3 components: initialization, condition, reinitialization.
*   The two semicolons are compulsorily required, even if all arguments are empty.

> If we know number of iteration in advance then use `for` loop  
> - **Example:** To process array elements  
> If we don't know number of iteration in advance then use `while` loop  
> - **Example:** To process linked list elements

***

## do while Loop

Standard loops check a condition first and execute later. However, there are scenarios—such as ATM transactions—where an operation must execute at least once before asking the user if they want to continue. This necessitates the `do while` loop.

### Execution Flow

The `do while` loop strictly guarantees that its body will execute **at least once**, irrespective of whether the condition evaluates to true or false initially. 

*   "Do" literally translates to "do the body".
*   Only after completing the body does the compiler check the `while` condition at the bottom.

### Syntax Rule

When defining a `do while` loop, the `while` statement must immediately follow the closing of the `do` body, and it must compulsorily end with a semicolon (`;`).

**Syntax**

```c
do
{

    // (1)(3) do body

} while( condition );
//      (2)(4)
```

```c
#include <stdio.h>

int main() {
    int a = 1;
    
    // Standard do-while execution
    do {
        printf("A is: %d\n", a);
        a = a + 1;
    } while(a <= 3); // Compulsory semicolon!
    
    int b = 10;
    
    // Executes exactly once even though 10 > 50 is false
    do {
        printf("Executes regardless of initial false condition\n");
    } while(b > 50); 
    
    return 0;
}
```

```c
/* This executes the body when condition is true */

a = 1;
while(a < 1) {
    printf(a);
    a = a + 1;
}

// Output
// <No Output>
```

```c
/*This executes the body at least 1 time irrespective of condition */

a = 1;
do {
    printf(a);
    a = a + 1;
} while(a < 1);

// Output
// 1
```

```c
a = 1;
do
while(a < 1);

// Wrong body (or) at least one statement must be there
```

```c
a = 11;
do
while(a++ <= 11); // <- Body of do-while loop
while(a++ <= 12); // <- While condition
while(a++ <= 13); // Outer loop
while(a++ <= 14); // Outer loop

printf("%d", a);
```

**Key Summary: do while Loop**

*   Guarantees a minimum of one execution regardless of the condition.
*   Condition is verified at the bottom, not the top.
*   The `while` statement must terminate with a semicolon.

***

## Break

Normally, a loop strictly terminates only when its logical condition evaluates to false. However, the `break` keyword provides a mechanism to forcibly violate this rule.

### Escaping Loops and Efficiency

Whenever the compiler encounters the `break` keyword, it immediately ejects the flow out of the loop, completely ignoring any remaining iterations or code. 

It is highly useful when we know the maximum possible iterations, but do not know at which exact iteration our functionality will succeed. For example, when checking if a number is prime, we loop through potential factors. As soon as we find a single factor, the number is proven not prime. We execute `break` to avoid checking all remaining numbers, massively saving processing time.

### Placement Limitations

The `break` keyword is strictly restricted. It can only be used inside the four core blocks: `while`, `for`, `do while`, or `switch`. Using it inside a standalone `if` block (without an enclosing loop) results in a "Break outside loop or switch" compilation error.

```c
#include <stdio.h>

int main() {
    int a = 1;
    
    while(a <= 10) {
        if(a == 5) {
            // Terminates the loop completely when 'a' reaches 5
            break; 
        }
        printf("%d ", a);
        a = a + 1;
    }
    
    // Output will strictly be: 1 2 3 4
    printf("\nEscaped the loop.\n");
    return 0;
}
```

**Example: Find the number is prime or not**

```c
// CASE I

for(i = 2; i < n; i++) {
    if(n % i == 0) {
        flag = 0;
        break;
    }
}

if(flag == 0) {
    printf("Not a prime");
} else {
    printf("Prime");
}

// CASE II : check 2 to n - 1
// CASE III: check 2 to n/2
/* CASE IV : 
    1. check if number is 2 or not
    2. Check even or odd. Even numbers are not prime
    3. If odd check from 3 to sqrt(n) with step factor 2
*/
if(n == 2) {
    printf("prime");
    return;
}

if(n % 2 == 0) {
    printf("Not prime");
} else {
    flag = 1
    for(i = 3; i < =sqrt(n); i = i + 2) {
        if(n % i == 0) {
            flag = 0;
            break;
        }
    }

    if(flag == 1) {
        printf("Prime");
    } else {
        printf("Not prime");
    }
}
```

**Key Summary: Break**

*   Forces an immediate exit from the current loop or switch.
*   Used heavily to optimize logic when a success state is found early.
*   Throws a compilation error if used outside a loop or switch context.

***

## Continue

While `break` completely destroys a loop's cycle, `continue` acts as a surgical bypass. It allows a loop to keep running while ignoring specific unwanted iterations.

### Skipping Iterations

Whenever the `continue` keyword is encountered, the compiler instantly skips all remaining statements below it in the current iteration. It then forcefully routes control back to the loop's condition (in a `while` loop) or the reinitialization phase (in a `for` loop) to start the *next* iteration.

Like `break`, the `continue` keyword is invalid outside of loops and will throw a compilation error.

### The Infinite Loop Danger

Programmers must be exceptionally careful when using `continue` inside a `while` loop. If the increment variable statement (`a = a + 1`) is placed *below* the `continue` keyword, it will be skipped entirely. This traps the program in a permanent infinite loop because the variable is never updated to falsify the condition.

```c
#include <stdio.h>

int main() {
    int i;
    
    for(i = 1; i <= 5; i = i + 1) {
        if(i == 3) {
            // Skips printing '3', but loop continues
            continue; 
        }
        printf("%d ", i);
    }
    
    // Output: 1 2 4 5
    return 0;
}
```

**Key Summary: Continue**

*   Skips the current iteration and jumps directly to the next.
*   Restricted purely to loop constructs.
*   Placing increments beneath it in a `while` loop risks infinite loops.

***

## goto

The `goto` keyword unconditionally teleports program control from one line to an entirely different line within the same function. It is highly powerful but deeply dangerous.

> This cannot take control from one function to another function

### Labels and Jumping

`goto` requires a marked destination called a label. 

*   A `goto` statement must end with a semicolon (`;`).
*   A label must be a valid identifier name ending with a colon (`:`).
*   **Forward Jump:** `goto` is above, and the target label is below.
*   **Backward Jump:** The label is above, and `goto` pushes control backwards, simulating a loop without actually using `while` or `for`.
*   If there is a goto statement then label is compulsory
*   If there is label, goto is optional.

### The Danger and Valid Use Cases

`goto` is notoriously dangerous because it allows programmers to bypass initializations, jump unpredictably, and even execute both `if` and `else` blocks simultaneously, destroying application logic. 

However, `goto` has one extremely valid use case in modern programming: escaping deeply nested loops. A standard `break` only escapes the single nearest loop, but `goto` can instantly pull execution out of three or four nested loops at once.

```c
while {
    while {
        while {
            goto outside;
        }
    }
}

outside:
```

**Forward Jump**
```c
void main() {
    printf("A");
    printf("B");
    goto end;
    printf("C");
    printf("D");
    end:
    printf("E");
    printf("F");
}

// Output
// ABEF
```

**Backward Jump**
```c
void main() {
    int a = 1;
    printf("A");
    start:
    printf("B");
    if(a <= 3) {
        printf("C");
        a++;
        goto start;
    }
    printf("D");
}

// Output
// ABCBCBCBD
```

**Loop without loops**
```c
a = 1;
loop;
if(a <= 100) {
    print("%d", a);
    a++;
    goto loop;
}

// Output
// 1234 ... 100
```

**Problem solving**
```c
void main() {
    printf("A");
    goto end;
    printf("B");
}

// Output
// Compilation error: Undefined label
```

```c
void main() {
    printf("A");
    start;
    printf("B");
}

// Output
// AB
```

```c
void main() {
    printf("A");
    goto end;
    end:
    printf("B");
}

// Output
// AB
```

```c
void main() {
    printf("A");
    goto end;
    printf("B");
    end:
}

// Output
// A
```

```c
void main() {
    printf("A");
    goto 375;
    printf("B");
    375:
    printf("C");
}

// Output
// Compilation error: invalid label name
```

```c
void main() {
    printf("A");
    goto start:
    printf("B");
    start;
    printf("C");
}

// Output
// Compilation error: goto syntax error
```

```c
void main() {
    printf("A");
    goto start;
    printf("B");
    end:
    printf("C");
    start:
    printf("D");
    goto end;
    printf("E");

}

// Output
// ADCDCDCD ... infinity
```

```c
void main() {
    printf("A");
    if(3 > 2) {
        printf("B");
        goto here;
        printf("C");
    } else {
        here:
        printf("D");
        printf("E");
    }
    printf("F");
}

// Output
// ABDEF
```

```c
void main() {
    int a;
    goto here;
    for(a = 1; a <= 5; a++) {
        here:
        printf("%d", a);
    }
}

// Output
// GV .. till loop fails
```

```c
void func() {
    here:
    printf("Hello Func");
}

void main() {
    printf("A");
    goto here;
    printf("C");
}

// Output
// Compilation error
```

```c
#include <stdio.h>

int main() {
    int a = 1;
    
    // Label for backward jumping
    start: 
    if(a <= 3) {
        printf("%d ", a);
        a = a + 1;
        
        // Simulating a loop unconditionally
        goto start; 
    }
    
    printf("\nDone.");
    return 0;
}
```

**Key Summary: goto**

*   Transfers execution unconditionally to a specified label.
*   Cannot teleport control across different functions.
*   While generally avoided for safety, it is uniquely effective for breaking out of deeply nested loops.

***

## Switch

When a program features a menu with multiple exclusive choices (like a customer service hotline offering "Press 1 for English, Press 2 for Spanish"), managing deeply chained `if-else` blocks becomes messy. The `switch` statement is designed specifically for clean, menu-driven logic.

### Match and Execute

`switch` takes a single argument.

1.  The compiler scans for a `case` that perfectly matches the argument.
2.  If matched, it executes that case and *all subsequent cases* until it hits a `break` keyword or the end of the switch. 
3.  If no case matches, it searches for the optional `default` case.
4.  If neither matches and no default exists, it safely exits the switch doing nothing.

Because execution falls through cases until a `break` is hit, it is entirely possible for the `default` case to execute accidentally if a normal case lacks a `break` statement.

### Strict Case Rules

The `switch` construct has very rigid rules for its `case` labels:

*   Cases can be written in any random order, and `default` can be placed anywhere.
*   Negative numbers are valid cases.
*   Every case value must strictly be a **unique constant expression**.
*   Variables (e.g., `case a:`) and float values are strictly prohibited.
*   Two cases cannot share the exact same mathematical result (e.g., `case 1:` and `case 3-2:` cause duplicate case errors).

```c
#include <stdio.h>

int main() {
    int choice = 2;
    
    switch(choice) {
        case 1:
            printf("Choice is 1\n");
            break;
        case 5 - 3: // Valid constant expression for 2
            printf("Choice is 2\n");
            break;
        case 3:
            printf("Choice is 3\n");
            break;
        default:
            printf("Invalid Choice\n");
            break;
    }
    
    return 0;
}
```

```c
void main() {
    int a = 2;
    switch(a) {
        case 1: printf("A");
                break;
        case 2: printf("B");
                break;
        case 3: printf("C");
                break;
        default: printf("D");
    }
}

// Output
// B
```

```c
void main() {
    int a = 2;
    switch(a) {
        case 1: printf("A");
                break;
        case 2: printf("B");
        case 3: printf("C");
                break;
        default: printf("D");
    }
}

// Output
// BC
```

```c
void main() {
    int a = 2;
    switch(a) {
        case 1: printf("A");
                break;
        case 2: printf("B");
        case 3: printf("C");
        default: printf("D");
    }
}

// Output
// BCD
```

- If matched `case` is executed then there is a chance of executing `default` case as well.

```c
void main() {
    int a = 5;
    switch(a) {
        case 1: printf("A");
                break;
        case 2: printf("B");
                break;
        case 3: printf("C");
                break;
        default: printf("D");
    }
}

// Output
// D
```

```c
void main() {
    int a = 5;
    switch(a) {
        case 1: printf("A");
                break;
        case 2: printf("B");
                break;
        case 3: printf("C");
                break;
    }
}

// Output
// <No output>
```

- `case` and `default` can be written in any order.
- Negative cases are also allowed.

```c
void main() {
    int a = 2;
    switch(a) {
        case 3: printf("A");
        case 2: printf("B");
        default: printf("C");
        case 37: printf("D");
        case -7: printf("E");
    }
}

// Output
// BCDE
```

- `continue` keyword should not be a part of `switch`.

```c
void main() {
    int a = 5;
    switch(a) {
        case 7: printf("A");
        case 4: printf("B");
        case 5: printf("C");
        case 21: printf("D");
                continue;
        default: printf("E");
    }
}

// Output
// Compilation Error: continue keyword outside loop
```

- Every `case` value should be a constant expression and its result should be unique. No repeated cases, floats, or variables are allowed.

```c
void main() {
    int a = 2;
    switch(a) {
        case 1: printf("A");
        case a: printf("B");
        case 5: printf("C");
        default: printf("D ");
    }
}

// Output
// Compilation Error: constant required
```

```c
void main() {
    int a = 3;
    switch(a) {
        case 5 - 8: printf("A");
        case 9 - 4: printf("B");
        case 5 * 2: printf("C");
        case 2 + 1: printf("D");
        case 4 > 3: printf("E");
        default: printf("F");
    }
}

// Output
// DEF
```

```c
void main() {
    int a = 3;
    switch(a) {
        case 8: printf("A");
        case 3: printf("B");
        case 2: printf("C");
        case 1: printf("D");
        case 3: printf("E");
        default: printf("F");
    }
}

// Output
// Compilation error: Duplicate case
```

```c
void main() {
    int a = 3;
    switch(a) {
        case 8: printf("A");
        case 3.0: printf("B");
        case 2: printf("C");
        case 1: printf("D");
        case 4: printf("E");
        default: printf("F");
    }
}

// Output
// Compilation error: Integer constant expression required
```

**More Examples**

```c
void main() {
    int a = 3;
    switch(a) {
        printf("Hello");     // Warning: unreachable code
        case 8: printf("A");
        case 3: printf("B");
        case 2: printf("C");
        case 1: printf("D");
        case 4: printf("E");
        default: printf("F");
    }
}

// Output
// BCDEF
```

```c
void main() {
    int a = 3;
    switch(a) {
        case8: printf("A");
        case3: printf("B");
        case2: printf("C");
        case1: printf("D");
        case4: printf("E");
        default: printf("F");
    }
}

// Output
// F

// If there is no space between case and integer constant then that is considered
// as a label for goto
```

```c
void main() {
    int a = 2;
    switch(a) {
        case 1:
        case 3:
        case 5: printf("odd");
                break;
        case 2:
        case 4:
        case 6: printf("Even");
                break;
    }
}

// Output
// Even

// Grouping case is possible
```

```c
void main() {
    int a;
    for(a = 1; a <= 5; a++) {
        switch(a) {
            case 1: printf("A");
            case 3:
            case 5: continue;     // This is part of loop
            case 4: printf("B");
                    break;        // This is part of switch
            case 2: printf("C");
            default: printf("D");
        }
    }
}

// Output
// ACDB
```

**Key Summary: Switch**

*   Perfect for N-choice, menu-driven code.
*   Executes matched code sequentially until a `break` is encountered.
*   Cases must strictly be unique, integer-based constant expressions.

***

## Summary of Flow Control

C provides two overarching categories of flow control: **Conditional** and **Unconditional**.

*   **Conditional Flow Control:** Executes code only when specific logic validates.
    *   *Selective:* Chooses a specific block (`if`, `if-else`, ternary operator, `switch`).
    *   *Iterative:* Repeats a specific block (`while`, `for`, `do-while`).
*   **Unconditional Flow Control:** Bypasses or forces logic without requiring validation (`goto`, `break`, `continue`, `return`).
