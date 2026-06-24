# Increment and Decrement Operators

In C programming, increment (`++`) and decrement (`--`) operators are specialized unary operators used to increase or decrease a variable's value exactly by `1`. They simulate real-world concepts like "prepaid" (pay first, use later) and "postpaid" (use first, pay later) services. Understanding the precise timing of when the value is updated versus when the expression is evaluated is one of the most critical skills for solving complex logic and placement problems.

*   [Increment Operator](#increment-operator)
*   [Decrement Operator](#decrement-operator)
*   [Examples with Basic Concept](#examples-with-basic-concept)
*   [Examples with Flow Control](#examples-with-flow-control)
*   [Examples with Logical Operator](#examples-with-logical-operator)
*   [Examples with Flow Control and Logical Operator](#examples-with-flow-control-and-logical-operator)

***

## Increment Operator

The increment operator (`++`) internally acts as `a = a + 1`. However, placing the operator before the variable (Pre-increment) versus after the variable (Post-increment) fundamentally changes the order of execution within a statement.

**Syntax**

+--------------------------------+---+------------------------------------------------+
| ```c                           |   | ```c                                           |
|                                |   |                                                |
| void main() {                  |   | void main() {                                  |
|     int a = 1;                 |   |     int a = 5;                                 |
|                                |   |                                                |
|     a++; // Post increment     |   |     /*                                         |
|     ++a; // Pre increment      |   |     Here increment happened but not updated in |
|                                |   |     'a'. So assignment operator needed         |
|     /*                         |   |     */                                         |
|     Both are internally act as |   |     a + 1;                                     |
|     a = a + 1 and replace with |   | }                                              |
|     constant                   |   |                                                |
|     */                         |   | ```                                            |
| }                              |   |                                                |
|                                |   |                                                |
| ```                            |   |                                                |
+--------------------------------+---+------------------------------------------------+

### Pre-Increment (*++a*)

**Rule:** Increment and Replace. 

1. The compiler first increments the value of the variable.
2. It then replaces the expression with this newly updated value.

### Post-Increment (*a++*)

**Rule:** Replace and Increment.

1. The compiler first replaces the expression with the variable's *current* value.
2. It then strictly increments the variable in the background.

```c
#include <stdio.h>

int main() {
    int a = 5;
    
    /* Pre-Increment: Increment first (6), then replace. */
    int b = ++a; 
    
    /* Output: a is 6, b is 6 */
    printf("Pre-Increment: a=%d, b=%d\n", a, b);
    
    a = 5; // Reset
    
    /* Post-Increment: Replace first (5), then increment a to 6. */
    int c = a++; 
    
    /* Output: a is 6, c is 5 */
    printf("Post-Increment: a=%d, c=%d\n", a, c);
    
    return 0;
}
```

**Key Summary: Increment Operator**

*   `++a` (Pre-increment): Increment the variable, then use the new value.
*   `a++` (Post-increment): Use the current value, then increment the variable.
*   Both strictly result in the variable ultimately increasing by `1`.

***

## Decrement Operator

The decrement operator (`--`) internally acts as `a = a - 1`. It follows the exact same "replace vs execute" rules as the increment operator depending on its placement.

+---------------------------------+---+---------------------------------+
| ```c                            |   | ```c                            |
|                                 |   |                                 |
| void main() {                   |   | void main() {                   |
|     int a = 5;                  |   |     int a = 5;                  |
|                                 |   |                                 |
|     /*                          |   |     /*                          |
|      1. Decrement 'a' first.    |   |      1. Replace expression with |
|      2. Replace expression with |   |         'a' value               |
|         updated 'a'             |   |      2. Decrement 'a' later.    |
|     */                          |   |     */                          |
|     int b = --a;                |   |     int b = a--;                |
|                                 |   |                                 |
|     printf("%d %d", a, b);      |   |     printf("%d %d", a, b);      |
|                                 |   |                                 |
| // Output                       |   | // Output                       |
| // 4 4                          |   | // 4 5                          |
| }                               |   | }                               |
|                                 |   |                                 |
| ```                             |   | ```                             |
+---------------------------------+---+---------------------------------+

### Pre-Decrement (*--a*)

**Rule:** Decrement and Replace.

1. The compiler first decrements the value of the variable.
2. It then replaces the expression with this newly updated value.

### Post-Decrement (*a--*)

**Rule:** Replace and Decrement.

1. The compiler first replaces the expression with the variable's *current* value.
2. It then strictly decrements the variable in the background.

```c
#include <stdio.h>

int main() {
    int a = 5;
    
    /* Pre-Decrement: Decrement first (4), then replace. */
    int b = --a; 
    
    /* Output: a is 4, b is 4 */
    printf("Pre-Decrement: a=%d, b=%d\n", a, b);
    
    a = 5; // Reset
    
    /* Post-Decrement: Replace first (5), then decrement a to 4. */
    int c = a--; 
    
    /* Output: a is 4, c is 5 */
    printf("Post-Decrement: a=%d, c=%d\n", a, c);
    
    return 0;
}
```

**Key Summary: Decrement Operator**

*   `--a` (Pre-decrement): Decrement the variable, then use the new value.
*   `a--` (Post-decrement): Use the current value, then decrement the variable.

***

## Examples

### Examples with basic concept

Example 1:

```c
void main() {
    int a = 5;
    ++a;
    printf("%d", a);
}

// Output
// 6
```

Example 2:

```c
void main() {
    int a = 5;
    a++;
    printf("%d", a);
}

// Output
// 6
```

Example 3:

```c
void main() {
    int a = 5;
    printf("%d", ++a);
}

// Output
// 6
```

Example 4:

```c
void main() {
    int a = 5;
    printf("%d", a++);
}

// Output
// 5
```

Example 5:

```c
void main() {
    float f = 5.5;
    ++f;
    printf("%d", f);
}

// Output
// 6.5
```

Example 6:

```c
void main() {
    int a = 5;
    ++(++a);
    printf("%d", a);
}

// Output
// Compilation Error: Increment not possible on constant
```

- Nesting of increment / decrement operator is not allowed.

```c
// Invalid

++ ++a;
++a++;
a++++;
++--a;
--a--;
a----;
a++--;
```

Example 7:

```c
void main() {
    int a = 5;
    a = ++100;
    printf("%d", a);
}

// Output
// Compilation Error: Increment not possible on constant
```

---

### Examples with flow control

> If we are trying to change a variable value more than once in single statement the result is dependant on compiler

```c
void main() {
    int a = 5;
    int b = ++a * a++ * ++a;
    /* Turbo C compier
         1.  6  * a++ * 7
         2.  7  * a++ * 7
         3.  7  * 7   * 7

         a = 8
         b = 343
    */

    /* gcc compier
             6  * 6 * 8

         a = 8
         b = 288
    */
}
```

**Turbo C compiler**

1. Do all pre increment
2. Substitute latest value everywhere
3. Do all post increment

**GCC compiler**

- If pre increment then increment and replace
- If post increment then replace and increment

Example 8:

```c
void main() {
    int a;
    a = 5;
    a = a++;
    printf("%d", a);
    /*
    Turbo C: makes `a = a++` to `a++`
    GCC    : makes `a = a++` to `a = a`
    */
}
```

Example 9:

```c
void main() {
    int a = 10;
    a = - -5; // Not performing decrement operation on constant here
    printf("%d", a);
}

// Output
// 5
```

Example 10:

```c
void main() {
    int a = 10;
    if(a++ > 10) { // Here condition is true or false but always inc / dec happen
        printf("Hello%d", a);
    } else {
        printf("hai%d", a);
    }
}

// Output
// hai11
```

Example 11:

```c
void main() {
    int a;
    a = 1;
    while(a++ <= 1)
    while(a++ <= 2);
    printf(a);
}

// Output
// 5
```

Example 12:

```c
void main() {
    int a;
    a = 1;
    while(a++ <= 1);
    while(a++ <= 2)
    printf(a);
}

// Output
// No output (because printf is part of while but `a` variable incremented to 4)
```

Example 13:

```c
void main() {
    int a;
    a = 1;
    while(a++ <= 1)
    while(a++ <= 2)
    printf(a);
}

// Output
// 3
```

Example 14:

```c
void main() {
    int a;
    for(a = 1; a++ < = 1; a++) {
        for(a++; a++ <= 6; a++) {
            a++;
        }
    }
    printf("%d", a);
}

// Output
// 12
```

Example 15:

```c
void main() {
    int a = 1;
    do {
        ++a;
        printf("%d", a);
        if(a++ <= 5) {
            continue;
        }
        printf("%d", a);
    } while(a++ <= 10);
}

// Output
// 2 5 8 9 11 12
```

---

### Examples with Logical operator

Example 16:

```c
/* Short circuit Concept

0 && x => 0
1 && arg1 => Output

1 || x => 1
0 || arg1 => Output

- x is don't care
- output depends on arg1
*/

void main() {
    int a = b = c = 1;
    int d;

    // (++a && ++b) && ++c; This group is done depends on precedance
    d = ++a && ++b && ++c;
    // d = (2 && 2) && ++c;
    // d = (1) && ++c;
    // Output: a = 2, b = 2, c = 2, d = 1

    // (++a && ++b) || ++c; This group is done depends on priority
    d = ++a && ++b || ++c;
    // d = (2 && 2) || ++c;
    // d = (1) || ++c; Here First arg is non zero for logical OR so don't execute rest
    // Output: a = 2, b = 2, c = 1, d = 1

    // (++a || ++b) || ++c; This group is done depends on precedance
    d = ++a || ++b || ++c;
    // Output: a = 2, b = 1, c = 1, d = 1

    //  ++a || (++b && ++c); This group is depends on priority
    // The operands can be group based on priority and precedance but
    // compulsory execute operands from left to right.
    d = ++a || ++b && ++c;
    // Output: a = 2, b = 1, c = 1, d = 1
}
```

Example 17:

```c
/* Short circuit Concept

0 && x => 0
1 && arg1 => Output

1 || x => 1
0 || arg1 => Output

- x is don't care
- output depends on arg1
*/

void main() {
    int a = b = c = -1;
    int d;

    // (++a && ++b) && ++c; This group is done depends on precedance
    d = ++a && ++b && ++c;
    // d = (0 && ++b) && ++c;
    // d = (0) && ++c;
    // Output: a = 0, b = -1, c = -1, d = 0

    // (++a && ++b) || ++c; This group is done depends on priority
    d = ++a && ++b || ++c;
    // d = (0 && ++b) || ++c;
    // d = (0) || ++c; Here First arg is zero for logical OR so execute rest
    // d = (0) || (0);
    // Output: a = 2, b = -1, c = 0, d = 0

    // (++a || ++b) || ++c; This group is done depends on precedance
    d = ++a || ++b || ++c;
    // Output: a = 0, b = 0, c = 0, d = 0

    //  ++a || (++b && ++c); This group is depends on priority
    d = ++a || ++b && ++c;
    // Output: a = 0, b = 0, c = -1, d = 0
}
```

Example 18:

```c
/* Short circuit Concept

0 && x => 0
1 && arg1 => Output

1 || x => 1
0 || arg1 => Output

- x is don't care
- output depends on arg1
*/

void main() {
    int a = b = c = 1;
    int d;

    // (a++ && b++) && c++; This group is done depends on precedance
    d = a++ && b++ && c++;
    // d = (1 && 1) && c++;
    // d = (1) && c++;
    // Output: a = 2, b = 2, c = 2, d = 1

    // (a++ && b++) || c++; This group is done depends on priority
    d = a++ && b++ || c++;
    // d = (1 && 1) || c++;
    // d = (1) || c++; Here First arg is zero for logical OR so execute rest
    // Output: a = 2, b = 2, c = 1, d = 1

    // (a++ || b++) || c++; This group is done depends on precedance
    d = a++ || b++ || c++;
    // Output: a = 2, b = 1, c = 1, d = 1

    //  a++ || (b++ && c++); This group is depends on priority
    d = a++ || b++ && c++;
    // Output: a = 2, b = 1, c = 1, d = 1
}
```

Example 19:

```c
/* Short circuit Concept

0 && x => 0
1 && arg1 => Output

1 || x => 1
0 || arg1 => Output

- x is don't care
- output depends on arg1
*/

void main() {
    int a = b = c = 0;
    int d;

    // (a++ && b++) && c++; This group is done depends on precedance
    d = a++ && b++ && c++;
    // d = (0 && b++) && c++;
    // d = (0) && c++;
    // Output: a = 1, b = 0, c = 0, d = 0

    // (a++ && b++) || c++; This group is done depends on priority
    d = a++ && b++ || c++;
    // d = (0 && b++) || c++;
    // d = (0) || c++; Here First arg is zero for logical OR so execute rest
    // Output: a = 1, b = 0, c = 1, d = 0

    // (a++ || b++) || c++; This group is done depends on precedance
    d = a++ || b++ || c++;
    // Output: a = 1, b = 1, c = 1, d = 0

    //  a++ || (b++ && c++); This group is depends on priority
    d = a++ || b++ && c++;
    // Output: a = 1, b = 1, c = 0, d = 0
}
```

Example 20:

```c
void main() {
    int a = 0;
    int b = 5;
    int c = 8;
    int d = 1;
    int e = 0;
    int f = 5;

    // (a++ && ++b) || (c++ && ++d) || (++e && ++f);
    int g = a++ && ++b || c++ && ++d || ++e && ++f;

/* Output
    a = 1;
    b = 5;
    c = 9;
    d = 2;
    e = 0;
    f = 5;
*/
}
```

---

### Examples with flow control and logical operator

Example 21:

```c
void main() {
    int a = b = 10;
    while(a++ <= 13 && b++ <= 13) {
        printf("%d %d\n", a, b);
    }
    printf("%d %d\n", a + 10, b + 10);
}

// Output
/*
11 11
12 12
13 13
14 14
15 14
25 24
*/
```

Example 21:

```c
void main() {
    int a = b = 10;
    while(a++ <= 13 || b++ <= 13) {
        printf("%d %d\n", a, b);
    }
    printf("%d %d\n", a + 10, b + 10);
}

// Output
/*
11 10
12 10
13 10
14 10
15 11
16 12
17 13
18 14
29 25
*/
```

Example 22:

```c
void main() {
    int a = 1;
    while(a++ >= 1);
    printf("%d", a);
}

// Output
// Infinite loop
```
