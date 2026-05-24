\newpage

# Flow control

## if Conditional Construct

**Syntax**

```c
// (1)

if( condition ) {
    // (2) if body;
}

// (3)
```

- If condition is `True` then (1), (2) and (3) will execute.  
- If condition is `False` then (1) and (2) will execute.

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

If there is no `if` body / `else` body then compier will assume the first semicolon as a part of `if` body

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

- In C programing `;` alone is valid.  
- The purpose of the `;` is to provide a delay to next instruction.  
- The line that contains only `;` is called Null statement, Empty statement, Dummy statement.

Example 1:

```c
// Valid program
void main()
{
    ;
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
    if(3 > 2);        // Compier will execute this with meaningless
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

In C programming, Non-zero values are consider as True and zero is consider as False

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

**Interview based program**

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

## if-else Conditional Construct

**Syntax**

```c
// (1)

if( condition ) {
    // (2) if body
} else {
    // (3) else body
}

// (4)
```

- If condition is `True` then (1), (2) and (4) will execute.
- If condition is `False` then (1), (3) and (4) will execute.
- Whenever conditon is true do some specific job. When condition is false do some other specific task. At that time we are going for `if-else` conditional construct.
- `else` keyword must be immediatly placed after `if` body.
- If some statement is placed between `if` body and `else` then that is error.

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

- Assignment operation has 2 actions
    - Assign value to variable
    - Replace the expression with assigned value
- Why this behaviour?

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

More analysis

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

## conditional Operator

```c
arg1 ? arg2 : arg3
```

- If the arg1 is True then the entire expression is replaced with arg2.
- If the arg1 is False then the entire expression is replaced with arg3.

Basic syntax

```c
a = 10  ? 20  : 30;  // 20
a = 0   ? 20  : 30;  // 30
a = 1.5 ? 2.5 : 3.5; // 2.5
a = 100 ? 0   : 200; // 0
a = 100 ? 20  : ;    // Compilation error
```

Finding max integers

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

Interview based problems

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

## while loop

Whenever a piece of code is repeated then loops can be used. This reduce code repeat.

```c
while( condition ) {
    // while loop body
}
```

As long as the `condition` is true then while loop body is execute.

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

## Nested while Loops

**Syntax**

```c
while( condition 1 ) {
    while ( condition 2 ) {

    }
}
```

**Simple uscase**

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

## For loop

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

- init, condition and re-init are optional
- two `;` are mandatory

```c
// Valid
for( ; ; ) {

}
```

- Multiple init and re-init statements are allowed.
- Function call can be the part of init and re-int.

**Examples**

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

> If we know number of iteration in advance then use `for` loop  
> - **Example:** To process array elements  
> If we don't know number of iteration in advance then use `while` loop  
> - **Example:** To process linked list elements

## do while Loop

**Syntax**

```c
do
{

    // (1)(3) do body

} while( condition );
//      (2)(4)
```

`while` should immediatly follow after the `do` body.

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
/*This execute the body atlease 1 time irrespective of condition */

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

// Wrong body (or) atleast one statement must be there
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

## Break

If program execution encounter `break` keyword inside loop then it comes out of loop.

**What is purpose?**
    - Whenever we know maximum number of iteration and don't know at which iteration oir functionality success at that time we can go for `break`

> This can be used in loops and `switch`

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

## Continue

This is used to skip the statements inside loops.
`contine` keyword must be inside loops apart from the usage is compilation error.

## goto

Unconditional jump from one point to another point anywnere in same function.

> This cannot take control from one function to another function

- Rules for writing label name is same as variable name.
- If there is a goto statement then label is compulsory
- If there is label, goto is optional.
- We can create loops with help of goto without any loops
- This is possible to execute both `if` and `else` statement.

**What is purpose of goto?**
    - Whenever we deep in loops and need to come out of all loops then `goto` is used.
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

## Switch

- Whenever we want menu/state driven program(i.e N number of options) then `switch` is useful.
- Based on choice, if `case` is matched then go to marched case and execute upto `break` or end of switch case.
- If there is no matched case, then go to `default` case and execute upto `break` or end of default case.
- If there is no `case` and `default` case then come out of `switch`.

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
- Negative case also allowed.

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

- Every `case` value should be constant expression and its result should be unique. No repeated case, float and variables are allowed.

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

// If there is no space between case and integer constant then that is consider
// as label for goto
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

## Summary of Flow Control

+----------------------------+
| - Conditional              |
|     - Selective            |
|         - if               |
|         - if-else          |
|         - ternary operator |
|         - switch           |
|     - Iterative            |
|         - while            |
|         - for              |
|         - do-while         |
| - Unconditional            |
|     - goto                 |
|     - break                |
|     - continue             |
|     - return               |
+----------------------------+
