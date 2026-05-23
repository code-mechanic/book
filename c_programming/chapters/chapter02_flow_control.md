\newpage

# Flow control

## if Conditional Construct

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

- If there is no `if` body / `else` body then compier will assume the first semicolon as a part of `if` body

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

```c
// Valid program
void main()
{
    ;
}
```

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

- In C programming, Non-zero values are consider as True and zero is consider as False

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

- Interview based program

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
## while loop
## Nested while Loops
## For loop
## Do while Loop
## Break
## Continue
## goto
## Switch
## Summary of Flow Control
