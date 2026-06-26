# Quiz

## C Expressions

```text
Question 1
Which of the following is the correct order of evaluation for the below expression?
z = x + y * z / 4 % 2 - 1
```

**Options:**

- [A] = * % / + -
- [B] * / % - + =
- [C] * / % + - =
- [D] + * / % - =

**Answer:**

[C] * / % + - =

***

```text
Question 2
Which of the following correctly shows the hierarchy of arithmetic operations in C?
```

**Options:**

- [A] * - / +
- [B] / + * -
- [C] + - / *
- [D] / * + -

**Answer:**

[D] / * + -

***

```text
Question 3
Which of the following are unary operators in C?
1. !
2. sizeof
3. ~
4. &&
```

**Options:**

- [A] 1, 3
- [B] 1, 2, 3
- [C] 1, 2
- [D] 2, 4

**Answer:**

[B] 1, 2, 3

***

```text
Question 4
In which order do the following gets evaluated
1. Relational
2. Arithmetic
3. Logical
4. Assignment
```

**Options:**

- [A] 4321
- [B] 1234
- [C] 3214
- [D] 2134

**Answer:**

[D] 2134

***

```c
/* Question 5
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int x=2, y=70, z;
    z = x!=4 || y == 2;
    printf("z=%d\n", z);
    return 0;
}
```

**Options:**

- [A] z=1
- [B] z=2
- [C] z=0
- [D] z=4

**Answer:**

[A] z=1

***

```c
/* Question 6
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int x=55;
    printf("%d, %d, %d\n", x<=55, x=40, x>=10);
    return 0;
}
```

**Options:**

- [A] 1, 1, 1
- [B] 1, 40, 1
- [C] 1, 55, 1
- [D] 1, 55, 0

**Answer:**

[B] 1, 40, 1

***

```c
/* Question 7
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i=20;
    int j = i + (1, 2, 3, 4, 5);
    printf("%d\n", j);
    return 0;
}
```

**Options:**

- [A] error
- [B] 21
- [C] Garbage value
- [D] 25

**Answer:**

[D] 25

***

```text
Question 8
In the expression a=b=c=50 the order of Assignment is NOT decided by Associativity of operators.
```

**Options:**

- [A] True
- [B] False

**Answer:**

[B] False

***

```c
/* Question 9
 * Will the following code compile
 */
void main()
{
    char not;
    not=!12;
    printf("%d",not);
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

***

```text
Question 10
Which of the following is not logical operator?
```

**Options:**

- [A] ||
- [B] !
- [C] &
- [D] &&

**Answer:**

[C] &

***

```c
/* Question 11
 * What will be the output of the program?
 */
void main()
{
    int i=10;
    i=!i>14;
    printf ("i=%d",i);
}
```

**Options:**

- [A] 2014-10-01 00:00:00
- [B] i=0

**Answer:**

[B] i=0

***

```c
/* Question 12
 * Will the following code compile
 */
main()
{
    int i=-1;
    -i;
    printf("i = %d, -i = %d \n",i,-i);
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

***

```text
Question 13
Which of the following statements should be used to obtain a remainder after dividing 3.5 by 2.5 ?
```

**Options:**

- [A] rem = 3.5 % 2.5;
- [B] rem = modf(3.5, 2.5);
- [C] rem = fmod(3.5, 2.5);
- [D] Remainder cannot be obtain in floating point division.

**Answer:**

[C] rem = fmod(3.5, 2.5);

***

```text
Question 14
Which of the following special symbol allowed in a variable?
```

**Options:**

- [A] # (Hash)
- [B] $ (Dollar)
- [C] _ (underscore)
- [D] * (asterisk)

**Answer:**

[C] _ (underscore)

***

```c
/* Question 15
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int x = 10, y = 20, z = 5, i;
    i = x < y < z;
    printf("%d\n", i);
    return 0;
}
```

**Options:**

- [A] 1
- [B] 0
- [C] Error
- [D] Garbage value

**Answer:**

[A] 1

***

```text
Question 16
Which of the definition is correct?
```

**Options:**

- [A] char int;
- [B] int len;
- [C] int long;
- [D] float double;

**Answer:**

[B] int len;

***

```text
Question 17
Which of the following operations are INCORRECT?
```

**Options:**

- [A] float a = 4.14; a = a%3;
- [B] short int i = 255; j = j;
- [C] long int k = 365l; k = k;
- [D] int i = 35; i = i%5;

**Answer:**

[A] float a = 4.14; a = a%3;

***

```text
Question 18
Associativity has no role to play unless the precedence of operator is same.
```

**Options:**

- [A] False
- [B] True

**Answer:**

[B] True

***

```text
Question 19
Associativity of an operator is either Left to Right or Right to Left.
```

**Options:**

- [A] False
- [B] True

**Answer:**

[B] True

## Flow Control

```c
/* Question 1
 * How many times "Ind Test" is get printed?
 */
#include<stdio.h>
int main()
{
    int x;
    for(x=-1; x<=10; x++)
    {
        if(x < 5)
            continue;
        else
            break;
        printf("Ind Test ");
    }
    return 0;
}
```

**Options:**

- [A] 10 times
- [B] 11 times
- [C] 0 times
- [D] Infinite times

**Answer:**

[C] 0 times

***

```c
/* Question 2
 * How many times the while loop will get executed if a short int is 2 byte wide?
 */
#include<stdio.h>
int main()
{
    int j=1;
    while(j <= 256)
    {
        printf("%c %d\n", j, j);
        j++;
    }
    return 0;
}
```

**Options:**

- [A] Infinite times
- [B] 255 times
- [C] 254 times
- [D] 256 times

**Answer:**

[D] 256 times

***

```text
Question 3
Which of the following cannot be checked in a switch-case statement?
```

**Options:**

- [A] enum
- [B] Float
- [C] Integer
- [D] Character

**Answer:**

[B] Float

***

```c
/* Question 4
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i=0;
    for(; i<=5; i++);
        printf("%d", i);
    return 0;
}
```

**Options:**

- [A] 5
- [B] 6
- [C] 1, 2, 3, 4
- [D] 0, 1, 2, 3, 4, 5

**Answer:**

[B] 6

***

```c
/* Question 5
 * What will be the output of the program?
 */
void main()
{
    int i=400,j=300;
    printf("%d..%d");
}
```

**Options:**

- [A] 0..0
- [B] garbage value garbage value
- [C] Error
- [D] 400..300

**Answer:**

[B] garbage value garbage value

***

```c
/* Question 6
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int a = 50, b = 10, c;
    if(!a >= 400)
        b = 30;
    c = 200;
    printf("b = %d c = %d\n", b, c);
    return 0;
}
```

**Answer:**

b = 10 c = 200

***

```c
/* Question 7
 * What will be the output of the program?
 */
#include<stdio.h>
void main()
{
    int i=1,j=2;
    switch(i)
    {
        case 1: printf("GOOD");
                break;
        case j: printf("BAD");
                break;
    }
}
```

**Options:**

- [A] error
- [B] BAD
- [C] GOOD
- [D] GOODBAD

**Answer:**

[A] error

***

```c
/* Question 8
 * What will be the output of the program?
 */
void main()
{
    int i=0;
    for(;i++;printf("%d",i)) ;
    printf("%d",i);
}
```

**Options:**

- [A] Infinite loop
- [B] error
- [C] 0
- [D] True (or 1)

**Answer:**

[D] True (or 1)

***

```c
/* Question 9
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int x = 3;
    float y = 3.0;
    if(x == y)
        printf("I love you");
    else
        printf("I hate you");
    return 0;
}
```

**Options:**

- [A] I love you
- [B] Unpredictable
- [C] No output
- [D] I hate you

**Answer:**

[A] I love you

***

```c
/* Question 10
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    char ch;
    if(ch = printf(""))
        printf("It matters\n");
    else
        printf("It doesn't matters\n");
    return 0;
}
```

**Options:**

- [A] It matters
- [B] No output
- [C] It doesn't matters
- [D] matters

**Answer:**

[C] It doesn't matters

***

```c
/* Question 11
 * The program is used to check whether the given year is leap or not
 */
void main()
{
    int y;
    scanf("%d",&y); // input given is 2000
    if( (y%4==0 && y%100 != 0) || y%100 == 0 )
        printf("%d is a leap year");
    else
        printf("%d is not a leap year");
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

***

```c
/* Question 12
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int a=0, b=1, c=3;
    *((a) ? &b : &a) = a ? b: c;
    printf("%d, %d, %d\n", a, b, c);
    return 0;
}
```

**Options:**

- [A] 0, 1, 3
- [B] 3, 1, 3
- [C] 1, 3, 1
- [D] 1, 2, 3

**Answer:**

[B] 3, 1, 3

***

```c
/* Question 13
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i = 5;
    while(i-- >= 0)
        printf("%d, ", i);
    i = 5;
    printf("\n");
    while(i-- >= 0)
        printf("%i, ", i);
    while(i-- >= 0)
        printf("%d, ", i);
    return 0;
}
```

**Options:**

```text
- [A] Error
- [B] 5, 4, 3, 2, 1, 0
      5, 4, 3, 2, 1, 0
- [C] 4, 3, 2, 1, 0, -1
      4, 3, 2, 1, 0, -1
- [D] 5, 4, 3, 2, 1, 0
      5, 4, 3, 2, 1, 0
      5, 4, 3, 2, 1, 0
```

**Answer:**

```text
[C] 4, 3, 2, 1, 0, -1
    4, 3, 2, 1, 0, -1
```

***

```c
/* Question 14
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i=3;
    switch(i)
    {
        case 1:
            printf("Hello\n");
        case 2:
            printf("Hi\n");
        case 3:
            printf("Bye\n");
        default:
            continue;
    }
    return 0;
}
```

**Options:**

- [A] No output
- [B] Error: Misplaced continue
- [C] Bye
- [D] Hello Hi

**Answer:**

[B] Error: Misplaced continue

***

```c
/* Question 15
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int x = 1, y = 2;
    if(!(!x) && x)
        printf("x = %d\n", x);
    else
        printf("y = %d\n", y);
    return 0;
}
```

**Options:**

- [A] y = 2
- [B] x = 1
- [C] x = 0

**Answer:**

[B] x = 1

***

```c
/* Question 16
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i=4;
    switch(i)
    {
        default:
            printf("This is default\n");
        case 1:
            printf("This is case 1\n");
        case 2:
            printf("This is case 2\n");
            break;
        case 3:
            printf("This is case 3\n");
    }
    return 0;
}
```

**Options:**

- [A] `This is default \n This is case 1 \n This is case 2`
- [B] `This is case 1 \n This is case 3`
- [C] `This is default`
- [D] `This is case 3 \n This is default`

**Answer:**

[A] `This is default \n This is case 1 \n This is case 2`

***

```c
/* Question 17
 * What will be the output of the program?
 */
void main()
{
    int a = 0;int b = 20;char x =1;char y =10;
    if(a,b,x,y)
        printf("hello");
}
```

**Options:**

- [A] no output
- [B] none of the above
- [C] hello
- [D] error

**Answer:**

[C] hello

***

```c
/* Question 18
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i = 1;
    switch(i)
    {
        printf("Hello\n");
        case 1:
            printf("Hi\n");
            break;
        case 2:
            printf("\nBye\n");
            break;
    }
    return 0;
}
```

**Options:**

- [A] `Hello \n Bye`
- [B] `Hello`
- [C] `Hi \n Bye`
- [D] `Hi`

**Answer:**

[D] `Hi`

***

```c
/* Question 19
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    char j=1;
    while(j < 5)
    {
        printf("%d, ", j);
        j = j+1;
    }
    printf("\n");
    return 0;
}
```

**Options:**

- [A] 1 2 3 ... 127 128 0 1 2 3 ... infinite times
- [B] 1, 2, 3, 4
- [C] 1 2 3 ... 255
- [D] 1 2 3 ... 127

**Answer:**

[B] 1, 2, 3, 4

***

```c
/* Question 20
 * Point out the error, if any in the for loop.
 */
#include<stdio.h>
int main()
{
    int i=1;
    for(;;)
    {
        printf("%d\n", i++);
        if(i>10)
            break;
    }
    return 0;
}
```

**Options:**

- [A] The for loop should be replaced with while loop.
- [B] The two semicolons should be dropped
- [C] No error
- [D] There should be a condition in the for loop

**Answer:**

[C] No error

***

```c
/* Question 21
 * Point out the error, if any in the program.
 */
#include<stdio.h>
int main()
{
    int a = 1000;
    switch(a)
    {
    }
    return 0;
}
```

**Options:**

- [A] Error: No case statement specified
- [B] Error: Infinite loop occurs
- [C] No Error
- [D] Error: No default specified

**Answer:**

[C] No Error

***

```c
/* Question 22
 * Point out the error, if any in the program.
 */
#include<stdio.h>
void main()
{
    int i ;
    i=1;
    switch(i)
    {
        printf("This is c program.");
        case 1:
            printf("Case1");
            break;
        case 2:
            printf("Case2");
            break;
    }
}
```

**Options:**

- [A] No Error and prints "Case1"
- [B] Error: Invalid printf statement after switch statement
- [C] None of above
- [D] Error: No default specified

**Answer:**

[A] No Error and prints "Case1"

***

```c
/* Question 23
 * Point out the error, if any in the while loop.
 */
#include<stdio.h>
int main()
{
    int i=0;
    while()
    {
        printf("%d\n", i++);
        if(i>10)
            break;
    }
    return 0;
}
```

**Options:**

- [A] No error
- [B] There should be at least a semicolon in the while
- [C] The while loop should be replaced with for loop.
- [D] There should be a condition in the while loop

**Answer:**

[D] There should be a condition in the while loop

***

```c
/* Question 24
 * Which of the following errors would be reported by the compiler on compiling the program given below?
 */
#include<stdio.h>
int main()
{
    int a = 4;
    switch(a)
    {
        case 1:
            printf("First");
        case 2:
            printf("Second");
        case 3 + 1:
            printf("Third");
        case 4:
            printf("Final");
            break;
    }
    return 0;
}
```

**Options:**

- [A] Expression as in case 3 + 1 is not allowed
- [B] No error will be reported.
- [C] Duplicate case case 4:
- [D] There is no break statement in each case.

**Answer:**

[C] Duplicate case case 4:

***

```c
/* Question 25
 * Point out the error, if any in the program.
 */
#include<stdio.h>
int main()
{
    int j = 100;
    switch(j)
    {
        case 10:
            printf("Case 1");
        case 20:
            printf("Case 2");
            break;
        case j:
            printf("Case j");
            break;
    }
    return 0;
}
```

**Options:**

- [A] Error: There is no break statement in each case.
- [B] No error will be reported.
- [C] Error: No default value is specified
- [D] Error: Constant expression required at line case j:

**Answer:**

[D] Error: Constant expression required at line case j:

***

```c
/* Question 26
 * Point out the error, if any in the program.
 */
#include<stdio.h>
int main()
{
    int i = 10;
    switch(i)
    {
        case 1:
            printf("Case10");
            break;
        case 1*2+4:
            printf("Case2");
            break;
    }
    return 0;
}
```

**Options:**

- [A] Error: No default specified
- [B] Error: in switch statement
- [C] Error: in case 1*2+4 statement
- [D] No error No output

**Answer:**

[D] No error No output

***

```c
/* Question 27
 * Point out the error, if any in the program.
 */
#include<stdio.h>
int main()
{
    int a = 10, b;
    a >=5 ? b=100: b=200;
    printf("%d\n", b);
    return 0;
}
```

**Options:**

- [A] 200
- [B] Garbage value
- [C] Error: L value required for b
- [D] 100

**Answer:**

[C] Error: L value required for b

***

```c
/* Question 28
 * Which of the following statements are correct about the below program?
 */
#include<stdio.h>
int main()
{
    int i = 10, j = 20;
    if(i = 5) && if(j = 10)
        printf("Have a nice day");
    return 0;
}
```

**Options:**

- [A] Output: Have a nice day
- [B] Error: Expression syntax
- [C] Error: Undeclared identifier if

**Answer:**

[B] Error: Expression syntax

***

```c
/* Question 29
 * Which of the following statements are correct about the below program?
 */
#include<stdio.h>
int main()
{
    int i = 10, j = 15;
    if(i % 2 = j % 3)
        printf("IndiaBIX\n");
    return 0;
}
```

**Options:**

- [A] Error: Expression syntax
- [B] Error: Lvalue required
- [C] Error: Rvalue required
- [D] The Code runs successfully

**Answer:**

[B] Error: Lvalue required

***

```c
/* Question 30
 * Point out the statements which are correct about the program below?
 */
#include<stdio.h>
int main()
{
    char x;
    while(x=0;x<=255;x++)
        printf("ASCII value of %d character %c\n", x, x);
    return 0;
}
```

**Options:**

- [A] Error: x undeclared identifier
- [B] The code generates an infinite loop
- [C] The code prints all ASCII values and its characters
- [D] Error

**Answer:**

[D] Error

***

```c
/* Question 31
 * Which of the following statements are correct about the below program?
 */
#include<stdio.h>
int main()
{
    int i = 0;
    i++;
    if(i++ <= 5)
    {
        printf("Ind Test\n");
        exit();
        main();
    }
    return 0;
}
```

**Options:**

- [A] The compiler reports an error since main() cannot call itself
- [B] The program prints 'Ind Test' 5 times
- [C] The call to main() after exit() doesn't materialize
- [D] The program prints 'Ind Test' one time

**Answer:**

[D] The program prints 'Ind Test' one time

***

```text
Question 32
The way the break is used to take control out of switch can continue to take control of the beginning of the switch?
```

**Options:**

- [A] False
- [B] True

**Answer:**

[A] False

***

```text
Question 33
Can we use a switch statement to switch on strings?
```

**Options:**

- [A] True
- [B] False

**Answer:**

[B] False

***

```text
Question 34
We want to test whether a value lies in the range 1 to 3 or 9 to 11. Can we do this using a switch?
```

**Options:**

- [A] True
- [B] False

**Answer:**

[A] True

***

```c
/* Question 35
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int k, num=30;
    k = (num>5 ? num <=10 ? 100 : 200: 500);
    printf("%d\n", num);
    return 0;
}
```

**Options:**

- [A] 200
- [B] 30
- [C] 500
- [D] 100

**Answer:**

[B] 30

## Increment & Decrement

```c
/* Question 1
 * What will be the output of the program?
 */
main()
{
    int i=-1,j=-1,k=0,l=2,m;
    m = i++ && j++ && k++ || l++;
    printf("%d %d %d %d %d", i, j, k, l, m);
}
```

**Options:**

- [A] -1 -1 0 2 garbage value
- [B] -1 -1 0 2 1
- [C] 0 0 1 3 1
- [D] 0 0 1 2 1

**Answer:**

[C] 0 0 1 3 1

***

```c
/* Question 2
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i=-3, j=2, k=0, m;
    m = ++i && ++j && ++k;
    printf("%d, %d, %d, %d\n", i, j, k, m);
    return 0;
}
```

**Options:**

- [A] 1, 2, 3, 1
- [B] 3, 3, 1, 2
- [C] 2, 3, 1, 2
- [D] -2, 3, 1, 1

**Answer:**

[D] -2, 3, 1, 1

***

```c
/* Question 3
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i=-3, j=2, k=0, m;
    m = ++i || ++j && ++k;
    printf("%d, %d, %d, %d\n", i, j, k, m);
    return 0;
}
```

**Options:**

- [A] 1, 2, 1, 0
- [B] -2, 2, 0, 0
- [C] 2, 2, 0, 1
- [D] -2, 2, 0, 1

**Answer:**

[D] -2, 2, 0, 1

***

```c
/* Question 4
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int x=4, y, z;
    y = --x;
    z = x--;
    printf("%d, %d, %d\n", x, y, z);
    return 0;
}
```

**Options:**

- [A] 4, 3, 3
- [B] 4, 3, 2
- [C] 3, 3, 2
- [D] 2, 3, 3

**Answer:**

[D] 2, 3, 3

***

```c
/* Question 5
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i=4, j=-1, k=0, w, x, y, z;
    w = i || j || k;
    x = i && j && k;
    y = i || j && k;
    z = i && j || k;
    printf("%d, %d, %d, %d\n", w, x, y, z);
    return 0;
}
```

**Options:**

- [A] 1, 1, 0, 1
- [B] 1, 1, 1, 1
- [C] 1, 0, 1, 1
- [D] 1, 0, 0, 1

**Answer:**

[C] 1, 0, 1, 1

***

```c
/* Question 6
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i=-3, j=2, k=0, m;
    m = ++i && ++j || ++k;
    printf("%d, %d, %d, %d\n", i, j, k, m);
    return 0;
}
```

**Options:**

- [A] -3, 2, 0, 1
- [B] -2, 3, 0, 1
- [C] 2, 3, 1, 1
- [D] 1, 2, 0, 1

**Answer:**

[B] -2, 3, 0, 1

***

```text
Question 7
The expression of the right hand side of || operators doesn't get evaluated if the left hand side determines the outcome.
```

**Options:**

- [A] True
- [B] False

**Answer:**

[A] True

***

```c
/* Question 8
 * What will be the output of the program?
 */
main()
{
    int c=- -2;
    printf("%d",c);
}
```

**Options:**

- [A] 0
- [B] Error
- [C] 2
- [D] -2

**Answer:**

[C] 2

***

```c
/* Question 9
 * What will be the output of the program?
 */
void main()
{
    int i =0, j=0;
    if(i && j++)
        printf("%d..%d",i++,j);
    printf("%d..%d",i,j);
}
```

**Options:**

- [A] 1..1
- [B] error
- [C] 0..0
- [D] 0..1

**Answer:**

[C] 0..0

***

```c
/* Question 10
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int x, y, z;
    x=y=z=1;
    z = ++x || ++y && ++z;
    printf("x=%d, y=%d, z=%d\n", x, y, z);
    return 0;
}
```

**Options:**

- [A] x=2, y=1, z=1
- [B] x=2, y=2, z=1
- [C] x=2, y=2, z=2
- [D] x=1, y=2, z=1

**Answer:**

[A] x=2, y=1, z=1

***

```c
/* Question 11
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i=2;
    printf("%d, %d\n", ++i, ++i);
    return 0;
}
```

**Options:**

- [A] 4, 4
- [B] 3, 4
- [C] 4, 3
- [D] Output may vary from compiler to compiler

**Answer:**

[D] Output may vary from compiler to compiler

## Data Types

```text
Question 1
What are the different types of real data type in C ?
```

**Options:**

- [A] float, double, long double
- [B] short int, double, long int,char
- [C] double, long int, float
- [D] float, double, long

**Answer:**

[A] float, double, long double

***

```text
Question 2
What will you do to treat the constant 3.14 as a long double?
```

**Options:**

- [A] use 3.14DL
- [B] use 3.14LF
- [C] use 3.14LD
- [D] use 3.14L

**Answer:**

[D] use 3.14L

***

```c
/* Question 3
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    float fval=7.987;
    printf("%d\n", (int)fval);
    return 0;
}
```

**Options:**

- [A] 7.0
- [B] 0
- [C] 7
- [D] 0.0

**Answer:**

[C] 7

***

```c
/* Question 4
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    printf("%d, %d, %d\n", sizeof(3.14f), sizeof(3.14), sizeof(3.14l));
    return 0;
}
```

**Options:**

- [A] 4, 8, 12
- [B] 4, 4, 4
- [C] 4, 8, 10
- [D] 4, 8, 8

**Answer:**

[C] 4, 8, 10

***

```c
/* Question 5
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    float f=43.20;
    printf("%e, ", f);
    printf("%f, ", f);
    printf("%g", f);
    return 0;
}
```

**Options:**

- [A] 4.3, 43.22, 43.21
- [B] 4.3e, 43.20f, 43.00
- [C] Error
- [D] 4.320000e+01, 43.200001, 43.2

**Answer:**

[D] 4.320000e+01, 43.200001, 43.2

***

```c
/* Question 6
 * What will be the output of the program?
 */
void main()
{
    float me = 1.1;
    double you = 1.1;
    if(me==you)
        printf("I love U");
    else
        printf("I hate U");
}
```

**Options:**

- [A] none of the above
- [B] no output
- [C] I hate U
- [D] I Love U

**Answer:**

[C] I hate U

***

```c
/* Question 7
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    unsigned int i = 65535; /* Assume 2 byte integer*/
    while(i++ >= 0)
        printf("%d",i);
    printf("\n");
    return 0;
}
```

**Options:**

- [A] Infinite loop
- [B] No output
- [C] 0 1 2 ... 65535
- [D] 0 1 2 ... 32767 -32768 -32767 ... 1 0

**Answer:**

[A] Infinite loop

***

```c
/* Question 8
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    float a = 0.7;
    if(0.7 > a)
        printf("Hi if\n");
    else
        printf("Hello else\n");
    return 0;
}
```

**Options:**

- [A] Hi if Hello else
- [B] Hello else
- [C] Hi if
- [D] None of above

**Answer:**

[C] Hi if

***

```text
Question 9
By default a real number is treated as a
```

**Options:**

- [A] double
- [B] far double
- [C] long double
- [D] float

**Answer:**

[A] double

***

```text
Question 10
Which of the following correctly represents a double constant?
```

**Options:**

- [A] 6.68l
- [B] 6.68f
- [C] 6.68
- [D] 6.68LF

**Answer:**

[C] 6.68

***

```text
Question 11
A long double can be used if range of a double is not enough to accommodate a real number.
```

**Options:**

- [A] False
- [B] True

**Answer:**

[B] True

***

```text
Question 12
A float is 4 bytes wide, whereas a double is 8 bytes wide. long double is 10 byte wide
```

**Options:**

- [A] True
- [B] False

**Answer:**

[A] True

***

```text
Question 13
Size of short integer and long integer can be verified using the sizeof() operator.
```

**Options:**

- [A] True
- [B] False

**Answer:**

[A] True

***

```text
Question 14
Range of double is -1.7e-308 to 1.7e+308
```

**Options:**

- [A] True
- [B] False

**Answer:**

[A] True

***

```text
Question 15
Range of float is -2.25e-38 to 2.25e+38
```

**Options:**

- [A] False
- [B] True

**Answer:**

[B] True

***

```text
Question 16
Size of short integer and long integer would vary from one platform to another.
```

**Options:**

- [A] True
- [B] False

**Answer:**

[B] False

## Bitwise Operators

```text
Question 1
In which number system can the binary number 011111000101 be easily converted to?
```

**Options:**

- [A] Decimal system
- [B] No need to convert
- [C] Octal system
- [D] Hexadecimal system

**Answer:**

[D] Hexadecimal system

***

```text
Question 2
Which bitwise operator is suitable for turning off a particular bit in a number?
```

**Options:**

- [A] & operator
- [B] && operator
- [C] || operator
- [D] ! operator

**Answer:**

[A] & operator

***

```c
/* Question 3
 * Assunming, integer is 2 byte, What will be the output of the
 * program?
 */
#include<stdio.h>
int main()
{
    printf("%x\n", -1>>1);
    return 0;
}
```

**Options:**

- [A] ffff
- [B] 0000
- [C] 0fff
- [D] fff0

**Answer:**

[A] ffff

***

```c
/* Question 4
 * If an unsigned int is 2 bytes wide then, What will be the output
 * of the program ?
 */
#include<stdio.h>
int main()
{
    unsigned int m = 32;
    printf("%x\n", ~m);
    return 0;
}
```

**Options:**

- [A] 0000
- [B] ffff
- [C] ffdf
- [D] ddfd

**Answer:**

[C] ffdf

***

```c
/* Question 5
 * If an unsigned int is 2 bytes wide then, What will be the output
 * of the program ?
 */
#include<stdio.h>
int main()
{
    unsigned int a=0xffff;
    ~a;
    printf("%x\n", a);
    return 0;
}
```

**Options:**

- [A] ffff
- [B] 00ff
- [C] ddfd
- [D] 0000

**Answer:**

[A] ffff

***

```c
/* Question 6
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    unsigned char i = 0x80;
    printf("%d\n", i<<1);
    return 0;
}
```

**Options:**

- [A] 80
- [B] 0
- [C] 256
- [D] 100

**Answer:**

[C] 256

***

```c
/* Question 7
 * Which of the following statements are correct about the program?
 */
#include<stdio.h>
int main()
{
    unsigned int num;
    int c=0;
    scanf("%u", &num);
    for(;num;num>>=1)
    {
        if(num & 1)
            c++;
    }
    printf("%d", c);
    return 0;
}
```

**Options:**

- [A] It counts the number of bits that are ON (1) in the number num.
- [B] It sets all bits in the number num to 1
- [C] It counts the number of bits that are OFF (0) in the number num
- [D] Error

**Answer:**

[A] It counts the number of bits that are ON (1) in the number num.

***

```c
/* Question 8
 * Assunming, integer is 2 byte, What will be the output of the
 * program?
 */
#include<stdio.h>
int main()
{
    printf("%x\n", -2<<2);
    return 0;
}
```

**Options:**

- [A] fff8
- [B] 0
- [C] ffff
- [D] Error

**Answer:**

[A] fff8

***

```c
/* Question 9
 * What will be the output of the program?
 */
void main()
{
    printf("%x",-1<<4);
}
```

**Options:**

- [A] fff0
- [B] -1
- [C] fff0
- [D] ffff

**Answer:**

[C] fff0

## Functions

```text
Question 1
The keyword used to transfer control from a function back to the calling function is
```

**Options:**

- [A] go back
- [B] switch
- [C] return
- [D] goto

**Answer:**

[C] return

***

```c
/* Question 2
 * What will be the output of the program?
 */
void main()
{
    static int var = 5;
    printf("%d ",var--);
    if(var)
        main();
}
```

**Options:**

- [A] infinite loop
- [B] 5 5 5 5 5
- [C] 5 4 3 2 1
- [D] 0 0 0 0 0

**Answer:**

[C] 5 4 3 2 1

***

```c
/* Question 3
 * Will the following code compile
 */
void main()
{
    extern out;
    printf("%d", out);
}
int out=100;
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

***

```c
/* Question 4
 * Will the following code compile
 */
main()
{
    show();
}
void show()
{
    printf("I'm the greatest");
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[B] No

***

```c
/* Question 5
 * How many times the program will print "Ind Test" ?
 */
#include<stdio.h>
int main()
{
    printf("Ind Test");
    main();
    return 0;
}
```

**Options:**

- [A] 65535 times
- [B] Until stack overflow error occurs
- [C] Infinite times
- [D] 32767 times

**Answer:**

[B] Until stack overflow error occurs

***

```c
/* Question 6
 * Guess the output of the program
 */
void main()
{
    printf("%d", out);
}
int out=100;
```

**Options:**

- [A] Compilation Error
- [B] Garbage value
- [C] 100
- [D] Linker error

**Answer:**

[A] Compilation Error

***

```c
/* Question 7
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int fun();
    int i;
    i = fun();
    printf("%d\n", i);
    return 0;
}
int fun()
{
    return 19;
}
```

**Options:**

- [A] Garbage value
- [B] 0 (Zero)
- [C] No output
- [D] 19

**Answer:**

[D] 19

***

```c
/* Question 8
 * Will the following code compile
 */
void main()
{
    main();
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

***

```c
/* Question 9
 * What will be the output of the program?
 */
int i=10;
void main()
{
    extern int i;
    {
        int i=20;
        {
            unsigned i=30;
            printf("%d,",i);
        }
        printf("%d,",i);
    }
    printf("%d",i);
}
```

**Options:**

- [A] 20 20 20
- [B] 10 20 30
- [C] 10 10 10
- [D] 30 20 10

**Answer:**

[D] 30 20 10

***

```c
/* Question 10
 * What will be the output of the program?
 */
#include<stdio.h>
int i;
int main()
{
    while(i)
    {
        fun();
        main();
    }
    printf("Hello\n");
    return 0;
}
int fun()
{
    printf("Hi");
}
```

**Options:**

- [A] Hi Hello
- [B] Infinite loop
- [C] Hello
- [D] No output

**Answer:**

[C] Hello

***

```c
/* Question 11
 * What will be the output of the program?
 */
#include<stdio.h>
int reverse(int);
int main()
{
    int no=5;
    reverse(no);
    return 0;
}
int reverse(int no)
{
    if(no == 0)
        return 0;
    else
        printf("%d,", no);
    reverse(no--);
}
```

**Options:**

- [A] Infinite loop
- [B] Print 5, 4, 3, 2, 1, 0
- [C] Print 5, 4, 3, 2, 1
- [D] Print 1, 2, 3, 4, 5

**Answer:**

[A] Infinite loop

***

```c
/* Question 12
 * Will the following code compile
 */
void main()
{
    int i=_1_abc(10);
    printf("%d\n",--i);
}
int _1_abc(int i)
{
    return(i++);
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

***

```c
/* Question 13
 * What will be the output of the program?
 */
#include<stdio.h>
int sumdig(int);
int main()
{
    int a, b;
    a = sumdig(123);
    b = sumdig(123);
    printf("%d, %d\n", a, b);
    return 0;
}
int sumdig(int n)
{
    int s, d;
    if(n!=0)
    {
        d = n%10;
        n = n/10;
        s = d+sumdig(n);
    }
    else
        return 0;
    return s;
}
```

**Options:**

- [A] 12, 12
- [B] 4, 4
- [C] 3, 3
- [D] 6, 6

**Answer:**

[D] 6, 6

***

```c
/* Question 14
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i=1;
    if(!i)
        printf("Ind Test");
    else
    {
        i=0;
        printf("C-Program");
        main();
    }
    return 0;
}
```

**Options:**

- [A] prints "C-Program, Ind Test " infinitely
- [B] prints "C-Program" infinitely
- [C] Error: main() should not inside else statement
- [D] prints " Ind Test, C-Program" infinitely

**Answer:**

[B] prints "C-Program" infinitely

***

```c
/* Question 15
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int addmult(int ii, int jj);
    int i=3, j=4, k, l;
    k = addmult(i, j);
    l = addmult(i, j);
    printf("%d %d\n", k, l);
    return 0;
}
int addmult(int ii, int jj)
{
    int kk, ll;
    kk = ii + jj;
    ll = ii * jj;
    return (kk, ll);
}
```

**Options:**

- [A] 7 12
- [B] None of above
- [C] No output
- [D] 2021-12-12 00:00:00

**Answer:**

[D] 2021-12-12 00:00:00 *(Note: The quiz platform has erroneously formatted the true answer '12 12' as a date).*

***

```c
/* Question 16
 * What will be the output of the program?
 */
int i;
int fun1(int);
int fun2(int);
int main()
{
    extern int j;
    int i=3;
    fun1(i);
    printf("%d,", i);
    fun2(i);
    printf("%d", i);
    return 0;
}
int fun1(int j)
{
    printf("%d,", ++j);
    return 0;
}
int fun2(int i)
{
    printf("%d,", ++i);
    return 0;
}
int j=1;
```

**Options:**

- [A] 3, 4, 4, 3
- [B] 3, 3, 4, 4
- [C] 4, 3, 4, 3
- [D] 3, 4, 3, 4

**Answer:**

[C] 4, 3, 4, 3

***

```c
/* Question 17
 * What will be the output of the program?
 */
#include<stdio.h>
int func1(int);
int main()
{
    int k=35;
    k = func1(k=func1(k=func1(k)));
    printf("k=%d\n", k);
    return 0;
}
int func1(int k)
{
    k++;
    return k;
}
```

**Options:**

- [A] k=38
- [B] k=37
- [C] k=35
- [D] k=36

**Answer:**

[A] k=38

***

```c
/* Question 18
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int fun(int);
    int i=3;
    fun(i=fun(fun(i)));
    printf("%d\n", i);
    return 0;
}
fun(int i)
{
    i++;
    return i;
}
```

**Options:**

- [A] 5
- [B] Garbage value
- [C] 4
- [D] Error

**Answer:**

[A] 5

***

```c
/* Question 19
 * Point out the error in the program
 */
f(int a, int b)
{
    int a;
    a = 20;
    return a;
}
```

**Options:**

- [A] The function should be defined as int f(int a, int b)
- [B] Missing parenthesis in return statement
- [C] Redeclaration of a
- [D] None of above

**Answer:**

[C] Redeclaration of a

***

```c
/* Question 20
 * Which of the following statements are correct about the program?
 */
#include<stdio.h>
int main()
{
    printf("%p\n", main());
    return 0;
}
```

**Options:**

- [A] No Error and print nothing
- [B] Runs infinitely without printing anything
- [C] It prints garbage values infinitely
- [D] Error: main() cannot be called inside printf()

**Answer:**

[B] Runs infinitely without printing anything

***

```c
/* Question 21
 * There is a error in the below program. Which statement will you add to remove it?
 */
#include<stdio.h>
int main()
{
    int a;
    a = f(10, 3.14);
    printf("%d\n", a);
    return 0;
}
float f(int aa, float bb)
{
    return ((float)aa + bb);
}
```

**Options:**

- [A] Add prototype: float f(bb, aa)
- [B] Add prototype: float f(aa, bb)
- [C] Add prototype: float f(float, int)
- [D] Add prototype: float f(int, float)

**Answer:**

[D] Add prototype: float f(int, float)

***

```c
/* Question 22
 * Which of the following statements are correct about the function?
 */
long fun(int num)
{
    int i;
    long f=1;
    for(i=1; i<=num; i++)
        f = f * i;
    return f;
}
```

**Options:**

- [A] The function calculates the value of 1 raised to power num
- [B] The function calculates the square root of an integer
- [C] None of above
- [D] The function calculates the factorial value of an integer

**Answer:**

[D] The function calculates the factorial value of an integer

***

```text
Question 23
A function cannot be defined inside another function
```

**Options:**

- [A] False
- [B] True

**Answer:**

[B] True

***

```text
Question 24
Functions cannot return more than one value at a time
```

**Options:**

- [A] False
- [B] True

**Answer:**

[B] True

***

```text
Question 25
If return type for a function is not specified, it defaults to int
```

**Options:**

- [A] True
- [B] False

**Answer:**

[A] True

***

```text
Question 26
In C all functions except main() can be called recursively
```

**Options:**

- [A] False
- [B] True

**Answer:**

[A] False

***

```text
Question 27
Functions can be called either by value or reference
```

**Options:**

- [A] False
- [B] True

**Answer:**

[B] True

***

```text
Question 28
Names of functions in two different files linked together must be unique
```

**Options:**

- [A] False
- [B] True

**Answer:**

[B] True

***

```text
Question 29
A function may have any number of return statements each returning different values.
```

**Options:**

- [A] True
- [B] False

**Answer:**

[A] True

***

```c
/* Question 30
 * The program won't compile
 */
void main()
{
    clrscr();
}
clrscr();
```

**Options:**

- [A] False
- [B] True

**Answer:**

[A] False

***

```c
/* Question 31
 * What is the output of the program
 */
#include<stdio.h>
int main()
{
    extern int fun(float);
    int a;
    a = fun(3.14);
    printf("%d\n", a);
    return 0;
}
int fun(aa)
float aa;
{
    return ((int)aa);
}
```

**Options:**

- [A] 3
- [B] 0
- [C] 3.14
- [D] Error

**Answer:**

[D] Error

***

```c
/* Question 32
 * Point out the error in the following program.
 */
#include<stdio.h>
int main()
{
    display();
    return 0;
}
void display()
{
    printf("Disp fun");
}
```

**Options:**

- [A] None of these
- [B] No error
- [C] Compilation error: Type mismatch in redeclaration of function display() or Prototype missing
- [D] Disp fun

**Answer:**

[C] Compilation error: Type mismatch in redeclaration of function display() or Prototype missing

***

```c
/* Question 33
 * Point out the error in the following program.
 */
#include<stdio.h>
int main()
{
    int (*p)() = fun;
    (*p)();
    return 0;
}
int fun()
{
    printf("Ind Test\n");
    return 0;
}
```

**Options:**

- [A] Error: in int(*p)() = fun;
- [B] Error: fun() prototype not defined
- [C] None of these
- [D] No error

**Answer:**

[B] Error: fun() prototype not defined

***

```c
/* Question 34
 * Will the following code compile?
 */
void main()
{
    int i=1;
    while (i<=5)
    {
        printf("%d",i);
        if (i>2)
            goto here;
        i++;
    }
}
fun()
{
    here:
        printf("PP");
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[B] No

***

```c
/* Question 35
 * Will the following code compile
 */
void main()
{
    int i;
    printf("%d",scanf("%d",&i)); // value 10 is given as input
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

***

```text
Question 36
What are the types of linkages?
```

**Options:**

- [A] External, Internal and None
- [B] External and None
- [C] Internal
- [D] Internal and External

**Answer:**

[A] External, Internal and None

***

```c
/* Question 37
 * Is there any difference between following declarations?
 * 1: extern int f1();
 * 2: int f1();
 */
```

**Options:**

- [A] Both are identical
- [B] None of these
- [C] No difference, except extern int f1(); is probably in another file
- [D] int f1(); is overrided with extern int f1();

**Answer:**

[C] No difference, except extern int f1(); is probably in another file

***

```c
/* Question 38
 * Is the following statement a declaration or definition?
 * extern int i;
 */
```

**Options:**

- [A] Definition
- [B] Declaration
- [C] Definition &Defination
- [D] Function

**Answer:**

[B] Declaration

***

```c
/* Question 39
 * Identify which of the following are declarations
 * 1: extern int exe;
 * 2: void square ( float x ) { ... }
 * 3: double pow(double, double);
 */
```

**Options:**

- [A] 1 and 3
- [B] 2003-01-02 00:00:00

**Answer:**

[A] 1 and 3 *(Note: The quiz platform has erroneously formatted one option as a date).*

***

```c
/* Question 40
 * In the following program where is the variable a getting defined and where it is getting declared?
 */
#include<stdio.h>
int main()
{
    extern int a;
    printf("%d\n", a);
    return 0;
}
int a=10;
```

**Options:**

- [A] a is declared, a is not defined
- [B] extern int a is declaration, int a = 10 is the definition
- [C] int a = 10 is definition, a is not defined
- [D] int a = 10 is declaration, extern int a is the definition

**Answer:**

[B] extern int a is declaration, int a = 10 is the definition

***

```c
/* Question 41
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    extern int i;
    i = 20;
    printf("%d\n", i);
    return 0;
}
```

**Options:**

- [A] Linker Error : undefined symbol i
- [B] 20
- [C] Garbage value
- [D] Compiler error

**Answer:**

[A] Linker Error : undefined symbol i

***

```c
/* Question 42
 * What will be the output of the program?
 */
#include<stdio.h>
int X=10;
int main()
{
    int X=20;
    printf("%d\n", X);
    return 0;
}
```

**Options:**

- [A] 20
- [B] Error due to conflict between local and global variable
- [C] 0
- [D] 10

**Answer:**

[A] 20

***

```c
/* Question 43
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int X=40;
    {
        int X=20;
        printf("%d ", X);
    }
    printf("%d\n", X);
    return 0;
}
```

**Options:**

- [A] 20 20
- [B] Error
- [C] 40 40
- [D] 20 40

**Answer:**

[D] 20 40

***

```text
Question 44
If the definition of the external variable occurs in the source file before its use in a particular function, then there is no need for an extern declaration in the function.
```

**Options:**

- [A] True
- [B] False

**Answer:**

[A] True

***

```text
Question 45
Suppose a program is divided into three files f1, f2 and f3, and a variable is defined in the file f1 but used in files f2 and f3. In such a case would we need the extern declaration for the variables in the files f2 and f3?
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[B] Yes

***

```text
Question 46
Global variable are available to all functions. Does there exist a mechanism by way of which it available to some and not to others.
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[A] No

***

```text
Question 47
Is it true that a global variable may have several declarations, but only one definition?
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[B] Yes

***

```text
Question 48
Is it true that a function may have several declarations, but only one definition?
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[B] Yes

***

```c
/* Question 49
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int i;
    i = printf("How r u\n");
    i = printf("%d\n", i);
    printf("%d\n", i);
    return 0;
}
```

**Options:**

- [A] `How r u \n 8 \n 2`
- [B] `Error: cannot assign printf to variable`
- [C] `How r u \n 1 \n 1`
- [D] `How r u \n 7 \n 2`

**Answer:**

[A] `How r u \n 8 \n 2`

***

```c
/* Question 50
 * What will be the output of the program?
 */
#include<stdio.h>
#include<stdlib.h>
int main()
{
    char *i = "55.555";
    int result1 = 10;
    float result2 = 11.111;
    result1 = result1+atoi(i);
    result2 = result2+atof(i);
    printf("%d, %f", result1, result2);
    return 0;
}
```

**Options:**

- [A] 55, 55
- [B] 66, 66.666000
- [C] 65, 66.666000
- [D] 55, 55.555

**Answer:**

[C] 65, 66.666000

## Pointers

```c
/* Question 1
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    int x=30, *y, *z;
    y=&x; /* Assume address of x is 500 and integer is 4 byte size */
    
    z=y;
    *y++=*z++;
    x++;
    printf("x=%d, y=%d, z=%d\n", x, y, z);
    return 0;
}
```

**Options:**

- [A] x=31, y=504, z=504
- [B] x=31, y=502, z=502
- [C] x=31, y=500, z=500
- [D] x=31, y=498, z=498

**Answer:**

[A] x=31, y=504, z=504

***

```c
/* Question 2
 * What will be the output of the program If the integer is 4 bytes long?
 */
#include<stdio.h>
int main()
{
    int ***r, **q, *p, i=8;
    p = &i;
    q = &p;
    r = &q;
    printf("%d, %d, %d\n", *p, **q, ***r);
    return 0;
}
```

**Options:**

- [A] 8, 8, 8
- [B] 4000, 4002, 4004
- [C] 4000, 4004, 4008
- [D] 4000, 4008, 4016

**Answer:**

[A] 8, 8, 8

***

```c
/* Question 3
 * Assume 16 - bit:
 */
void main()
{
    char *p;
    printf("%d %d ",sizeof(*p),sizeof(p));
}
```

**Options:**

- [A] 2 2
- [B] 1 1
- [C] 1 2
- [D] error

**Answer:**

[C] 1 2

***

```c
/* Question 4
 * What will be the output of the program ?
 */
#include<stdio.h>
void fun(void *p);
int i=100;
int main()
{
    void *vptr;
    vptr = &i;
    fun(vptr);
    return 0;
}
void fun(void *p)
{
    int **q;
    q = (int**)&p;
    printf("%d\n", **q);
}
```

**Options:**

- [A] Error: cannot convert from void** to int**
- [B] 0
- [C] 100
- [D] Garbage value

**Answer:**

[C] 100

***

```c
/* Question 5
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char *str;
    str = "%d\n";
    str++;
    str++;
    printf(str-2, 3000);
    return 0;
}
```

**Options:**

- [A] 3
- [B] 30
- [C] No output
- [D] 3000

**Answer:**

[D] 3000

***

```c
/* Question 6
 * What will be the output of the program?
 */
void main()
{
    int *j;
    {
        int i=10;
        j=&i;
    }
    printf("%d",*j);
}
```

**Options:**

- [A] Error
- [B] Garbage Value
- [C] 0
- [D] 10

**Answer:**

[D] 10

***

```c
/* Question 7
 * Will the following code compile?
 */
void main()
{
    char *cptr,c;
    void *vptr,v;
    c=10; v=0;
    cptr=&c; vptr=&v;
    printf("%c%v",c,v);
}
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[A] No

***

```c
/* Question 8
 * Assume int is of 2 bytes, long is of 4 bytes
 */
void main()
{
    char *p;
    int *q;
    long *r;
    p=q=r=0;
    p++;
    q++;
    r++;
    printf("%p...%p...%p",p,q,r);
}
```

**Options:**

- [A] 0001...0001...0001
- [B] 0004...0004...0004
- [C] 0001...0002...0004
- [D] 0002...0002...0002

**Answer:**

[C] 0001...0002...0004

***

```c
/* Question 9
 * What will be the output of the program ?
 */
#include<stdio.h>
power(int**);
int main()
{
    int a=6, *aa; /* Address od 'a' is 1000 */
    aa = &a;
    a = power(&aa);
    printf("%d\n", a);
    return 0;
}
power(int **ptr)
{
    int b;
    b = **ptr***ptr;
    return (b);
}
```

**Options:**

- [A] Garbage value
- [B] 36
- [C] 216
- [D] 6

**Answer:**

[B] 36

***

```text
Question 10
Which of the following statements correctly declare a function that 
receives a pointer to pointer to a pointer to a float and returns a pointer 
to a pointer to a pointer to a pointer to a float?
```

**Options:**

- [A] float **fun(float***);
- [B] float ****fun(float***);
- [C] float *fun(float**);
- [D] float fun(float***);

**Answer:**

[B] float ****fun(float***);

***

```c
/* Question 11
 * Which of the statements is correct about the program?
 */
#include<stdio.h>
int main()
{
    int i=10;
    int *j=&i;
    return 0;
}
```

**Options:**

- [A] j is a pointer to a pointer to an int and stores address of i
- [B] j and i are pointers to an int
- [C] j is a pointer to an int and stores address of i
- [D] i is a pointer to an int and stores address of j

**Answer:**

[C] j is a pointer to an int and stores address of i

***

```c
/* Question 12
 * In the following program add a statement in the function fun() 
 * such that address of a gets stored in j?
 */
#include<stdio.h>
int main()
{
    int *j;
    void fun(int**);
    fun(&j);
    return 0;
}
void fun(int **k)
{
    int a=10;
    /* Add a statement here */
}
```

**Options:**

- [A] **k=a;
- [B] k=&a;
- [C] &k=*a;
- [D] *k=&a;

**Answer:**

[D] *k=&a;

***

```text
Question 13
Are the expression *ptr++ and ++*ptr same?
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[B] No

***

```c
/* Question 14
 * The following program reports an error on compilation.
 */
#include<stdio.h>
int main()
{
    float i=100, *j;
    void *k;
    k=&i;
    j=k;
    printf("%f\n", *j);
    return 0;
}
```

**Options:**

- [A] True
- [B] False

**Answer:**

[B] False

***

```text
Question 15
Is there any difference between the following two statements?
char *a=0;
char *b=NULL;
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[B] No

***

```text
Question 16
Is the NULL pointer same as an uninitialised pointer?
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[A] No

***

```c
/* Question 17
 * Which statement will you add in the following program to work it correctly?
 */
#include<stdio.h>
int main()
{
    printf("%f\n", log(36.0));
    return 0;
}
```

**Options:**

- [A] #include<conio.h>
- [B] #include<math.h>
- [C] #include<stdlib.h>
- [D] #include<dos.h>

**Answer:**

[B] #include<math.h>

***

```c
/* Question 18
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    float *p;
    printf("%d\n", sizeof(p));
    return 0;
}
```

**Options:**

- [A] 2 in 16bit compiler, 2 in 32bit compiler
- [B] 2 in 16bit compiler, 4 in 32bit compiler
- [C] 4 in 16bit compiler, 4 in 32bit compiler
- [D] 4 in 16bit compiler, 2 in 32bit compiler

**Answer:**

[B] 2 in 16bit compiler, 4 in 32bit compiler

***

```c
/* Question 19
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    printf("%f\n", sqrt(49.0));
    return 0;
}
```

**Options:**

- [A] 7.000000
- [B] 7
- [C] Error: Prototype sqrt() not found
- [D] 7.0

**Answer:**

[A] 7.000000

***

```c
/* Question 20
 * What will be the output of the program?
 */
#include<stdio.h>
#include<math.h>
int main()
{
    float n=1.54;
    printf("%f, %f\n", ceil(n), floor(n));
    return 0;
}
```

**Options:**

- [A] 1.500000, 1.500000
- [B] 2.000000, 1.000000
- [C] 1.550000, 2.000000
- [D] 1.000000, 2.000000

**Answer:**

[B] 2.000000, 1.000000

***

```text
Question 21
How would you round off a value from 2.75 to 3.0?
```

**Options:**

- [A] floor(2.75)
- [B] ceil(2.75)
- [C] roundup(2.75)
- [D] roundto(2.75)

**Answer:**

[B] ceil(2.75)

***

```c
/* Question 22
 * Point out the error in the following program.
 */
#include<stdio.h>
int main()
{
    void v = 0;
    printf("%d", v);
    return 0;
}
```

**Options:**

- [A] None of these
- [B] No error
- [C] Error: Declaration syntax error 'v' (or) Size of v is unknown or zero
- [D] Program terminates abnormally

**Answer:**

[C] Error: Declaration syntax error 'v' (or) Size of v is unknown or zero

***

```c
/* Question 23
 * What will be the output of the program?
 */
#include<stdio.h>
void fun(int*, int*);
int main()
{
    int i=5, j=2;
    fun(&i, &j);
    printf("%d, %d", i, j);
    return 0;
}
void fun(int *i, int *j)
{
    *i = *i**i;
    *j = *j**j;
}
```

**Options:**

- [A] 2, 5
- [B] 5, 2
- [C] 10, 4
- [D] 25, 4

**Answer:**

[D] 25, 4

## Arrays

```c
/* Question 1
 * Answer these questions to test your course knowledge
 */
void main()
{
    int c[ ]={2.8,3.4,4,6,7,5};
    int j,*p=c,*q=c;
    for(j=0;j<5;j++)
    {
        printf(" %d ",*c);
        ++q;
    }
    for(j=0;j<5;j++)
    {
        printf(" %d ",*p);
        ++p;
    }
}
```

**Options:**

- [A] error
- [B] garbage value
- [C] 2 3 4 6 5 5 5 5 5 5
- [D] 2 2 2 2 2 2 3 4 6 5

**Answer:**

[D] 2 2 2 2 2 2 3 4 6 5

***

```text
Question 2
What does the following declaration mean?
int (*ptr);
```

**Options:**

- [A] ptr is array of pointers to 10 integers
- [B] ptr is an pointer to array
- [C] ptr is a pointer to an array of 10 integers
- [D] ptr is an array of 10 integers

**Answer:**

[C] ptr is a pointer to an array of 10 integers

***

```text
Question 3
In C, if you pass an array as an argument to a function, what 
actually gets passed?
```

**Options:**

- [A] Address of the last element of array
- [B] First element of the array
- [C] Base address of the array
- [D] Value of elements in array

**Answer:**

[C] Base address of the array

***

```c
/* Question 4
 * What will be the output of the program?
 */
void main( )
{
    int a[ ] = {10,20,30,40,50},j,*p;
    for(j=0; j<5; j++)
    {
        printf("%d" ,*a);
        a++;
    }
    p = a;
    for(j=0; j<5; j++)
    {
        printf("%d " ,*p);
        p++;
    }
}
```

**Options:**

- [A] None of the above.
- [B] 10 20 30 40 50 10 20 30 40 50
- [C] 10 20 30 40 50
- [D] Error

**Answer:**

[D] Error

***

```c
/* Question 5
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    int a = {5, 1, 15, 20, 25};
    int i, j, m;
    i = ++a;
    j = a++;
    m = a[i++];
    printf("%d, %d, %d", i, j, m);
    return 0;
}
```

**Options:**

- [A] 2, 1, 15
- [B] 2, 3, 20
- [C] 3, 2, 15
- [D] 1, 2, 5

**Answer:**

[C] 3, 2, 15

***

```c
/* Question 6
 * What will be the output of the program if the array begins at 
 * 65486 and each integer occupies 2 bytes?
 */
#include<stdio.h>
int main()
{
    int arr[] = {12, 14, 15, 23, 45};
    printf("%u, %u\n", arr+1, &arr+1);
    return 0;
}
```

**Options:**

- [A] 65488, 65496
- [B] 64490, 65498
- [C] 65488, 65490
- [D] 64490, 65492

**Answer:**

[A] 65488, 65496

***

```c
/* Question 7
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    static int a = {1, 2, 3, 4};
    int i, j;
    static int *p[] = {(int*)a, (int*)a+1, (int*)a+2};
    for(i=0; i<2; i++)
    {
        for(j=0; j<2; j++)
        {
            printf("%d, %d, %d, %d\n", *(*(p+i)+j), *(*(j+p)+i), 
                   *(*(i+p)+j), *(*(p+j)+i));
        }
    }
    return 0;
}
```

**Options:**

- [A] `1, 2, 3, 4 \n 2, 3, 4, 1 \n 3, 4, 1, 2 \n 4, 1, 2, 3`
- [B] `1, 1, 1, 1 \n 2, 2, 2, 2 \n 2, 2, 2, 2 \n 3, 3, 3, 3`
- [C] `1, 2, 1, 2 \n 2, 3, 2, 3 \n 3, 4, 3, 4 \n 4, 2, 4, 2`
- [D] `1, 1, 1, 1 \n 2, 3, 2, 3 \n 3, 2, 3, 2 \n 4, 4, 4, 4`

**Answer:**

[B] `1, 1, 1, 1 \n 2, 2, 2, 2 \n 2, 2, 2, 2 \n 3, 3, 3, 3`

***

```c
/* Question 8
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    static int arr[] = {0, 1, 2, 3, 4};
    int *p[] = {arr, arr+1, arr+2, arr+3, arr+4};
    int **ptr=p;
    ptr++;
    printf("%d, %d, %d\n", ptr-p, *ptr-arr, **ptr);
    *ptr++;
    printf("%d, %d, %d\n", ptr-p, *ptr-arr, **ptr);
    *++ptr;
    printf("%d, %d, %d\n", ptr-p, *ptr-arr, **ptr);
    ++*ptr;
    printf("%d, %d, %d\n", ptr-p, *ptr-arr, **ptr);
    return 0;
}
```

**Options:**

- [A] `1, 1, 2 \n 2, 2, 3 \n 3, 3, 4 \n 4, 4, 1`
- [B] `0, 0, 0 \n 1, 1, 1 \n 2, 2, 2 \n 3, 3, 3`
- [C] `0, 1, 2 \n 1, 2, 3 \n 2, 3, 4 \n 3, 4, 5`
- [D] `1, 1, 1 \n 2, 2, 2 \n 3, 3, 3 \n 3, 4, 4`

**Answer:**

[D] `1, 1, 1 \n 2, 2, 2 \n 3, 3, 3 \n 3, 4, 4`

***

```c
/* Question 9
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    int arr={100};
    printf("%d\n", 0[arr]);
    return 0;
}
```

**Options:**

- [A] 1
- [B] 6
- [C] 100
- [D] 0

**Answer:**

[C] 100

***

```c
/* Question 10
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    float arr[] = {1.4, 0.3, 4.50, 6.70};
    printf("%d\n", sizeof(arr)/sizeof(arr));
    return 0;
}
```

**Options:**

- [A] 2002-08-10 00:00:00
- [B] 4

**Answer:**

[B] 4

***

```c
/* Question 11
 * What will be the output of the program if the array begins 1200 in
 * memory?
 */
#include<stdio.h>
int main()
{
    int a[]={2, 3, 4, 1, 6};
    printf("%u, %u, %u\n", a, &a, &a);
    return 0;
}
```

**Options:**

- [A] 1200, 1200, 1200
- [B] 1200, 1204, 1208
- [C] 1200, 1202, 1200
- [D] 1200, 1202, 1204

**Answer:**

[A] 1200, 1200, 1200

***

```c
/* Question 12
 * Which of the following is correct way to define the function fun()
 * in the below program?
 */
#include<stdio.h>
int main()
{
    int a;
    fun(a);
    return 0;
}
```

**Options:**

- [A] void fun(int *p) { }
- [B] void fun(int (*p)) { }
- [C] void fun(int *p[]) { }
- [D] void fun(int *p) { }

**Answer:**

[B] void fun(int (*p)) { }

***

```text
Question 13
Which of the following statements are correct about 6 used in the 
program?
int num;
num=21;
```

**Options:**

- [A] In the first statement 6 specifies a particular element whereas in the second statement it specifies a type.
- [B] In the first statement 6 specifies a array size whereas in the second statement it specifies a particular element of array.
- [C] In both the statement 6 specifies array size
- [D] In the first statement 6 specifies a particular element whereas in the second statement 6 specifies a array size

**Answer:**

[B] In the first statement 6 specifies a array size whereas in the second statement it specifies a particular element of array.

***

```text
Question 14
Which of the following statements are correct about an array?
1: The array int num; can store 26 elements.
2: The expression num designates the very first element in the 
array.
3: It is necessary to initialize the array at the time of 
declaration.
```

**Options:**

- [A] 2, 3
- [B] 1, 2
- [C] 1
- [D] 1, 2, 3

**Answer:**

[C] 1

***

```text
Question 15
Does this mentioning array name gives the base address in all the 
contexts?
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[B] No

***

```text
Question 16
Is there any difference in the following declarations?
int f1(int arr[]);
int f1(int arr);
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[A] No

***

```text
Question 17
Are the expressions arr and &arr same for an array of 10 integers?
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[B] No

***

```text
Question 18
What would be the equivalent pointer expression for referring the 
array element a[i][j][k][l][m]
```

**Options:**

- [A] ((((a+i)+j)+k)+l)
- [B] (((a+i)+j)+k+l)
- [C] ((a+i)+j+k+l)
- [D] *(*(*(*(*(a+i)+j)+k)+l)+m)

**Answer:**

[D] *(*(*(*(*(a+i)+j)+k)+l)+m)

***

```c
/* Question 19
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int arr = {10, 2, 3, 4, 5, 6, 7, 8};
    int *p, *q;
    p = &arr;
    q = (int*) arr;
    printf("%d, %d\n", *p, *q);
    return 0;
}
```

**Options:**

- [A] Garbage values
- [B] 8, 1
- [C] 10, 2
- [D] 8, 10

**Answer:**

[D] 8, 10

***

```c
/* Question 20
 * What will be the output of the program assuming that the array 
 * begins at the location 1002 and size of an integer is 4 bytes?
 */
#include<stdio.h>
int main()
{
    int a = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
    printf("%u, %u, %u\n", a+1, *(a+1), *(*(a+0)+1));
    return 0;
}
```

**Options:**

- [A] Error
- [B] 520, 2, 2
- [C] 1006, 2, 2
- [D] 448, 4, 4

**Answer:**

[C] 1006, 2, 2

***

```c
/* Question 21
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char str[] = "peace world";
    char *s = str;
    printf("%s\n", s++ +3);
    return 0;
}
```

**Options:**

- [A] eace world
- [B] ce world
- [C] peace world
- [D] ace world

**Answer:**

[B] ce world

## Strings

```text
Question 1
How will you print \n on the screen?
```

**Options:**

- [A] `printf("\n");`
- [B] `printf("\\n");`
- [C] `echo "\\n";`
- [D] `printf('\n');`

**Answer:**

[B] `printf("\\n");`

***

```text
Question 2
The library function used to reverse a string is
```

**Options:**

- [A] strstr()
- [B] revstr()
- [C] strreverse()
- [D] strrev()

**Answer:**

[D] strrev()

***

```text
Question 3
Which of the following function sets first n characters of a string to a given character?
```

**Options:**

- [A] strnset()
- [B] strset()
- [C] strcset()
- [D] strinit()

**Answer:**

[A] strnset()

***

```c
/* Question 4
 * What will be the output of the program?
 */
void main()
{
    char s[ ]="man";
    int i;
    for(i=0;s[ i ];i++)
        printf("\n%c%c%c%c",s[ i ],*(s+i),*(i+s),i[s]);
}
```

**Options:**

- [A] `mmmm \n aaaa \n nnnn`
- [B] `Error`
- [C] `None of the above`
- [D] `man \n man \n man \n man`

**Answer:**

[A] `mmmm \n aaaa \n nnnn`

***

```c
/* Question 5
 * Will the following code compile?
 */
void main()
{
    char string[]="Hello World";
    display(string);
}
void display(char *string)
{
    printf("%s",string);
}
```

**Options:**

- [A] None of the above
- [B] Hello World
- [C] Compiler Error
- [D] H

**Answer:**

[C] Compiler Error

***

```text
Question 6
If the two strings are identical, then strcmp() function returns
```

**Options:**

- [A] False
- [B] 1
- [C] -1
- [D] True

**Answer:**

[A] False

***

```text
Question 7
Which of the following function is used to find the first occurrence of a given string in another string?
```

**Options:**

- [A] strchr()
- [B] strrchr()
- [C] strstr()
- [D] strnset()

**Answer:**

[C] strstr()

***

```c
/* Question 8
 * Will the following code compile
 */
void main()
{
    static char names=
    {"pascal","ada","cobol","fortran","perl"};
    int i;
    char *t;
    t=names;
    names=names;
    names=t;
    for (i=0;i<=4;i++)
        printf("%s",names[i]);
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[B] No

***

```c
/* Question 9
 * What will be the output of the program?
 */
#include<stdio.h>
void main()
{
    char s[]={'a','b','c','\n','c','\0'};
    char *p,*str,*str1;
    p=&s;
    str=p;
    str1=s;
    printf("%c",++*p + ++*str1-32);
}
```

**Options:**

- [A] X
- [B] a
- [C] M
- [D] Error

**Answer:**

[C] M

***

```text
Question 10
Which of the following function is more appropriate for reading in a multi-word string?
```

**Options:**

- [A] fgets();
- [B] printf();
- [C] puts();
- [D] scanf();

**Answer:**

[A] fgets();

***

```text
Question 11
Which of the following function is correct that finds the length of a string?
```

**Options:**

- [A] 
```c
int xstrlen(char *s)
{
    int length=0;
    while(*s!='\0')
    {
        length++; s++;
    }
    return (length);
}
```
- [B] 
```c
int xstrlen(char s)
{
    int length=0;
    while(*s!='\0')
    {
        length++; s++;
    }
    return (length);
}
```
- [C] 
```c
int xstrlen(char *s)
{
    int length=0;
    while(*s!='\0')
    {
        return (length);
    }
}
```
- [D] 
```c
int xstrlen(char *s)
{
    int length=0;
    while(*s!='\0')
    {
        length++;
        return (length);
    }
}
```

**Answer:**

[A] 
```c
int xstrlen(char *s)
{
    int length=0;
    while(*s!='\0')
    {
        length++; s++;
    }
    return (length);
}
```

***

```c
/* Question 12
 * What will be the output of the program ?
 */
#include<stdio.h>
#include
int main()
{
    char str1 = "Hello", str2 = " World";
    printf("%s\n", strcpy(str2, strcat(str1, str2)));
    return 0;
}
```

**Options:**

- [A] World
- [B] Hello World
- [C] Hello
- [D] WorldHello

**Answer:**

[B] Hello World

***

```c
/* Question 13
 * What will be the output of the program?
 */
void main()
{
    char *str1="abcd";
    char str2[]="abcd";
    printf("%d %d %d",sizeof(str1),sizeof(str2),sizeof("abcd"));
}
```

**Options:**

- [A] error
- [B] 2 2 2
- [C] 2005-02-05 00:00:00
- [D] 4 4 4

**Answer:**

[C] 2005-02-05 00:00:00 *(Note: The quiz platform has erroneously formatted the true answer '2 5 5' as a date).*

***

```c
/* Question 14
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char p[] = "%d\n";
    p = 'c';
    printf(p, 65);
    return 0;
}
```

**Options:**

- [A] c
- [B] a
- [C] 65
- [D] A

**Answer:**

[D] A

***

```c
/* Question 15
 * What will be the output of the program ?
 */
#include<stdio.h>
#include
int main()
{
    printf("%d\n", strlen("12345"));
    return 0;
}
```

**Options:**

- [A] 5
- [B] 2002-12-05 00:00:00

**Answer:**

[A] 5

***

```c
/* Question 16
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    printf(5+"Good Morning\n");
    return 0;
}
```

**Options:**

- [A] M
- [B] Good Morning
- [C] Morning
- [D] Good

**Answer:**

[C] Morning

***

```c
/* Question 17
 * What will be the output of the program ?
 */
#include<stdio.h>
#include
int main()
{
    char str[] = "Ind\0\ROCKS\0";
    printf("%s\n", str);
    return 0;
}
```

**Options:**

- [A] Ind\0ROCKS
- [B] ROCKS
- [C] Ind
- [D] Ind ROCKS

**Answer:**

[C] Ind

***

```c
/* Question 18
 * What will be the output of the program If characters 'a', 'b'
 * ,'c','d' ans enter are supplied as input?
 */
#include<stdio.h>
int main()
{
    void fun();
    fun();
    printf("\n");
    return 0;
}
void fun()
{
    char c;
    if((c = getchar())!= '\n')
        fun();
    printf("%c", c);
}
```

**Options:**

- [A] dcba
- [B] dbca
- [C] Infinite loop
- [D] abcd abcd

**Answer:**

[A] dcba

***

```c
/* Question 19
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    printf("Ind", "ROCKS\n");
    return 0;
}
```

**Options:**

- [A] Error
- [B] Ind
- [C] ROCKS
- [D] Ind ROCKS

**Answer:**

[B] Ind

***

```c
/* Question 20
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char *names[] = { "Suresh", "Siva", "Sona", "Baiju", "Ritu"};
    int i;
    char *t;
    t = names;
    names = names;
    names = t;
    for(i=0; i<=4; i++)
        printf("%s,", names[i]);
    return 0;
}
```

**Options:**

- [A] Suresh, Siva, Baiju, Sona, Ritu
- [B] Suresh, Siva, Sona, Baiju, Ritu
- [C] Suresh, Siva, Ritu, Sona, Baiju
- [D] Suresh, Siva, Sona, Ritu, Baiju

**Answer:**

[D] Suresh, Siva, Sona, Ritu, Baiju

***

```c
/* Question 21
 * What will be the output of the program ?
 */
#include<stdio.h>
#include
int main()
{
    static char str1[] = "dills";
    static char str2;
    static char str3[] = "Daffo";
    int i;
    i = strcmp(strcat(str3, strcpy(str2, str1)), "Daffodills");
    printf("%d\n", i);
    return 0;
}
```

**Options:**

- [A] 2004-01-02 00:00:00
- [B] False

**Answer:**

[B] False

***

```c
/* Question 22
 * What will be the output of the program ?
 */
#include<stdio.h>
#include
int main()
{
    static char s[] = "Hello!";
    printf("%d\n", *(s+strlen(s)));
    return 0;
}
```

**Options:**

- [A] 0
- [B] error
- [C] 16
- [D] False

**Answer:**

[D] False

***

```c
/* Question 23
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    static char s = "The cocaine man";
    int i=0;
    char ch;
    ch = s[++i];
    printf("%c", ch);
    ch = s[i++];
    printf("%c", ch);
    ch = i++[s];
    printf("%c", ch);
    ch = ++i[s];
    printf("%c", ch);
    return 0;
}
```

**Options:**

- [A] Hhec
- [B] hhe!
- [C] The c
- [D] he c

**Answer:**

[B] hhe!

***

```c
/* Question 24
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    int i;
    char a[] = "\0";
    if(printf("%s", a))
        printf("The string is empty\n");
    else
        printf("The string is not empty\n");
    return 0;
}
```

**Options:**

- [A] 0
- [B] No output
- [C] The string is not empty
- [D] The string is empty

**Answer:**

[C] The string is not empty

***

```c
/* Question 25
 * If char=1, int=4, and float=4 bytes size, What will be the output
 * of the program ?
 */
#include<stdio.h>
int main()
{
    char ch = 'A';
    printf("%d, %d, %d", sizeof(ch), sizeof('A'), sizeof(3.14f));
    return 0;
}
```

**Options:**

- [A] 2, 4, 8
- [B] 1, 2, 4
- [C] 1, 4, 4
- [D] 2, 2, 4

**Answer:**

[C] 1, 4, 4

***

```c
/* Question 26
 * If the size of pointer is 32 bits What will be the output of the
 * program ?
 */
#include<stdio.h>
int main()
{
    char a[] = "Visual C++";
    char *b = "Visual C++";
    printf("%d, %d\n", sizeof(a), sizeof(b));
    printf("%d, %d", sizeof(*a), sizeof(*b));
    return 0;
}
```

**Options:**

- [A] `10, 2 \n 2, 2`
- [B] `11, 4 \n 1, 1`
- [C] `10, 4 \n 1, 2`
- [D] `12, 2 \n 2, 2`

**Answer:**

[B] `11, 4 \n 1, 1`

***

```c
/* Question 27
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char str1[] = "Hello";
    char str2;
    char *t, *s;
    s = str1;
    t = str2;
    while(*t=*s)
        *t++ = *s++;
    printf("%s\n", str2);
    return 0;
}
```

**Options:**

- [A] No output
- [B] Hello
- [C] ello
- [D] HelloHello

**Answer:**

[B] Hello

***

```c
/* Question 28
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char str = "Ind Test";
    printf("%s\n", &str+2);
    return 0;
}
```

**Options:**

- [A] rga Test
- [B] Garbage value
- [C] Error
- [D] No output

**Answer:**

[B] Garbage value

***

```c
/* Question 29
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char str = "Ind Test";
    printf("%s\n", str);
    return 0;
}
```

**Options:**

- [A] Ind Test
- [B] No output
- [C] Error
- [D] Base address of str

**Answer:**

[C] Error

***

```c
/* Question 30
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char str[] = "Nagpur";
    str='K';
    printf("%s, ", str);
    str = "Kanpur";
    printf("%s", str+1);
    return 0;
}
```

**Options:**

- [A] Kagpur, anpur
- [B] Error
- [C] Nagpur, Kanpur
- [D] Kagpur, Kanpur

**Answer:**

[B] Error

***

```c
/* Question 31
 * What will be the output of the program ?
 */
#include<stdio.h>
#include
int main()
{
    char sentence;
    int i;
    printf("Enter a line of text\n");
    fgets(sentence, 80, stdin);
    for(i=strlen(sentence)-1; i >=0; i--)
        putchar(sentence[i]);
    return 0;
}
```

**Options:**

- [A] None of above
- [B] The sentence will get printed in same order as it entered
- [C] Half of the sentence will get printed
- [D] The sentence will get printed in reverse order

**Answer:**

[D] The sentence will get printed in reverse order

***

```c
/* Question 32
 * What will be the output of the program ?
 */
#include<stdio.h>
void swap(char *, char *);
int main()
{
    char *pstr = {"Hello", "Ind Test"};
    swap(pstr, pstr);
    printf("%s\n%s", pstr, pstr);
    return 0;
}
void swap(char *t1, char *t2)
{
    char *t;
    t=t1;
    t1=t2;
    t2=t;
}
```

**Options:**

- [A] `Dello \n Murga Test`
- [B] `Address of "Hello" and "Ind Test"`
- [C] `Hello \n Ind Test`
- [D] `Ind Test \n Hello`

**Answer:**

[C] `Hello \n Ind Test`

***

```c
/* Question 33
 * If the size of pointer is 4 bytes then What will be the output of
 * the program ?
 */
#include<stdio.h>
int main()
{
    char *str[] = {"Frogs", "Do", "Not", "Die", "They", "Croak!"};
    printf("%d, %d", sizeof(str), strlen(str));
    return 0;
}
```

**Options:**

- [A] 24, 5
- [B] 25, 5
- [C] 20, 2
- [D] 22, 4

**Answer:**

[A] 24, 5

***

```c
/* Question 34
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char str1[] = "Hello";
    char str2[] = "Hello";
    if(str1 == str2)
        printf("Equal\n");
    else
        printf("Unequal\n");
    return 0;
}
```

**Options:**

- [A] Unequal
- [B] Error
- [C] Equal
- [D] None of above

**Answer:**

[A] Unequal

***

```c
/* Question 35
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char *p1 = "Ind", *p2;
    p2=p1;
    p1 = "TEST";
    printf("%s %s\n", p1, p2);
    return 0;
}
```

**Options:**

- [A] TEST TEST
- [B] TEST Ind
- [C] Ind TEST
- [D] Ind Ind

**Answer:**

[B] TEST Ind

***

```c
/* Question 36
 * What will be the output of the program ?
 */
#include<stdio.h>
#include
int main()
{
    printf("%c\n", "abcdefgh");
    return 0;
}
```

**Options:**

- [A] e
- [B] Error
- [C] d
- [D] abcdefgh

**Answer:**

[A] e

***

```c
/* Question 37
 * What will be the output of the program ? (Assume Hello string is
 * stored in 65530)
 */
#include<stdio.h>
int main()
{
    printf("%u %s\n", &"Hello", &"Hello");
    return 0;
}
```

**Options:**

- [A] Hello 65530
- [B] 65530 Hello
- [C] Error
- [D] Hello Hello

**Answer:**

[B] 65530 Hello

***

```c
/* Question 38
 * Which of the following statements are correct about the program below?
 */
#include<stdio.h>
int main()
{
    char str, *s;
    printf("Enter a string\n");
    scanf("%s", str);
    s=str;
    while(*s != '\0')
    {
        if(*s >= 97 && *s <= 122)
            *s = *s-32;
        s++;
    }
    printf("%s",str);
    return 0;
}
```

**Options:**

- [A] The code converts a string in to an integer
- [B] The code converts lower case character to upper case

**Answer:**

[B] The code converts lower case character to upper case

***

```text
Question 39
Which of the following statements are correct about the below 
declarations?
char *p = "Ind";
char a[] = "Ind";
1: There is no difference in the declarations and both serve the 
same purpose.
2: p is a non-const pointer pointing to a non-const string, 
Whereas a is a const pointer pointing to a non-const pointer.
3: The pointer p can be modified to point to another string, 
whereas the individual characters within array a can be changed.
4: In both cases the '\0' will be added at the end of the string 
"Ind".
```

**Options:**

- [A] 2, 3, 4
- [B] 2, 3
- [C] 1, 2
- [D] 3, 4

**Answer:**

[A] 2, 3, 4

***

```text
Question 40
Which of the following statement is correct?
```

**Options:**

- [A] strcmp(s1, s2) returns a number less than 0 if s1>s2
- [B] strcmp(s1, s2) returns 0 if s1==s2
- [C] strcmp(s1, s2) returns 1 if s1==s2
- [D] strcmp(s1, s2) returns a number greater than 0 if s1<s2

**Answer:**

[B] strcmp(s1, s2) returns 0 if s1==s2

***

```c
/* Question 41
 * Will the program compile successfully?
 */
#include<stdio.h>
int main()
{
    char a[] = "Ind";
    char *p = "TEST";
    a = "TEST";
    p = "Ind";
    printf("%s %s\n", a, p);
    return 0;
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[B] No

***

```text
Question 42
For the following statements will arr and ptr fetch the same 
character?
char arr[] = "Ind Test";
char *ptr = "Ind Test";
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

***

```c
/* Question 43
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    static char *s[] = {"black", "white", "pink", "violet"};
    char **ptr[] = {s+3, s+2, s+1, s}, ***p;
    p = ptr;
    ++p;
    printf("%s", **p+1);
    return 0;
}
```

**Options:**

- [A] ack
- [B] let
- [C] ite
- [D] ink

**Answer:**

[D] ink

***

```c
/* Question 44
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char *str;
    str = "%s";
    printf(str, "K\n");
    return 0;
}
```

**Options:**

- [A] No output
- [B] %s
- [C] K
- [D] Error

**Answer:**

[C] K

***

```c
/* Question 45
 * What will be the output of the program?
 */
void main()
{
    char *p;
    p="Hello";
    printf("%c\n",*&*p);
}
```

**Options:**

- [A] Garbage Value
- [B] H
- [C] Hello
- [D] Error

**Answer:**

[B] H

***

```c
/* Question 46
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    printf("%c\n", 5["IndTest"]);
    return 0;
}
```

**Options:**

- [A] 5
- [B] Nothing will print
- [C] s
- [D] Error

**Answer:**

[C] s

***

```c
/* Question 47
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char *p;
    p="Hello";
    printf("%s\n", *&*&p);
    return 0;
}
```

**Options:**

- [A] ell
- [B] Hello
- [C] h
- [D] ll

**Answer:**

[B] Hello

***

```c
/* Question 48
 * Which statement will you add to the following program to ensure
 * that the program outputs "Ind Test" on execution?
 */
#include<stdio.h>
int main()
{
    char s[] = " Ind Test ";
    char t;
    char *ps, *pt;
    ps = s;
    pt = t;
    while(*ps)
        *pt++ = *ps++;
    /* Add a statement here */
    printf("%s\n", t);
    return 0;
}
```

**Options:**

- [A] `*pt='';`
- [B] `pt='\n';`
- [C] `*pt='\0';`
- [D] `pt='\0';`

**Answer:**

[C] `*pt='\0';`

***

```c
/* Question 49
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    void fun(char*);
    char a;
    a = 'A'; a = 'B';
    a = 'C'; a = 'D';
    fun(&a);
    return 0;
}
void fun(char *a)
{
    a++;
    printf("%c", *a);
    a++;
    printf("%c", *a);
}
```

**Options:**

- [A] AB
- [B] BC
- [C] CD
- [D] No output

**Answer:**

[B] BC

***

```c
/* Question 50
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    char *s;
    char *fun();
    s = fun();
    printf("%s\n", s);
    return 0;
}
char *fun()
{
    char buffer;
    strcpy(buffer, "RAM");
    return (buffer);
}
```

**Options:**

- [A] 0xffff
- [B] Garbage value
- [C] Error
- [D] 0xffee

**Answer:**

[C] Error

***

```c
/* Question 51
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    char str = "Hello";
    char *const p=str;
    *p='M';
    printf("%s\n", str);
    return 0;
}
```

**Options:**

- [A] Mello
- [B] MHello
- [C] HMello
- [D] Hello

**Answer:**

[A] Mello

***

```c
/* Question 52
 * What will be the output of the program?
 */
#include<stdio.h>
void main()
{
    register i=5;
    char j[]="hello";
    printf("%s %d",j,i);
}
```

**Options:**

- [A] hello 5
- [B] error
- [C] 5 hello
- [D] none of the above

**Answer:**

[A] hello 5

***

```c
/* Question 53
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    char ch;
    ch = 'A';
    printf("The letter is ");
    printf("%c\n", ch >= 'A' && ch <= 'Z' ? ch + 'a' - 'A':ch);
    printf("Now the letter is ");
    printf("%c\n", ch >= 'A' && ch <= 'Z' ? ch : ch + 'a' - 'A');
    return 0;
}
```

**Options:**

- [A] `Error`
- [B] `The letter is a \n Now the letter is A`
- [C] `None of above`
- [D] `The letter is A \n Now the letter is a`

**Answer:**

[B] `The letter is a \n Now the letter is A`

***

```c
/* Question 54
 * What will be the output of the program?
 */
void main()
{
    printf("\nab");
    printf("\bsi");
    printf("\rha");
}
```

**Options:**

- [A] garbage value
- [B] hai
- [C] Error
- [D] absiha

**Answer:**

[B] hai

***

```c
/* Question 55
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    char str[]="C-program";
    int a = 5;
    printf(a >1?"Ind Test\n":"%s\n", str);
    return 0;
}
```

**Options:**

- [A] None of above
- [B] Error
- [C] C-program
- [D] Ind Test

**Answer:**

[D] Ind Test

***

```c
/* Question 56
 * Will the following code compile
 */
void main()
{
    int k=1;
    printf("%d==1 is ""%s",k,k==1?"TRUE":"FALSE");
}
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[B] Yes

***

```c
/* Question 57
 * In the following program how long will the for loop get executed?
 */
#include<stdio.h>
int main()
{
    int i;
    for(;scanf("%s", &i); printf("%d\n", i));
    return 0;
}
```

**Options:**

- [A] The for loop would not get executed at all
- [B] The for loop would get executed infinite times
- [C] The for loop would get executed only once
- [D] The for loop would get executed 5 times

**Answer:**

[B] The for loop would get executed infinite times

***

```text
Question 58
Which standard library function will you use to find the last 
occurance of a character in a string in C?
```

**Options:**

- [A] strchar()
- [B] strnchar()
- [C] strrchar()
- [D] strrchr()

**Answer:**

[D] strrchr()

***

```c
/* Question 59
 * What will be the output of the program?
 */
#include<stdio.h>
#include
int main()
{
    char dest[] = {98, 98, 0};
    char src[] = "bbb";
    int i;
    if((i = memcmp(dest, src, 2))==0)
        printf("Got it");
    else
        printf("Missed");
    return 0;
}
```

**Options:**

- [A] Got it
- [B] None of above
- [C] Missed
- [D] Error in memcmp statement

**Answer:**

[A] Got it

***

```text
Question 60
It is necessary that for the string functions to work safely the 
strings must be terminated with '\0'.
```

**Options:**

- [A] False
- [B] True

**Answer:**

[B] True

***

```text
Question 61
The prototypes of all standard library string functions are 
declared in the file string.h.
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

***

```text
Question 62
scanf() or atoi() function can be used to convert a string like 
"436" in to integer.
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[B] Yes

## Structures

```text
Question 1
What is the similarity between a structure, union and enumeration?
```

**Options:**

- [A] All of them let you define new pointers
- [B] All of them let you define new values
- [C] All of them let you define user-defined data types
- [D] All of them let you define new structures

**Answer:**

[C] All of them let you define user-defined data types

***

```c
/* Question 2
 * What will be the output of the program?
 */
#include<stdio.h>
void main()
{
    struct xx
    {
        int x=3;
        char name[]="hello";
    };
    struct xx *s;
    printf("%d",s->x);
    printf("%s",s->name);
}
```

**Options:**

- [A] Compiler Error
- [B] 3 hello
- [C] none of the above
- [D] hello 3

**Answer:**

[A] Compiler Error

***

```c
/* Question 3
 * The following code will compile
 */
#include<stdio.h>
void main()
{
    struct xx
    {
        int x;
        struct yy
        {
            char s;
            struct xx *p;
        };
        struct yy *q;
    };
}
```

**Options:**

- [A] False
- [B] True

**Answer:**

[A] False

***

```c
/* Question 4
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    struct value
    {
        int bit1:1;
        int bit3:4;
        int bit4:4;
    }bit={1, 2, 13};
    printf("%d, %d, %d\n", bit.bit1, bit.bit3, bit.bit4);
    return 0;
}
```

**Options:**

- [A] -1, -2, -13
- [B] 1, 4, 4
- [C] 1, 2, 13
- [D] -1, 2, -3

**Answer:**

[D] -1, 2, -3

***

```c
/* Question 5
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    struct value
    {
        int bit1:2;
        int bit3:5;
        int bit4:4;
    }bit;
    printf("%d\n", sizeof(bit));
    return 0;
}
```

**Options:**

- [A] 2011-01-04 00:00:00
- [B] 2

**Answer:**

[B] 2 *(Note: The quiz platform has erroneously formatted one of the options as a date).*

***

```c
/* Question 6
 * Will the following code compile
 */
#include<stdio.h>
void main()
{
    struct xx
    {
        int x=3;
        char name[]="hello";
    };
    struct xx *s=malloc(sizeof(struct xx));
    printf("%d",s->x);
    printf("%s",s->name);
}
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[A] No

***

```c
/* Question 7
 * The following code is for single linked lists
 */
struct aaa
{
    struct aaa *prev;
    int i;
    struct aaa *next;
};
main()
{
    struct aaa abc,def,ghi,jkl;
    int x=100;
    abc.i=0;
    abc.prev=&jkl;
    abc.next=&def;
    def.i=1;
    def.prev=&abc;
    def.next=&ghi;
    ghi.i=2;
    ghi.prev=&def;
    ghi.next=&jkl;
    jkl.i=3;
    jkl.prev=&ghi;
    jkl.next=&abc;
    x=abc.next->next->prev->next->i;
    printf("%d",x);
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[B] No

***

```c
/* Question 8
 * Will the following code compile
 */
struct point
{
    int x;
    int y;
};
struct point origin,*pp;
main()
{
    pp=&origin;
    printf("origin is(%d%d)\n",(*pp).x,(*pp).y);
    printf("origin is (%d%d)\n",pp->x,pp->y);
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

***

```c
/* Question 9
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    struct employee
    {
        char *n;
        int age;
    };
    struct employee e1 = {"Dravid", 23};
    struct employee e2 = e1;
    strupr(e2.n);
    printf("%s\n", e1.n);
    return 0;
}
```

**Options:**

- [A] Dravid
- [B] Error: Invalid structure assignment
- [C] DRAVID
- [D] No output

**Answer:**

[A] Dravid

***

```c
/* Question 10
 * What will be the output of the program in 16-bit platform (under DOS)?
 */
#include<stdio.h>
int main()
{
    struct node
    {
        int data;
        struct node *link;
    };
    struct node *p, *q;
    p = (struct node *) malloc(sizeof(struct node));
    q = (struct node *) malloc(sizeof(struct node));
    printf("%d, %d\n", sizeof(p), sizeof(q));
    return 0;
}
```

**Options:**

- [A] 2, 2
- [B] 5, 5
- [C] 8, 8
- [D] 4, 4

**Answer:**

[A] 2, 2

***

```c
/* Question 11
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    struct byte
    {
        int one:1;
    };
    struct byte var = {1};
    printf("%d\n", var.one);
    return 0;
}
```

**Options:**

- [A] 0
- [B] Error
- [C] 1
- [D] -1

**Answer:**

[D] -1

***

```c
/* Question 12
 * What will be the output of the program ?
 */
#include<stdio.h>
struct course
{
    int courseno;
    char coursename;
};
int main()
{
    struct course c[] = { {102, "Java"},
                          {103, "PHP"},
                          {104, "DotNet"}    };
    printf("%d", c.courseno);
    printf("%s\n", (*(c+2)).coursename);
    return 0;
}
```

**Options:**

- [A] 104 DotNet
- [B] 102 Java
- [C] 103 DotNet
- [D] 103 PHP

**Answer:**

[C] 103 DotNet

***

```c
/* Question 13
 * Point out the error in the program?
 */
struct employee
{
    int ecode;
    struct employee *e;
};
```

**Options:**

- [A] Linker Error
- [B] No Error
- [C] None of above
- [D] Error: in structure declaration

**Answer:**

[B] No Error

***

```c
/* Question 14
 * Point out the error in the program?
 */
typedef struct smalldata mystruct;
struct smalldata
{
    int x;
    mystruct *b;
};
```

**Options:**

- [A] None of above
- [B] Linker Error
- [C] Error: in structure declaration
- [D] No Error

**Answer:**

[D] No Error

***

```c
/* Question 15
 * Point out the error in the program?
 */
#include<stdio.h>
int main()
{
    struct a
    {
        float category:5;
        char scheme:4;
    };
    printf("size=%d", sizeof(struct a));
    return 0;
}
```

**Options:**

- [A] Error: invalid structure member in printf
- [B] No error
- [C] Error in this float category:5; statement
- [D] None of above

**Answer:**

[C] Error in this float category:5; statement

***

```c
/* Question 16
 * Point out the error in the program?
 */
#include<stdio.h>
int main()
{
    struct bits
    {
        int i:40;
    }bit;
    printf("%d\n", sizeof(bit));
    return 0;
}
```

**Options:**

- [A] 4
- [B] Error: Invalid member access in structure
- [C] Error: Bit field too large
- [D] 2

**Answer:**

[C] Error: Bit field too large

***

```c
/* Question 17
 * Point out the error in the program?
 */
#include<stdio.h>
int main()
{
    struct emp
    {
        char name;
        int age;
        float bs;
    };
    struct emp e;
    e.name = "Ind";
    e.age = 25;
    printf("%s %d\n", e.name, e.age);
    return 0;
}
```

**Options:**

- [A] Error: Rvalue required
- [B] Error: Invalid constant expression
- [C] No error: Output: Ind 25
- [D] Error: Lvalue required/incompatible types in assignment

**Answer:**

[D] Error: Lvalue required/incompatible types in assignment

***

```text
Question 18
If a variable is a pointer to a structure, then which of the following operator is used to access data members of the structure through the pointer variable?
```

**Options:**

- [A] ->
- [B] &
- [C] *
- [D] .

**Answer:**

[A] ->

***

```c
/* Question 19
 * What is the output of the program
 */
#include<stdio.h>
int main()
{
    struct emp
    {
        char name;
        int age;
        float sal;
    };
    struct emp e = {"Tiger"};
    printf("%d, %f\n", e.age, e.sal);
    return 0;
}
```

**Options:**

- [A] 0, 0.000000
- [B] None of above
- [C] Error
- [D] Garbage values

**Answer:**

[A] 0, 0.000000

***

```c
/* Question 20
 * Point out the error in the following program.
 */
#include<stdio.h>
struct emp
{
    char name;
    int age;
};
int main()
{
    emp int xx;
    int a;
    printf("%d\n", &a);
    return 0;
}
```

**Options:**

- [A] Error: in emp int xx;
- [B] No error
- [C] None of these
- [D] Error: in printf

**Answer:**

[A] Error: in emp int xx;

***

```c
/* Question 21
 * Which of the structure is correct?
 * 1: struct aa
 *    {
 *        int a=10;
 *        float b=3.14f;
 *    };
 * 2: struct aa
 *    {
 *        int a;
 *        float b;
 *        struct aa var;
 *    };
 * 3: struct aa
 *    {
 *        int a;
 *        float b;
 *        struct aa *var;
 *    };
 */
```

**Options:**

- [A] None of the above
- [B] 2
- [C] 1
- [D] 3

**Answer:**

[D] 3

***

```c
/* Question 22
 * In the following code, the P2 is Integer Pointer or Integer?
 */
typedef int *ptr;
ptr p1, p2;
```

**Options:**

- [A] Integer
- [B] Integer pointer
- [C] Error in declaration
- [D] None of above

**Answer:**

[B] Integer pointer

***

```c
/* Question 23
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    typedef int arr;
    arr iarr = {1, 2, 3, 4, 5};
    int i;
    for(i=0; i<4; i++)
        printf("%d, ", iarr[i]);
    return 0;
}
```

**Options:**

- [A] No output
- [B] 1, 2, 3, 4, 5
- [C] Error: Cannot use typedef with an array
- [D] 1, 2, 3, 4

**Answer:**

[B] 1, 2, 3, 4, 5 *(Note: While the loop runs 4 times, this is the option explicitly marked correct in the source document).*

***

```c
/* Question 24
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    typedef float f;
    f *fptr;
    float fval = 900;
    fptr = &fval;
    printf("%f\n", *fptr);
    return 0;
}
```

**Options:**

- [A] 0
- [B] 900
- [C] 9
- [D] 90

**Answer:**

[B] 900

***

```c
/* Question 25
 * Is the following declaration acceptable?
 */
typedef long no, *ptrtono;
no n;
ptrtono p;
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

***

```text
Question 26
typedef's have the advantage that they obey scope rules, that is they can be declared local to a function or a block whereas #define's always have a global effect.
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[B] Yes

***

```c
/* Question 27
 * Which of the following is correct about err used in the declaration given below?
 */
typedef enum error { warning, test, exception } err;
```

**Options:**

- [A] The statement is erroneous
- [B] It is a typedef for enum error.
- [C] It is a structure
- [D] It is a variable of type enum error

**Answer:**

[B] It is a typedef for enum error.

***

```c
/* Question 28
 * Which of the following are correct?
 * 1: typedef long a;
 *    extern int a c;
 * 2: typedef long a;
 *    extern a int c;
 * 3: typedef long a;
 *    extern a c;
 */
```

**Options:**

- [A] 3 correct
- [B] 1 correct
- [C] 1, 2, 3 are correct
- [D] 2 correct

**Answer:**

[A] 3 correct

## Union

```c
/* Question 1
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    union a
    {
        int i;
        char ch;
    };
    union a u;
    u.ch=3;
    u.ch=2;
    printf("%d, %d, %d\n", u.ch, u.ch, u.i);
    return 0;
}
```

**Options:**

- [A] 3, 2, 5
- [B] 3, 2, 515
- [C] 515, 515, 4
- [D] 515, 2, 3

**Answer:**

[B] 3, 2, 515

***

```c
/* Question 2
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    union var
    {
        int a, b;
    };
    union var v;
    v.a=10;
    v.b=20;
    printf("%d\n", v.a);
    return 0;
}
```

**Options:**

- [A] 2000-10-30 00:00:00
- [B] 20

**Answer:**

[B] 20 *(Note: The quiz platform has erroneously formatted one option as a date).*

***

```c
/* Question 3
 * Point out the error in the program?
 */
#include<stdio.h>
int main()
{
    union a
    {
        int i;
        char ch;
    };
    union a z1 = {512};
    union a z2 = {0, 2};
    return 0;
}
```

**Options:**

- [A] No error
- [B] Error: invalid union declaration
- [C] None of above
- [D] Error: in initializing z2

**Answer:**

[D] Error: in initializing z2

***

```text
Question 4
A union cannot be nested in a structure
```

**Options:**

- [A] False
- [B] True

**Answer:**

[A] False

***

```c
/* Question 5
 * What is the output of the program
 */
#include<stdio.h>
int main()
{
    union a
    {
        int i;
        char ch;
    };
    union a u;
    u.ch = 3;
    u.ch = 2;
    printf("%d, %d, %d\n", u.ch, u.ch, u.i);
    return 0;
}
```

**Options:**

- [A] 3, 2, 5
- [B] 3, 2, 515
- [C] 515, 2, 3
- [D] Garbage values

**Answer:**

[B] 3, 2, 515

## Enum

```text
Question 1
Which of the following is not user defined data type?
1: struct book
   {
       char name;
       float price;
       int pages;
   };
2: long int l = 2L;
3: enum day {Sun, Mon, Tue, Wed};
4: union employee
   {
       int id;
       Char name;
       int sal;
   };
```

**Options:**

- [A] 2
- [B] 2004-01-03 00:00:00

**Answer:**

[A] 2 *(Note: The quiz platform has erroneously formatted the second option as a date).*

***

```c
/* Question 2
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    enum days {MON=-1, TUE, WED=6, THU, FRI, SAT};
    printf("%d, %d, %d, %d, %d, %d\n", MON, TUE, WED, THU, FRI, SAT);
    return 0;
}
```

**Options:**

- [A] -1, 0, 6, 2, 3, 4
- [B] -1, 0, 1, 2, 3, 4
- [C] -1, 0, 6, 7, 8, 9
- [D] -1, 2, 6, 3, 4, 5

**Answer:**

[C] -1, 0, 6, 7, 8, 9

***

```c
/* Question 3
 * What is the output of the program
 */
#include<stdio.h>
int main()
{
    enum status { pass, fail, atkt};
    enum status stud1, stud2, stud3;
    stud1 = pass;
    stud2 = atkt;
    stud3 = fail;
    printf("%d, %d, %d\n", stud1, stud2, stud3);
    return 0;
}
```

**Options:**

- [A] 1, 2, 3
- [B] error
- [C] 0, 2, 1
- [D] 0,0,0

**Answer:**

[C] 0, 2, 1

***

```c
/* Question 4
 * What will be the output of the program ?
 */
#include<stdio.h>
int main()
{
    enum value{VAL1=0, VAL2, VAL3, VAL4, VAL5} var;
    printf("%d\n", sizeof(var));
    return 0;
}
```

**Options:**

- [A] Fixed size
- [B] Sum of the size of all members
- [C] Null
- [D] Same as integer size

**Answer:**

[D] Same as integer size

## Type Qualifiers

```c
/* Question 1
 * Answer these questions to test your course knowledge
 */
void main()
{
    int const * p=5;
    printf("%d",++(*p));
}
```

**Options:**

- [A] GARBAGE VALUE
- [B] 5
- [C] ERROR
- [D] 6

**Answer:**

[C] ERROR

***

```c
/* Question 2
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    int y=12;
    const int x=y;
    printf("%d\n", x);
    return 0;
}
```

**Options:**

- [A] Garbage value
- [B] 0
- [C] 12
- [D] Error

**Answer:**

[C] 12

***

```c
/* Question 3
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    const int x=5;
    const int *ptrx;
    ptrx = &x;
    *ptrx = 10;
    printf("%d\n", x);
    return 0;
}
```

**Options:**

- [A] 10
- [B] 5
- [C] Garbage value
- [D] Error

**Answer:**

[D] Error

***

```c
/* Question 4
 * What will be the output of the program?
 */
#include<stdio.h>
int main()
{
    const char *s = "";
    char str[] = "Hello";
    s = str;
    while(*s)
        printf("%c", *s++);
    return 0;
}
```

**Options:**

- [A] Hello
- [B] Hel
- [C] Error

**Answer:**

[A] Hello

***

```c
/* Question 5
 * What will be the output of the program?
 */
#include<stdio.h>
int get();
int main()
{
    const int x = get();
    printf("%d", x);
    return 0;
}
int get()
{
    return 2;
}
```

**Options:**

- [A] Garbage value
- [B] 2
- [C] Error
- [D] 0

**Answer:**

[B] 2

***

```c
/* Question 6
 * What will be the output of the program (in Turbo c)?
 */
#include<stdio.h>
int fun(int *f)
{
    *f = 100;
    return 0;
}
int main()
{
    const int arr = {1, 2, 3, 4, 5};
    printf("Before modification arr = %d", arr);
    fun(&arr);
    printf("\nAfter modification arr = %d", arr);
    return 0;
}
```

**Options:**

- [A] Error: Invalid parameter
- [B] Error: cannot convert parameter 1 from const int * to int *
- [C] Before modification arr = 4 <br> After modification arr = 100
- [D] Before modification arr = 4 <br> After modification arr = 4

**Answer:**

[C] Before modification arr = 4 <br> After modification arr = 100

***

```c
/* Question 7
 * Will the following code compile
 */
#include<stdio.h>
void main()
{
    const int i=4;
    float j;
    j = ++i;
    printf("%d %f", i,++j);
}
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[B] No

## Dynamic Memory Allocation

```text
Question 1
Can you combine the following two statements into one?
char *p;
p = (char*) malloc(10);
```

**Options:**

- [A] char *p = (char *)(malloc*)(10);
- [B] char p = *malloc(10);
- [C] char *p = (char*)malloc(10);
- [D] char *p = (char) malloc(10);

**Answer:**

[C] char *p = (char*)malloc(10);

***

```text
Question 2
Which header file should be included to use functions like 
malloc() and calloc()?
```

**Options:**

- [A] dos.h
- [B] memory.h
- [C] string.h
- [D] stdlib.h

**Answer:**

[D] stdlib.h

***

```c
/* Question 3
 * What will be the output of the program?
 */
#include<stdio.h>
#include
int main()
{
    int *p;
    p = (int *)malloc(20); /* Assume p has address of 1318 */
    free(p);
    printf("%u", p);
    return 0;
}
```

**Options:**

- [A] 1318
- [B] 1316
- [C] Random address
- [D] Garbage value

**Answer:**

[A] 1318

***

```c
/* Question 4
 * What will be the output of the program?
 */
#include<stdio.h>
#include
int main()
{
    int *p;
    p = (int *)malloc(20);
    printf("%d\n", sizeof(p));
    free(p);
    return 0;
}
```

**Options:**

- [A] 4
- [B] 8
- [C] Garbage value
- [D] 2

**Answer:**

[D] 2

## Preprocessor Directives

```c
/* Question 1
 * Answer these questions to test your course knowledge
 */
#define square(x) x*x
void main()
{
    int i;
    i = 64/square(4);
    printf("%d",i);
}
```

**Options:**

- [A] 4
- [B] 64
- [C] 16
- [D] Error

**Answer:**

[B] 64

***

```c
/* Question 2
 * What will the SWAP macro in the following program be expanded to 
 * on preprocessing? Will the code compile?
 */
#include<stdio.h>
#define SWAP(a, b, c) (t=a, a=b, b=t)
int main()
{
    int x=10, y=20;
    SWAP(x, y, int);
    printf("%d %d\n", x, y);
    return 0;
}
```

**Options:**

- [A] Compiles and print nothing
- [B] Compiles with an warning
- [C] It compiles
- [D] Not compile

**Answer:**

[D] Not compile

***

```c
/* Question 3
 * What will be the output of the program?
 */
#define int char
void main()
{
    int i=65;
    printf("sizeof(i)=%d",sizeof(i));
}
```

**Options:**

- [A] 2
- [B] None of the above
- [C] 1
- [D] 0

**Answer:**

[C] 1

***

```text
Question 4
In which stage the following code
#include<conio.h>
gets replaced by the contents of the file conio.h
```

**Options:**

- [A] During linking
- [B] During editing
- [C] During execution
- [D] During preprocessing

**Answer:**

[D] During preprocessing

***

```c
/* Question 5
 * Point out the error in the program
 */
#include<stdio.h>
int main()
{
    int i;
    #if A
        printf("Enter any number:");
        scanf("%d", &i);
    #elif B
        printf("The number is odd");
    return 0;
}
```

**Options:**

- [A] None of above
- [B] The number is odd
- [C] Garbage values
- [D] Error: unexpected end of file because there is no matching #endif

**Answer:**

[D] Error: unexpected end of file because there is no matching #endif

***

```c
/* Question 6
 * What will be the output of the program?
 */
#include <stdio.h>
#define a 10
main()
{
    #define a 50
    printf("%d",a);
}
```

**Options:**

- [A] Error
- [B] 0
- [C] 50
- [D] Garbage value

**Answer:**

[C] 50

***

```c
/* Question 7
 * What will be the output of the program?
 */
#define clrscr() 100
void main()
{
    clrscr();
    printf("%d\n", clrscr());
}
```

**Options:**

- [A] Error
- [B] Garbage value
- [C] 0
- [D] 100

**Answer:**

[D] 100

***

```c
/* Question 8
 * Will the following code compile
 */
#define f(g,g2) g##g2
void main()
{
    int var12=100;
    printf("%d",f(var,12));
}
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[B] Yes

***

```c
/* Question 9
 * What will be the output of the program?
 */
#define FALSE -1
#define TRUE 1
#define NULL 0
main()
{
    if(NULL)
        puts("NULL");
    else if(FALSE)
        puts("TRUE");
    else
        puts("FALSE");
}
```

**Options:**

- [A] NULL
- [B] TRUE
- [C] FALSE
- [D] Error

**Answer:**

[B] TRUE

***

```c
/* Question 10
 * What will be the output of the program?
 */
#define P printf("%d\n", -1^~0);
#define M(P) int main()\
{\
    P\
    return 0;\
}
```

**Options:**

- [A] 2
- [B] 0
- [C] 1
- [D] - 1

**Answer:**

[B] 0

***

```text
Question 11
Input/output function prototypes and macros are defined in which 
header file?
```

**Options:**

- [A] dos.h
- [B] stdio.h
- [C] conio.h
- [D] stdlib.h

**Answer:**

[B] stdio.h

## Command Line Arguments

```text
Question 1
According to ANSI specifications which is the correct way of 
declaring main when it receives command-line arguments?
```

**Options:**

- [A] 
```c
int main(int argc, char *argv[])
{}
```
- [B] 
```c
int main()
{
    int argc; char *argv;
}
```
- [C] 
```c
int main(argc, argv) {
    int argc; char *argv;
}
```
- [D] None of above

**Answer:**

[A] 
```c
int main(int argc, char *argv[])
{}
```

***

```text
Question 2
The maximum combined length of the command-line arguments 
including the spaces between adjacent arguments is
```

**Options:**

- [A] 256 characters
- [B] 64 characters
- [C] 128 characters
- [D] It may vary from one operating system to another

**Answer:**

[D] It may vary from one operating system to another

***

```c
/* Question 3
 * What will be the output of the program (my.c) given below if it is 
 * executed from the command line?
 * cmd> my one two three
 */
/* my.c */
#include<stdio.h>
int main(int argc, char **argv)
{
    printf("%c\n", **++argv);
    return 0;
}
```

**Options:**

- [A] my one
- [B] my one two three
- [C] two
- [D] o

**Answer:**

[D] o

***

```c
/* Question 4
 * What will be the output of the program (sam.c) given below if it 
 * is executed from the command line?
 * cmd> sam 1 2 3
 */
/* sam.c */
#include<stdio.h>
int main(int argc, char *argv[])
{
    int j;
    j = argv + argv + argv;
    printf("%d", j);
    return 0;
}
```

**Options:**

- [A] 6
- [B] sam 6
- [C] Error
- [D] Garbage value

**Answer:**

[C] Error

***

```c
/* Question 5
 * What will be the output of the program if it is executed like 
 * below?
 * cmd> sam
 */
/* sam.c */
#include<stdio.h>
int main(int argc, char **argv)
{
    printf("%s\n", argv[argc-1]);
    return 0;
}
```

**Options:**

- [A] No output
- [B] sam
- [C] samp
- [D] 0

**Answer:**

[B] sam

***

```c
/* Question 6
 * What will be the output of the program (sam.c) given below if it 
 * is executed from the command line?
 * cmd> sam one two three
 */
/* sam.c */
#include<stdio.h>
int main(int argc, char *argv[])
{
    int i=0;
    i+=strlen(argv);
    while(i>0)
    {
        printf("%c", argv[--i]);
    }
    return 0;
}
```

**Options:**

- [A] eno
- [B] three two one
- [C] eerht
- [D] owt

**Answer:**

[A] eno

***

```text
Question 7
Every time we supply new set of values to the program at command 
prompt. we need to recompile the program.
```

**Options:**

- [A] True
- [B] False

**Answer:**

[B] False

***

```text
Question 8
Even if integer/float arguments are supplied at command prompt 
they are treated as strings.
```

**Options:**

- [A] False
- [B] True

**Answer:**

[B] True

***

```text
Question 9
Does there any function exist to convert the int or float to a 
string?
```

**Options:**

- [A] Yes
- [B] No

**Answer:**

[A] Yes

## Function Pointers

```c
/* Question 1
 * Answer these questions to test your course knowledge
 */
# include<stdio.h>
aaa()
{
    printf("hi");
}
bbb()
{
    printf("hello");
}
ccc()
{
    printf("bye");
}
main()
{
    int (*ptr)();
    ptr=aaa;
    ptr=bbb;
    ptr=ccc;
    ptr();
}
```

**Options:**

- [A] hi
- [B] hello
- [C] error
- [D] bye

**Answer:**

[D] bye

***

```c
/* Question 2
 * What will be the output of the program?
 */
#include<stdio.h>
int fun(int, int);
typedef int (*pf) (int, int);
int proc(pf, int, int);
int main()
{
    printf("%d\n", proc(fun, 6, 6));
    return 0;
}
int fun(int a, int b)
{
    return (a == b);
}
int proc(pf p, int a, int b)
{
    return ((*p)(a, b));
}
```

**Options:**

- [A] 6
- [B] True
- [C] 0
- [D] -1

**Answer:**

[B] True

***

```c
/* Question 3
 * What will be the output of the program?
 */
#include<stdio.h>

int fun(int(*)());

int main()
{
    fun(main);
    printf("Hi\n");
    return 0;
}

int fun(int (*p)())
{
    printf("Hello ");
    return 0;
}
```

**Options:**

- [A] Hi
- [B] Infinite loop
- [C] Hello Hi
- [D] Error

**Answer:**

[C] Hello Hi

## Files

```text
Question 1
Can you use the fprintf() to display the output on the screen?
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[B] Yes

## Grand Test 1

```c
/* Question 1
 * What will be the output of the program ?
 */
void main()
{
    char Array[ ] = "Hello!";
    const char* cPtr = Array;
    cPtr = "Please!";
    printf("%s", cPtr);
}
```

**Options:**

- [A] segmentation fault or R.T.E
- [B] Please!
- [C] Compilation error
- [D] Hello!

**Answer:**

[B] Please!

***

```c
/* Question 2
 * What will be the output of the program ?
 */
void main()
{
    int count = 0, i, j, k, M = 2, Z = 2, P = 2;
    for (i=1; i<= M; i++) {
        for (j=1; j<=Z; j=j*2) {
            for (k=1; k<=P; k++) {
                count = count + 2;
                printf("%d", count);
            }
            printf("\n");
        }
    }
}
```

**Options:**

- [A] `24 \n 68 \n 1012`
- [B] `24 \n 68 \n 1416`
- [C] `24 \n 68 \n 1012 \n 1416`
- [D] `24 \n 1012 \n 1416`

**Answer:**

[C] `24 \n 68 \n 1012 \n 1416`

***

```c
/* Question 3
 * What will be the output of the program ?
 */
void main()
{
    char a[ ] = "Google";
    char* p = (char*)malloc(strlen(a+1));
    strcpy(p, a);
    printf("%s", p);
    free(p);
}
```

**Options:**

- [A] Google
- [B] R.T.E
- [C] Garbage
- [D] None

**Answer:**

[A] Google

***

```c
/* Question 4
 * A Project is developed among these different files as shown
 */
//File g1.c
int counter = 2;
int count()
{
    return ++counter;
}
// File g2.c
extern int counter;
int count2()
{
    return counter += 2;
}
//File main.c
extern int counter;
extern int count();
extern int count2();
void main()
{
    counter = 100;
    printf("%d = ", count());
    printf("%d = ", count2());
    printf("%d\n", counter);
}
/* What will be the output of the program ? */
```

**Options:**

- [A] 101 = 103 = 103
- [B] 101 = 103 = 101
- [C] 101 = 102 = 100
- [D] 100 = 100 = 100

**Answer:**

[A] 101 = 103 = 103

***

```text
Question 5
The function food() is declared in a C program as follows:
void food(int int_param, char* str_param);
A programmer calls food() from within the function bar() as follows:
food(my_int, my_string);
Which of the following is/are true?
a. If food() changes the value of int param, the change will propagate back to the calling function bar(), in other words, the value of my int will also change.
b. If food() changes the second character of str_param, the change will propagate back to the calling function bar(), in other words, the second character of my string will also change.
c. If food() changes the address of str_param to point to a different string, the change will propagate back to the calling function bar(), in other words, my string will now point to a different string.
d. None of the above.
```

**Options:**

- [A] a, b
- [B] d
- [C] b
- [D] b, c

**Answer:**

[C] b

***

```c
/* Question 6
 * If buz(4) is called from main what is output?
 */
void buz(int n)
{
    printf("%d  ", n);
    if (n > 1) {
        if (n%2) {
            buz(3*n + 1);
        }
        else {
            buz(n/2);
        }
    }
}
```

**Options:**

- [A] 6 4
- [B] Stack overflow
- [C] 6 4 1
- [D] 4 2 1

**Answer:**

[D] 4 2 1

***

```c
/* Question 7
 * What is the output of the program?
 */
void main()
{
    char dest = "This is ";
    char source[ ] = "Hello World";
    strcat(dest, source);
    printf("%s ", dest);
}
```

**Options:**

- [A] This is Hello World
- [B] This is Garbage
- [C] This is Hello
- [D] R.T.E or invalid memory write

**Answer:**

[A] This is Hello World

***

```c
/* Question 8
 * What is the output of the program?
 */
// sizeof(char) is 1, sizeof(char*) is 4
#define SIZEOFARRAY(x) sizeof(x)/sizeof(x)
void main()
{
    char a = "12";
    for (int i = 0; i< SIZEOFARRAY(a); i++)
        printf("%c", a[i] ? a[i] : '*');
}
```

**Options:**

- [A] 12****
- [B] 12
- [C] 12Garbage
- [D] 12000

**Answer:**

[A] 12****

***

```c
/* Question 9
 * What is the output of the program?
 */
void main()
{
    char str[ ] = "Twinkle\0 Twinkle Little Star" ;
    printf("%s %c %c %s", str, *(str + 11), *(str + 24), str + 17) ;
}
```

**Options:**

- [A] Twinkle Twinkle Little Star
- [B] Twinkle i S Little Star
- [C] Twinkle Little Star
- [D] Twinkle Little Star Twinkle

**Answer:**

[B] Twinkle i S Little Star

***

```c
/* Question 10
 * What is the output of the program?
 */
//sizeof(short) is 2 BYTEs
struct numbers {
    short num1;
    char c;
    short num2;
    short num3;
};
int sum(const struct numbers* myNumber)
{
    int total = 0;
    const short* ptr = &myNumber->num1;
    for (; ptr<= &myNumber->num3; ptr++)
    {
        total += *(ptr);
    }
    return total;
}
void main()
{
    struct numbers myNumber = { 1, 'a', 2, 3 };
    printf("%d", sum(&myNumber));
}
```

**Options:**

- [A] 3
- [B] 6
- [C] 5
- [D] Garbage

**Answer:**

[D] Garbage

***

```c
/* Question 11
 * What is the output for find(a)?
 */
char a = "312443459910";
void find(char* str)
{
    if(!str || !strlen(str)) return;
    char* lastIndex = str, *curIndex = str+1;
    while(*curIndex){
        if(*lastIndex != *curIndex){
            *++lastIndex = *curIndex;
        }
        ++curIndex;
    }
    *++lastIndex = '\0';
    printf("%s",str);
}
```

**Options:**

- [A] 0123459
- [B] 3124345910
- [C] Segmentation fault or R.T.E
- [D] 3124590

**Answer:**

[B] 3124345910

***

```text
Question 12
If int n = 20, d = 16; find value of n& (d-1) = ?
```

**Options:**

- [A] 20
- [B] 16
- [C] 36
- [D] 4

**Answer:**

[D] 4

***

```text
Question 13
char anyChar; (could be any valid ASCII character)
Give an expression that checks if anyChar is digit (0, 1, 2 .... 8, 9) or not?
```

**Options:**

- [A] anyChar> 48 || anyChar< 58
- [B] anyChar>= 48 && anyChar< 58
- [C] anyChar> 48 && anyChar< 58
- [D] anyChar>= 48 || anyChar< 58

**Answer:**

[B] anyChar>= 48 && anyChar< 58

***

```c
/* Question 14
 * What is the output of the program?
 */
enum Color{ RED=1, GREEN=2, BLUE=4 };
void main()
{
    enum Color rat;
    enum Color cat;
    rat = RED;
    cat = GREEN;
    if (rat == BLUE)
        printf("Your rat is Blue\n");
    if (cat == GREEN)
        printf("Your cat is Green");
}
```

**Options:**

- [A] `Your rat is Blue`
- [B] `No output`
- [C] `Your rat is Blue \n Your cat is Green`
- [D] `Your cat is Green`

**Answer:**

[D] `Your cat is Green`

***

```c
/* Question 15
 * What is the output of the program?
 */
void main()
{
    char c = 10;
    for (c = 0; c++; );
    printf("c is = %d ", c);
}
```

**Options:**

- [A] c is = 127
- [B] c is = 1
- [C] c is = 0
- [D] c is = -128

**Answer:**

[B] c is = 1

***

```c
/* Question 16
 * What is the output of the program?
 */
void main()
{
    int i = 1, j = 0;
    for (; i<= 5; i++) {
        for (j = 5 - i; j > 0; j--) {
            printf("+");
        }
        printf("%d\n", i);
    }
}
```

**Options:**

- [A] `++++1 \n +++2 \n ++3 \n 5`
- [B] `++++1 \n ++3 \n +4 \n 5`
- [C] `++++1 \n +++2 \n ++3 \n +4 \n 5`
- [D] `++++1 \n +++2 \n ++5`

**Answer:**

[C] `++++1 \n +++2 \n ++3 \n +4 \n 5`

***

```c
/* Question 17
 * If we call Pointers from main what is the output?
 */
void Pointers()
{
    int a = 10, b = 20;
    int *p = &a, *q = &b;
    int **m = &p, **n = &q;
    printf("X: %d %d %d %d %d\n", **m, **n, *p, *q, a, b);
    *m = *n; m = n;
    *m = &a; n = &p;
    **n = 30;
    printf("Y: %d %d %d %d %d %d\n", **m, **n, *p, *q, a, b);
}
```

**Options:**

- [A] `X: 10 20 10 20 10 20 \n Y: 10 30 30 10 10 30`
- [B] `X: 10 20 10 20 10 20 \n Y: 10 30 20 10 10 20`
- [C] `X: 10 20 10 20 10 20 \n Y: 10 10 30 10 30 30`
- [D] `X: 10 20 10 20 10 20 \n Y: 10 20 30 10 20 30`

**Answer:**

[A] `X: 10 20 10 20 10 20 \n Y: 10 30 30 10 10 30`

***

```c
/* Question 18
 * What is the output of the program?
 */
void main()
{
    int a = 1, b = 1;
    int value = ( !! a + !! b == 1 + (!a == !b));
    printf("%d", value);
}
```

**Options:**

- [A] True
- [B] 0
- [C] 3
- [D] 2

**Answer:**

[A] True

***

```c
/* Question 19
 * What is the output of the program?
 */
int car(char* src, char* dest)
{
    if(!*src)
        return 0;
    return *src==*dest ? car(++src, ++dest) : *src-*dest;
}
void main()
{
    char a[ ] = "Googla", b[ ] = "Googlb";
    printf("%d\n", car(a, b));
}
```

**Options:**

- [A] -1
- [B] 0
- [C] Segmentation fault
- [D] 1

**Answer:**

[A] -1

***

```c
/* Question 20
 * What is the output of the program?
 */
int get(char c)
{
    return c-'0';
}
int compute(char* a)
{
    int value = 0;
    while (*a) {
        value += get(*a++);
    }
    return value;
}
void main()
{
    char buf[ ] = "12345";
    printf("%d", compute(buf));
}
```

**Options:**

- [A] 5
- [B] 20
- [C] 15
- [D] 6

**Answer:**

[C] 15

***

```c
/* Question 21
 * What will this code do?
 */
void fav(char* str)
{
    char* last = str;
    while (*str == ' ')
        ++str;
    while (*last++ = *str++);
}
```

**Options:**

- [A] Removes all the empty spaces in the given string (str)
- [B] Removes all the non-empty spaces in the given string (str)
- [C] Removes all the empty spaces at the start of the given string (str)
- [D] Removes all the empty spaces at the end of the given string (str)

**Answer:**

[C] Removes all the empty spaces at the start of the given string (str)

***

```c
/* Question 22
 * What is the output of the program?
 */
void main()
{
    int i = 6, count = 1;
    switch (i % 2) {
    case 0:
        ++count;
        break;
    case 1:
        count *= 4;
        break;
    default:
        count += 2;
        break;
    }
    printf("%d", count);
}
```

**Options:**

- [A] 4
- [B] 1
- [C] 2
- [D] 3

**Answer:**

[C] 2

***

```c
/* Question 23
 * What is the output of the program?
 */
void main()
{
    char arr[] = "12345";
    arr[sizeof(arr)] = '\0';
    printf("%s", arr);
}
```

**Options:**

- [A] 12345
- [B] 1
- [C] 5
- [D] 6

**Answer:**

[A] 12345

***

```c
/* Question 24
 * What is the value of n to get add result as 720?
 */
int add(int n)
{
    int i = n, sum=0;
    if (n==0)
        return 1;
    while (i--)
        sum += add(n-1);
    return sum;
}
```

**Options:**

- [A] 6
- [B] 2012-09-15 00:00:00

**Answer:**

[A] 6

***

```text
Question 25
Binary representation of 77 is
```

**Options:**

- [A] 1101101
- [B] 1000101
- [C] 1001001
- [D] 1001101

**Answer:**

[D] 1001101

***

```c
/* Question 26
 * What is the output of the program?
 */
void main()
{
    int a;
    for(a = 1; a <=5; break)
    {
        printf("%d",a)
    }
}
```

**Options:**

- [A] 12345
- [B] None of the Above
- [C] 1
- [D] Error

**Answer:**

[D] Error

***

```c
/* Question 27
 * What is the output of the program?
 */
typedef struct
{
    int a;
}my;
int sum(my* s1)
{
    int val = 0, *p = s1->a;
    for (int i = 0; i<sizeof(s1->a)/sizeof(s1->a); i++)
        val += *p++;
    return val;
}
void main()
{
    my s1 = {1, 2, -2, -4, 5};
    printf("%d ", sum(&s1));
}
```

**Options:**

- [A] 2
- [B] RTE
- [C] -8
- [D] 8

**Answer:**

[A] 2

***

```c
/* Question 28
 * What is the output of the program?
 */
void main()
{
    float f;
    printf("%d ", sizeof(f));
}
```

**Options:**

- [A] 4
- [B] 12
- [C] 36
- [D] RTE

**Answer:**

[A] 4

***

```c
/* Question 29
 * What is the output of the program?
 */
#define SIZEOFARRAY(x) sizeof(x)/sizeof(x)
void main()
{
    char* arr[] = {"Joe", "Roe1", "Toe23", "Zoe456"};
    printf("%d", SIZEOFARRAY(arr));
}
```

**Options:**

- [A] 17
- [B] 3
- [C] 4
- [D] 5

**Answer:**

[C] 4

***

```c
/* Question 30
 * What does function sys do?
 */
int sys(int* p, int n)
{
    if (!p || n < 0)
        return 12345678;
    if (n==0)
        return p[n];
    int cur = foo(p, n-1);
    return cur > p[n] ? cur : p[n];
}
```

**Options:**

- [A] Finds the minimum in the given array of chars
- [B] Finds the maximum in the given array of chars
- [C] Finds the maximum in the given array of ints
- [D] Finds the minimum in the given array of ints

**Answer:**

[C] Finds the maximum in the given array of ints

***

```c
/* Question 31
 * After calling find(s1,s2); function from main what will be s1[] and s2[]?
 */
char s1[ ] = "Andhra", s2[ ] = "TeluguPradesh";
void find(char* s1, char* s2)
{
    if(s1 && s2 &&strlen(s1) > 0){
        int index = 0, numChars = strlen(s1);
        while(index <numChars){
            char temp = s1[index];
            s1[index] = s2[index];
            s2[index] = temp;
            ++index;
        }
    }
}
```

**Options:**

- [A] s1[ ] = "Telugu", s2[ ] = "AndhraPradesh";
- [B] s1[ ] = "TeluguPradesh", s2[ ] = "Pradesh";
- [C] s1[ ] = "AndhraTelugu", s2[ ] = "Andhra";
- [D] s1[ ] = "TeluguPradesh", s2[ ] = "Telugu";

**Answer:**

[A] s1[ ] = "Telugu", s2[ ] = "AndhraPradesh";

***

```c
/* Question 32
 * What is the output of the program?
 */
void main()
{
    int a;
    a[-1] = 1234;
    printf("%d\n", a);
}
```

**Options:**

- [A] R.T.E
- [B] 1234
- [C] Garbage
- [D] 0

**Answer:**

[C] Garbage

***

```c
/* Question 33
 * What is the output of the program?
 */
void out(char* s)
{
    int len = strlen(s)-1, i = 0;
    while (i<len) {
        char temp = s[i];
        s[i] = s[len];
        s[len] = temp;
        i++;
        len--;
    }
}
void main()
{
    char a[ ] = "Textbook";
    out(a);
    printf(a);
}
```

**Options:**

- [A] koobtxet
- [B] koobTxeT
- [C] Txetkoob
- [D] Textbook

**Answer:**

[B] koobTxeT

***

```c
/* Question 34
 * What is the output of the program?
 */
void car(int x, char **y)
{
    int local = (x * x) - 7;
    y += 2;
    y[local] = "Rose";
}
void main()
{
    char* arr[] = {"1234", "5678", "9ABC", "DEFG", "HIJK", "LMNOP"};
    car(3, arr);
    printf("%s ", arr);
}
```

**Options:**

- [A] hijk
- [B] defg
- [C] Rose
- [D] crash

**Answer:**

[C] Rose

***

```c
/* Question 35
 * What is the output of the program?
 */
void main()
{
    int a = 100;
    printf("%d%d" + 2, a);
}
```

**Options:**

- [A] 100
- [B] 1002
- [C] %d
- [D] 102

**Answer:**

[C] %d

***

```c
/* Question 36
 * What is the output of the program?
 */
#define FIRST_PART 7
#define LAST_PART 5
#define ALL_PARTS FIRST_PART + LAST_PART
void main()
{
    printf("%d\n", ALL_PARTS * ALL_PARTS);
}
```

**Options:**

- [A] 35
- [B] 47
- [C] 144
- [D] 49

**Answer:**

[B] 47

***

```c
/* Question 37
 * What is the output of the program?
 */
//sizeof(int) is 4, sizeof(char*) is 4
typedef struct{
    int a;
}tag;
int size(tag* s1)
{
    return sizeof(s1->a)/sizeof(s1->a);
}
void main()
{
    tag s1 = { 1, 2, -2, -4, 5};
    printf("%d\n", size(&s1));
}
```

**Options:**

- [A] 5
- [B] 10
- [C] 40
- [D] 20

**Answer:**

[B] 10

***

```c
/* Question 38
 * What is the output of the program?
 */
int add(int i, int j)
{
    return i+j;
}
void mySwap(int* i, int* j)
{
    int temp = *i;
    *i = *j;
    *j = temp;
}
void main()
{
    int i = 2, j = 3;
    printf("%d = ", add(i, j));
    mySwap(&i, &j);
    printf("%d", add(i, j));
}
```

**Options:**

- [A] 5 = 5
- [B] 5 = 6
- [C] Garbage = 6
- [D] 5 = Garbage

**Answer:**

[A] 5 = 5

***

```c
/* Question 39
 * What is the output of the program?
 */
void star(char src[ ], char* dest)
{
    if (sizeof(src) == sizeof(dest))
        printf("The given two arrays are of equal size");
    else
        printf("The given two arrays are of different size");
}
void main()
{
    char src = "123", dest = "1234";
    star(src, dest);
}
```

**Options:**

- [A] The given two arrays are of equal size
- [B] The given two arrays are of different size
- [C] None of these
- [D] Segmentation fault or run-time error

**Answer:**

[A] The given two arrays are of equal size

***

```c
/* Question 40
 * What is the output of the program?
 */
void fun(char* cPtr)
{
    if (!cPtr)
        return;
    strcpy(cPtr, "Lion");
}
void main()
{
    char cPtr[] = "Tiger";
    fun(cPtr);
    printf("%s", cPtr);
}
```

**Options:**

- [A] Garbage
- [B] Lion
- [C] Tiger
- [D] R.T.E

**Answer:**

[B] Lion

***

```c
/* Question 41
 * What is the output of the program?
 */
void main()
{
    int x = 27, l = 3, s = 5;
    --l, --s;
    x = ((x >> l) & 1) ^ ((x >> s) & 1) ? x ^ ((1 << l) | (1 << s)) : x;
    printf("%d", x);
}
```

**Options:**

- [A] 27
- [B] 3
- [C] 15
- [D] 5

**Answer:**

[C] 15

***

```c
/* Question 42
 * What is the output of the program?
 */
int recurse(int value)
{
    return (value ? recurse(value--) : printf("%d", value));
}
void main()
{
    recurse(6);
}
```

**Options:**

- [A] It will print 0
- [B] It will print 6
- [C] Recurse till stackoverflow happens
- [D] It will print 654321

**Answer:**

[C] Recurse till stackoverflow happens

***

```text
Question 43
Output of 0xdeadbeef | 0x00005500
```

**Options:**

- [A] 0xdead00ef
- [B] 0xdeadFFef
- [C] 0xbeadFFef
- [D] 0xdeadF0ef

**Answer:**

[B] 0xdeadFFef

***

```c
/* Question 44
 * Assume allocateMemory is suppose to allocate memory dynamically to hold a string of length 'n'.
 * Can you fill in the blank?
 * example: allocateMemory(strlen("hey"));
 */
char* allocateMemory(unsigned int n)
{
    char* a = (char*)malloc(_________________);
    return a;
}
```

**Options:**

- [A] sizeof(char) * (n - 1)
- [B] sizeof(char) * (n + 1)
- [C] sizeof(short) * n
- [D] sizeof(char) * n

**Answer:**

[B] sizeof(char) * (n + 1)

***

```c
/* Question 45
 * What is the output of the program?
 */
void main()
{
    int sum = 0, n = 16;
    int amount = n;
    while (n > 0) {
        sum += amount;
        n /= 2;
    }
    printf("%d", sum);
}
```

**Options:**

- [A] 68
- [B] 88
- [C] 76
- [D] 80

**Answer:**

[D] 80

***

```c
/* Question 46
 * If I call myfun(2) from main what happens?
 */
void myfun(int a)
{
    printf("Inside %d\n", a);
    if (a > 0)
        myfun(a-1);
    printf("Outside %d\n", a);
}
```

**Options:**

- [A] `Inside 2 \n Inside 1 \n Inside 0 \n Outside 0 \n Outside 1 \n Outside 2`
- [B] `Inside 2 \n Inside 1 \n Inside 0 \n Outside 0`
- [C] `Inside 2 \n Inside 1 \n Outside 1 \n Outside 2`
- [D] `Inside 2 \n Inside 1 \n Inside 0 \n Outside 2 \n Outside 1 \n Outside 0`

**Answer:**

[A] `Inside 2 \n Inside 1 \n Inside 0 \n Outside 0 \n Outside 1 \n Outside 2`

***

```c
/* Question 47
 * What is the output of the program?
 */
void main()
{
    int done, i, x = 62, MAXI = 100;
    done = i = 0;
    for (i = 0; (i< MAXI) && (x >>= 2) > 1; i++)
        done++;
    printf("%d",i);
}
```

**Options:**

- [A] 3
- [B] 2
- [C] 4
- [D] 1

**Answer:**

[B] 2

***

```c
/* Question 48
 * What is the output of the program?
 */
int len(char* str)
{
    return *str &&str ?strlen(str) + len(str+1) : 0;
}
void main()
{
    char arr[] = "12345";
    printf("%d", len(arr));
}
```

**Options:**

- [A] 6
- [B] R.T.E
- [C] 5
- [D] 15

**Answer:**

[D] 15

***

```c
/* Question 49
 * If we call function(10,2); from main then what is output?
 */
int function(int x, int y)
{
    return !x ? 0 : y + function(x-1, y);
}
```

**Options:**

- [A] 20
- [B] 10
- [C] 9
- [D] 1

**Answer:**

[A] 20

***

```c
/* Question 50
 * Observe the code and select suitable option?
 */
void main()
{
    char Array[] = "Hello!";
    const char* cPtr = Array;
    *cPtr = 'Z'; // Line 4
}
```

**Options:**

- [A] Line 4 is possible because cPtr is a const pointer
- [B] Line 4 is possible because cPtr is pointer to a constant
- [C] Line 4 is not possible because cPtr is a const pointer
- [D] Line 4 is not possible because cPtr is pointer to a constant

**Answer:**

[D] Line 4 is not possible because cPtr is pointer to a constant

***

```c
/* Question 51
 * What will be the output of the program?
 */
void main()
{
    int count = 100, sum = 1;
    for (; count--; )
        sum++;
    printf("sum = %d count = %d",sum,count);
}
```

**Options:**

- [A] sum = 102, count = -1
- [B] sum = 101, count = 0
- [C] sum = 101, count = -1
- [D] sum = 102, count = 0

**Answer:**

[C] sum = 101, count = -1

***

```c
/* Question 52
 * Answer the following questions by seeing below code?
 * 1) Will a.name, p.name point to the same memory location?
 * 2) Will &a.id, &p.id point to the same memory location?
 * 3) Will copy of entire 'a' be passed to print_person?
 */
typedef struct
{
    char name;
    int id;
}person;
void print_person(person p)
{
    printf("%d", p.id);
    printf("%s", p.name);
}
void main()
{
    person a = { "Rahul", 932176 };
    print_person(a);
}
```

**Options:**

- [A] No, Yes, No
- [B] No, No, Yes
- [C] Yes, Yes, No
- [D] Yes, Yes, Yes

**Answer:**

[B] No, No, Yes

***

```c
/* Question 53
 * What is the output of the program?
 */
void main()
{
    int a = 0;
    printf("%d ", ++a);
    printf("%d ", a--);
    printf("%d ", --a);
    printf("%d ", a++);
    printf("%d ", a);
}
```

**Options:**

- [A] 10-1-10
- [B] 11-1-11
- [C] 11-1-10
- [D] 01-01-10

**Answer:**

[C] 11-1-10

***

```c
/* Question 54
 * If initially char a = 'A';
 * Then a = ?
 */
if ((a == 'A') || (a = 'L') || (a == 'z'))
    a = 'a';
```

**Options:**

- [A] 'L'
- [B] 'A'
- [C] 'a'
- [D] 'z'

**Answer:**

[C] 'a'

***

```c
/* Question 55
 * What will be the output of the program?
 */
void main()
{
    char Array = "meenie";
    int len = strlen(Array);
    for (int i = 0; i<len; i++)
        printf("%c", Array[i]);
}
```

**Options:**

- [A] `meenie`
- [B] `meeniegarbage`
- [C] `m \n e \n e \n n \n i \n e`
- [D] `Segmentation fault or run-time error`

**Answer:**

[A] `meenie`

***

```c
/* Question 56
 * What is the output of the program?
 */
void main()
{
    int result = 1, n = 10, k;
    for (k = 0; k < n; k++)
        result *= 2;
    printf("%d", result);
}
```

**Options:**

- [A] 128
- [B] 1024
- [C] 256
- [D] 512

**Answer:**

[B] 1024

***

```c
/* Question 57
 * What is the output of the program?
 */
void main()
{
    int var = 0, count = 0;
    for (var = 100; var > -200; var--) {
        if (var < 1)
            break;
        printf("%d ", var);
    }
}
```

**Options:**

- [A] Prints 100 99 .... 3 2 with the decrements of 1
- [B] Prints 1 2 3 .... 99 100 with the increments of 1
- [C] Prints 100 99 .... 3 2 1 0 with the decrements of 1
- [D] Prints 100 99 .... 3 2 1 with the decrements of 1

**Answer:**

[D] Prints 100 99 .... 3 2 1 with the decrements of 1

***

```text
Question 58
unsigned short int bitMask = 1, index = ?, num = 256;
bitMask<<= index - 1;
num |= bitMask;
unsigned short int is a 2 BYTEs unsigned data type.
The value of num is 256, guess the value of index.
Hint: index is between 1 and 16
```

**Options:**

- [A] index = 6
- [B] index = 8
- [C] index = 9
- [D] index = 7

**Answer:**

[C] index = 9

***

```c
/* Question 59
 * What is the output of the program?
 */
void main()
{
    int a = 0x32, b = 32;
    int c = a & b;
    printf("%d", c);
}
```

**Options:**

- [A] 0x32
- [B] 0x20
- [C] 20
- [D] 0

**Answer:**

[B] 0x20

***

```c
/* Question 60
 * An approximate value of 'a' is
 */
void main()
{
    int x, y, z;
    float a, b;
    x = 3; y = 5.3; z = 2;
    a = 2.5; b = 3.14;
    x += y + a * z - b;
    a = b / (x % y + z);
    printf("%d", a);
}
```

**Options:**

- [A] 0.5
- [B] 4
- [C] 0.4
- [D] 5

**Answer:**

[A] 0.5

***

```c
/* Question 61
 * What happens when you call this from main()?
 */
void globalfunction()
{
    int global = 4;
    while (global--) {
        global--;
        int global = 200;
        global--;
        printf("local is %d\n", global);
    }
}
```

**Options:**

```text
- [A] Infinite Loop
- [B] local is 199 \n local is 199
- [C] local is 199 \n local is 198 \n local is 197 \n this continues until global reaches 0
- [D] local is 2 \n local is 1
```

**Answer:**

[B] `local is 199 \n local is 199`

***

```c
/* Question 62
 * What is the output of the program?
 */
#define TRUE 1
#define FALSE 0
void main()
{
    int a = TRUE;
    printf("a = %d ", a = (a == FALSE));
    printf("a = %d ", a = (a == FALSE));
}
```

**Options:**

- [A] a = 0 a = 1
- [B] a = 1 a = 1
- [C] a = 0 a = 0
- [D] a = 1 a = 0

**Answer:**

[A] a = 0 a = 1

***

```c
/* Question 63
 * What is the output of the program?
 */
//sizeof(char*) is 4
void main()
{
    int* iPtr;
    unsigned int* uiPtr;
    printf("%d, ", sizeof(iPtr));
    printf("%d ", sizeof(uiPtr));
}
```

**Options:**

- [A] 8, 8
- [B] 4, 2
- [C] 4, 4
- [D] 2, 4

**Answer:**

[C] 4, 4

***

```c
/* Question 64
 * Choose the suitable option
 */
const char *p;
char* const q;
A) *p = 'A';
B) p = "hello";
C) *q = 'A';
```

**Options:**

- [A] All the options
- [B] B is legal
- [C] A is illegal
- [D] C is legal

**Answer:**

[A] All the options

***

```c
/* Question 65
 * If we call recur(9) from main Output?
 */
int recur(int n)
{
    int total = 0;
    int k, j;
    if (!n)
        return 1;
    for (k = 1; k < 6; k++)
    {
        total += recur(n/3);
        j = k/3;
        total -= j%k;
    }
    return total;
}
```

**Options:**

- [A] 2024-08-16 00:00:00

**Answer:**

[A] 2024-08-16 00:00:00 *(Note: The quiz platform has erroneously formatted the true answer as a date).*

***

```c
/* Question 66
 * A boy says the output of compute(base, exp) is -27.0, guess the value of base and exp?
 */
double compute(double base, int exp)
{
    if (!exp)
        return 1.0;
    double value = compute(base,exp/2);
    return exp%2? base*value*value : value*value;
}
```

**Options:**

- [A] base = 3, exp = -3
- [B] base = 27, exp = 1
- [C] base = 27, exp = 0
- [D] base = -3, exp = 3

**Answer:**

[D] base = -3, exp = 3

***

```c
/* Question 67
 * If N value is 3 then Output?
 */
int Recur(int N)
{
    int total = 0, k, j;
    if (!N)
        return 1;
    if (N%3 != 1)
        total += 5 * Recur(N/6);
    if (N%3 != 2)
        total += 7 * Recur(N/6);
    return total;
}
```

**Options:**

- [A] 60
- [B] 35
- [C] 12
- [D] 29

**Answer:**

[C] 12

***

```c
/* Question 68
 * What is the output of the program?
 */
void main()
{
    char str1[] = "abc";
    char str2[] = "abc";
    if (!strcmp(str1, str2))
        printf("str1 and str2 are equal\n");
    else
        printf("No, they are not.");
}
```

**Options:**

- [A] Run-time error
- [B] No output
- [C] str1 and str2 are equal
- [D] No; they are not

**Answer:**

[C] str1 and str2 are equal

***

```c
/* Question 69
 * Can you figure out the output?
 */
typedef struct
{
    double x;
    double y;
}point;
void reset(point p)
{
    p.x = p.y = 0;
}
void main()
{
    point a = { 12.0, 42.0 };
    point b = a;
    reset(a);
    b.x = 0;
    printf("a: %.1f, %.1f\n", a.x, a.y);
    printf("b: %.1f, %.1f\n", b.x, b.y);
}
```

**Options:**

- [A] `a: 12.0, 0.0 \n b: 0.0, 42.0`
- [B] `a: 0.0, 42.0 \n b: 0.0, 42.0`
- [C] `a: 0.0, 0.0 \n b: 0.0, 42.0`
- [D] `a: 12.0, 42.0 \n b: 0.0, 42.0`

**Answer:**

[D] `a: 12.0, 42.0 \n b: 0.0, 42.0`

***

```c
/* Question 70
 * What is the output of the program?
 */
// sizeof(int) is 4
void main()
{
    int a;
    printf("%d ", sizeof(a));
}
```

**Options:**

- [A] 24
- [B] 4
- [C] Array out of bound error
- [D] 1

**Answer:**

[B] 4

***

```c
/* Question 71
 * What is the output of the program?
 */
#define SIZEOFARRAY(x) sizeof(x)/sizeof(x)
void copy(int* a1, int* a2, int count)
{
    memcpy(a2, a1, count);
}
void main()
{
    int a1[ ] = {1, 2, 3}, a2[ ] = {3, 2, 1};
    copy(a1, a2, sizeof(a1));
    for (int i = 0; i< SIZEOFARRAY(a2); i++)
        printf("%d ", a2[i]);
}
```

**Options:**

- [A] 1 2 1
- [B] 3 2 3
- [C] 3 2 1
- [D] 1 2 3

**Answer:**

[D] 1 2 3

***

```c
/* Question 72
 * Ram says calling mul(a, b) with b as negative value or zero results in stack overflow. Do you agree, if so why?
 */
// sizeof(int) is 4 bytes
int mul(int a, int b)
{
    static int pt = 0;
    if (b == 1)
        pt = a;
    else
        pt = a + mul(a, b-1);
    return pt;
}
```

**Options:**

- [A] I agree, the data type of pt should be "long long" instead of "int"
- [B] I agree, the storage class of pt should be "automatic" instead of "static"
- [C] I don't agree because the recursive function has well defined base condition a
- [D] I agree, when b is negative or zero, further recursive call will pass decremented value

**Answer:**

[D] I agree, when b is negative or zero, further recursive call will pass decremented value

***

```c
/* Question 73
 * What is the output of the program?
 */
#define prn(a)printf("%d", a)
#define print(a,b,c) prn(a), prn(b), prn(c)
#define max(a,b) (a<b)? b:a
void main()
{
    int x = 1, y = 2;
    print(max(x++,y), x, y);
    print(max(x++,y),x, y);
}
```

**Options:**

- [A] 223342
- [B] 222332
- [C] 232342
- [D] 222342

**Answer:**

[D] 222342

***

```c
/* Question 74
 * What is the output of the program?
 */
void out(char* s)
{
    int len = strlen(s), i = 0;
    while (i<len) {
        char temp = s[i];
        s[i] = s[len-1];
        s[len-1] = s[i];
        i++;
    }
}
void main()
{
    char a[] = "Batman";
    out(a);
    printf(a);
}
```

**Options:**

- [A] namtab
- [B] abmtna
- [C] No output
- [D] tabnam

**Answer:**

[C] No output

***

```c
/* Question 75
 * What is the output of the program?
 */
int sum(int* a)
{
    int val = 0, b = 0;
    while (a[b]) {
        val += a[b++];
    }
    return val;
}
void main()
{
    int a[ ] = {4, 9, 3, -2, 0, 2, 15};
    printf("%d\n", sum(a));
}
```

**Options:**

- [A] 14
- [B] 0
- [C] 12
- [D] 29

**Answer:**

[A] 14

***

```c
/* Question 76
 * Can you answer the following questions based on below code?
 * 1) Is there any memory leak when master is called?
 * 2) If there is memory leak, then how many bytes are leaked for master(10)?
 */
//sizeof(int) is 4 BYTEs
void master(int x)
{
    int* a = (int*)malloc(x * sizeof(int));
    a[ 0] = 10;
    *(a + 1) = *a;
    for (int i = 0; i<sizeof(int); i++)
        printf("%d ", a[i]);
}
```

**Options:**

- [A] Yes. 20 BYTEs
- [B] Yes. 40 BYTEs
- [C] No. 0 BYTEs
- [D] Yes. 10 BYTEs

**Answer:**

[B] Yes. 40 BYTEs

***

```c
/* Question 77
 * Choose Your option?
 */
void main()
{
    char* cPtr1 = "Mickey";
    char* cPtr2 = "Minnie";
    cPtr1 + cPtr2; // Line 4
    cPtr1 - cPtr2; // Line 5
    cPtr1 * cPtr2; // Line 6
    cPtr1 / cPtr2; // Line 7
}
```

**Options:**

- [A] Line 4 is allowed
- [B] Line 6 is allowed
- [C] Line 5 is allowed
- [D] Line 7 is allowed

**Answer:**

[C] Line 5 is allowed

***

```c
/* Question 78
 * If int a = -32, b = 32;
 * int c = a ^ b;
 * c =?
 */
```

**Options:**

- [A] 32
- [B] -32
- [C] -64
- [D] 0

**Answer:**

[C] -64

***

```c
/* Question 79
 * unsigned short int i, count = 0;
 * for (i = 0; i<= -1; i++)
 *     ++count;
 * //unsigned short int is 2 BYTEs unsigned data type.
 * Then count =?
 */
```

**Options:**

- [A] 65536
- [B] 65535
- [C] 1
- [D] False

**Answer:**

[D] False

***

```c
/* Question 80
 * What is the output of the program?
 */
int fav(char* src, char* dest)
{
    if (!*src)
        return 0;
    if (*src==*dest)
        return 1 + fav(++src, ++dest);
    return 1;
}
void main()
{
    char a[ ] = "Maram", b[ ] = "Madam";
    printf("%d", fav(a, b));
}
```

**Options:**

- [A] 3
- [B] 0
- [C] 2
- [D] 1

**Answer:**

[A] 3

***

```text
Question 81
Sachin says signed int is 4 BYTEs signed data type. If INT_MAX refers to the maximum value of signed int guess the value?
```

**Options:**

- [A] (2 power 32) - 1
- [B] (2 power 32)
- [C] (2 power 31)
- [D] (2 power 31) - 1

**Answer:**

[D] (2 power 31) - 1

***

```c
/* Question 82
 * Given two numbers a=12, b =36 write a method that return an integer value c=3612 without using arithmetic and string operations.
 */
#include<stdio.h>
#define concatenateNumbers(A,B) B##A
void main()
{
    int i;
    i = concatenateNumbers(12,36);
    printf("%d\n", i);
}
```

**Options:**

- [A] No output
- [B] 1236
- [C] Compiler throws an error
- [D] Above code will produce required output

**Answer:**

[D] Above code will produce required output

***

```c
/* Question 83
 * What is the output of the following code?
 */
void main()
{
    static int s;
    ++s;
    printf("%d ", s);
    if(s<=3)
        main();
    printf("%d ", s);
}
```

**Options:**

- [A] 1 2 3 4 3 2 1 0
- [B] 1 2 3 4 4 4 4 4
- [C] None of the above
- [D] 1 2 3 4 5 6 7 8

**Answer:**

[B] 1 2 3 4 4 4 4 4

***

```c
/* Question 84
 * What is the output of the following code?
 */
void main()
{
    int a=1;
    void xyz(int , int);
    xyz(++a, a++);
    xyz(a++, ++a);
    printf("%d", a);
}
void xyz(int x, int y)
{
    printf("%d %d ", x, y);
}
```

**Options:**

- [A] 3 1 4 4 4
- [B] 3 1 4 4 5
- [C] 3 1 3 4 5
- [D] 3 1 4 5 5

**Answer:**

[D] 3 1 4 5 5

***

```c
/* Question 85
 * What is the output of the following code?
 */
void main()
{
    int i;
    i = 10;
    printf("%d ",5, 6);
    printf("%d ", i, i++);
}
```

**Options:**

- [A] 2021-05-11 00:00:00
- [B] 6 11
- [C] 5 10
- [D] 6 10

**Answer:**

[A] 2021-05-11 00:00:00 *(Note: The quiz platform has erroneously formatted the true answer as a date).*

***

```c
/* Question 86
 * What is the output of the following code?
 */
void main()
{
    int a, b, c, d;
    a=b=c=d=1;
    a=++b>1 || ++c>1 && ++d>1;
    printf("%d %d %d %d", a, b, c, d);
}
```

**Options:**

- [A] 2 1 1 2
- [B] 2 2 2 2
- [C] 1 2 1 1
- [D] 2 1 2 1

**Answer:**

[C] 1 2 1 1

***

```c
/* Question 87
 * What is the output of the following code?
 */
void main()
{
    int sum = 0;
    for (int var = 10; var< 20; var = var+1)
    {
        sum = sum + var;
        ++var;
    }
    printf("%d", sum);
}
```

**Options:**

- [A] 40
- [B] 70
- [C] 60
- [D] 50

**Answer:**

[B] 70

***

```c
/* Question 88
 * int t, u = 0, n =?
 * for(t=n; t-1&t; t&=t-1);
 * u = ((n&t-1)<<1)+(n!=0);
 * Give some value to n, where u value becomes 1
 */
```

**Options:**

- [A] 62
- [B] 0
- [C] 256
- [D] 69

**Answer:**

[C] 256

***

```c
/* Question 89
 * What is the output of the program?
 */
void main()
{
    int i1 = 3, i2 = 3, i3 = 5, i4 = 5;
    if (!(i1 ^ i2 ^ i3 ^ i4))
        printf("i1=i2=i3=i4\n");
    else
        printf("i1!=i2!=i3!=i4\n");
}
```

**Options:**

- [A] i1=i2=i3=i4
- [B] Compilation error
- [C] i1!=i2!=i3!=i4
- [D] No output

**Answer:**

[A] i1=i2=i3=i4

***

```c
/* Question 90
 * What is the output of the program?
 */
void main()
{
    int a;
    printf("%d", scanf("%d", &a));    //'a' will be given as 10
}
```

**Options:**

- [A] None
- [B] True
- [C] Garbage
- [D] 10

**Answer:**

[B] True

***

```c
/* Question 91
 * What is the output of the program?
 */
void main()
{
    int word = 248, yes = 0;
    while (word > 0)
    {
        if ((word & 0xF) == 15)
        {
            yes = 1;
            break;
        }
        word>>= 1;
    }
    printf("%d %d", word, yes);
}
```

**Options:**

- [A] 31 1
- [B] 124 1
- [C] 100 0
- [D] 62 0

**Answer:**

[A] 31 1

***

```c
/* Question 92
 * int x, y, count = 0;
 * for (x = 4, y = 4; ((x > 3) && (y < 9)); x++, y += 2) {
 *     ++count;
 * }
 * count =?
 */
```

**Options:**

- [A] 4
- [B] 0
- [C] 1
- [D] 3

**Answer:**

[D] 3

***

```text
Question 93
A programmer has stored an 8-bit value in memory. The pointer char *ptr; points to the location where it is stored. He or she now wants to retrieve the value and store it into the variable: int value;
Which of the following (if any) will achieve this properly?
```

**Options:**

- [A] int value = (int)ptr;
- [B] value = (int)ptr;
- [C] int value = *(int*)ptr
- [D] value = ptr

**Answer:**

[C] int value = *(int*)ptr

***

```c
/* Question 94
 * What is the output of the program?
 */
void main()
{
    int x = 2, n = 12;
    while (x < n)
    {
        if (n % x == 0)
        {
            n = n / x;
            x = 2;
        }
        else
        {
            x++;
        }
    }
    printf("%d", x);
}
```

**Options:**

- [A] 0
- [B] 1
- [C] 2
- [D] 3

**Answer:**

[D] 3

***

```text
Question 95
The default parameter passing mechanism is
```

**Options:**

- [A] Call by address
- [B] Call by value
- [C] None of the above
- [D] Call by reference

**Answer:**

[B] Call by value

***

```c
/* Question 96
 * int a, b, n, result;
 * if (n)
 *     result = (a < 0 && b < 0);
 * else
 *     result = ((a < 0 && b > 0) || (a > 0 && b < 0));
 * Ramu wants to get value of result as 0, what values can you suggest for a, b and n to get result = 0?
 */
```

**Options:**

- [A] a = 1, b = 2, n = 1
- [B] a = -1, b = 2, n = -1
- [C] a = -1, b = -2, n = 0
- [D] a = -1, b = -2, n = 0

**Answer:**

[B] a = -1, b = 2, n = -1

***

```text
Question 97
Which option is correct about ++ operator
```

**Options:**

- [A] It is a unary operator
- [B] It can't be applied to an expression
- [C] The operand can come before or after operator
- [D] All of above

**Answer:**

[D] All of above

***

```c
/* Question 98
 * What is the output of the program?
 */
void main()
{
    int m = 6;
    switch (m!= 1) {
    case 0:
        m = 4;
        break;
    default:
        m += 3;
    case 5:
        ++m;
    }
    printf("%d", m);
}
```

**Options:**

- [A] 4
- [B] 7
- [C] 10
- [D] 5

**Answer:**

[C] 10

***

```c
/* Question 99
 * What is the output of the program?
 */
void main()
{
    int a=10, b=20;
    char c=1, d=0;
    if(a, b, c, d)
        printf("Text");
}
```

**Options:**

- [A] Compiler error
- [B] Text
- [C] None of the above
- [D] No output

**Answer:**

[D] No output

***

```c
/* Question 100
 * What is the output of the program?
 */
void main()
{
    int a=50; int b=15; int sum=0;
    while(b!=0) {
        if(a>b)
        {
            sum+=a;
            a-=b;
        }
        else
        {
            sum+=b;
            b-=a;
        }
    }
    printf(" %d ", sum);
}
```

**Options:**

- [A] 135
- [B] 130
- [C] 140
- [D] 14

**Answer:**

[A] 135

## Grand Test 2

```c
/* Question 1
 * Find the test value to print hello as output
 */
void main()
{
    int test = ??;
    if (test == -test)
    {
        printf("hello");
    }
}
```

**Options:**

- [A] 0
- [B] minimum value of integer
- [C] both a and b
- [D] maximum value of integer

**Answer:**

[C] both a and b

***

```c
/* Question 2
 * What is the output of the program?
 */
void main()
{
    int i;
    for(i = 10;i-->5;i=(i<5?i:i-1))
        printf("\n%d", i);
}
```

**Options:**

- [A] 8 6
- [B] 9 8 7 6 5
- [C] 9 7 5
- [D] 9 7 5 3 0

**Answer:**

[C] 9 7 5

***

```c
/* Question 3
 * What is the output of the program?
 */
void main()
{
    int i= 0100;
    printf("\n%d", i);
}
```

**Options:**

- [A] 4
- [B] 64
- [C] 512
- [D] Garbage value

**Answer:**

[B] 64

***

```c
/* Question 4
 * What is the output of the program?
 */
void main()
{
    int i;
    for(i = 0;i < 5;(++i)+1)
        printf("%d ",i);
}
```

**Options:**

- [A] 0 2 4
- [B] 1 2 3 4 5
- [C] 0 1 2 3 4

**Answer:**

[C] 0 1 2 3 4

***

```c
/* Question 5
 * What is the output of the program?
 */
void main()
{
    #include<stdio.h>
    int i =10;
    printf("%d",i);
}
```

**Options:**

- [A] No output
- [B] 10
- [C] Error
- [D] Garbage value

**Answer:**

[B] 10

***

```c
/* Question 6
 * What is the output of the program?
 */
void main()
{
    int x, y, z;
    x = y = 0;
    while(y <10)
    {
        x = x   +   ++y;
        printf("%d    %d\n", x, y);
    }
}
```

**Options:**

```text
- [A] None of the above
- [B] 1 1 \n 3 3 \n 6 3 \n 10 4 \n 15 5 \n 21 6 \n 28 7 \n 36 8 \n 45 9 \n 55 10
- [C] 1 1 \n 3 2 \n 10 4 \n 15 5 \n 21 6 \n 28 7 \n 36 8 \n 45 9 \n 55 10
- [D] 1 1 \n 3 2 \n 6 3 \n 10 4 \n 15 5 \n 21 6 \n 28 7 \n 36 8 \n 45 9 \n 55 9
```

**Answer:**

```text
[B] 1 1 \n 3 3 \n 6 3 \n 10 4 \n 15 5 \n 21 6 \n 28 7 \n 36 8 \n 45 9 \n 55 10
```

***

```c
/* Question 7
 * What is the output of the program?
 */
void main()
{
    int i=-3, j=2, k=0, m;
    m = ++i && ++j && ++k;
    printf("%d, %d, %d, %d\n", i, j, k, m);
}
```

**Options:**

- [A] -2, 3, 1, 1
- [B] 1, 2, 3, 1
- [C] 2, 3, 1, 2
- [D] 3, 3, 1, 2

**Answer:**

[A] -2, 3, 1, 1

***

```c
/* Question 8
 * What is the output of the program?
 */
void main()
{
    unsigned int a=3;
    unsigned int b=2;
    int x;
    x = a + (b < -1);
    printf("%d", x);
}
```

**Options:**

- [A] 4
- [B] 5
- [C] 3
- [D] Error

**Answer:**

[A] 4

***

```c
/* Question 9
 * What is the output of the program?
 */
void main()
{
    int a = 10;
    goto in;
    {
        int a = 20;
        in :
        {
            printf("%d",a);
        }
    }
}
```

**Options:**

- [A] 10
- [B] Error
- [C] 20
- [D] Garbage value

**Answer:**

[D] Garbage value

***

```c
/* Question 10
 * What is the output of the program?
 */
void main()
{
    int a=5;
    if (a=1)
    {
        printf("%d", a );
    }
}
```

**Options:**

- [A] The printf statement will never get executed
- [B] ntf statement will always get executed and the value of a will be printed as 5
- [C] ntf statement will always get executed and the value of a will be printed as 1
- [D] The program will encounter syntax error

**Answer:**

[C] ntf statement will always get executed and the value of a will be printed as 1

***

```c
/* Question 11
 * What is the output of the program?
 */
void main()
{
    extern int i;
    i = 20;
    printf("%d", i);
}
```

**Options:**

- [A] Error
- [B] Garbage value
- [C] 20
- [D] None of the above

**Answer:**

[A] Error

***

```c
/* Question 12
 * How many times Hello World will be printed in the following program?
 */
void main()
{
    int i, j, k;
    for(i = 1; i <= 2; ++i)
        for(j = 1; j <= i; ++j)
            for(k = i; k <= j; ++k)
                printf("Hello World\n");
}
```

**Options:**

- [A] 16
- [B] 2
- [C] 4
- [D] 8

**Answer:**

[B] 2

***

```c
/* Question 13
 * What is the output of the program?
 */
void main()
{
    int a;
    a = 1;
    do
    {
        ++a;
        printf("%d",a);
        if(a++ <=5)
        {
            continue;
        }
        printf("%d", a);
    }while(a++ <= 10);
}
```

**Options:**

- [A] Error
- [B] 0 2 5 8 9 11
- [C] 2 5 8 9 11 12
- [D] 2 3 4 5

**Answer:**

[D] 2 3 4 5

***

```c
/* Question 14
 * What is the output of the program?
 */
void f(n)
{
    if(n<=0)
        return 1;
    return n/f(n-1);
}
void main()
{
    printf("%d", f(4))
}
```

**Options:**

- [A] Error
- [B] 2
- [C] 3
- [D] 4

**Answer:**

[D] 4

***

```c
/* Question 15
 * What is the output of the program?
 */
void main()
{
    unsigned u;
    for(u = 5; u != 0; u = u - 2)
    {
        printf("%u", u);
    }
}
```

**Options:**

- [A] 5 3 2 1 0
- [B] Error
- [C] Infinite loop
- [D] 5 3 2 1

**Answer:**

[C] Infinite loop

***

```c
/* Question 16
 * What is the output of the program?
 */
void main()
{
    int i=0;
    int j=0;
    if(i && j++)
        printf("%d..%d", i++, j);
    printf("%d..%d", i, j);
}
```

**Options:**

- [A] 0..1
- [B] Error
- [C] 1..1
- [D] 0..0

**Answer:**

[D] 0..0

***

```c
/* Question 17
 * What is the output of the program?
 */
void main()
{
    int a = 0;
    int b = 20;
    char x =1;
    char y =10;
    if(a, b, x, y)
        printf("hello");
}
```

**Options:**

- [A] No output
- [B] None of the above
- [C] hello
- [D] Error

**Answer:**

[C] hello

***

```c
/* Question 18
 * What is the output of the program?
 */
void main()
{
    int i = 1;
    switch(i)
    {
        printf("Hello\n");
        case 1:
            printf("Hi\n");
            break;
        case 2:
            printf("\nBye\n");
            break;
    }
}
```

**Options:**

- [A] `Bye`
- [B] `Hi`
- [C] `Hello \n Hi`
- [D] `Hello \n Bye`

**Answer:**

[B] `Hi`

***

```c
/* Question 19
 * What is the output of the program?
 */
void main()
{
    int i;
    i = 1;
    while(i++ <= 3)
    {
        int i = 100;
        printf("%d", i);
        ++i;
    }
    printf("%d", i);
}
```

**Options:**

- [A] 100 101 102 103
- [B] 100 100 100 5
- [C] 1 2 3
- [D] Error

**Answer:**

[B] 100 100 100 5

***

```c
/* Question 20
 * What does the following program do?
 */
void main()
{
    unsigned int num ;
    int i;
    scanf("%u ", &num);
    for(i=0;i<16;i++)
        printf("%d",(num<<i & 1<<15) ? 1:0);
}//Assume value is given at runtime to scanf
```

**Options:**

- [A] prints binary equivalent of num
- [B] None of the above
- [C] print all even bits from num
- [D] print all odd bits from num

**Answer:**

[A] prints binary equivalent of num

***

```c
/* Question 21
 * How many times this loop will execute?
 */
void main()
{
    int a = 128, c = 0;
    while(a)
    {
        c++;
        a = ~a >> 1;
    }
}
```

**Options:**

- [A] 9
- [B] 6
- [C] 7
- [D] None of the above

**Answer:**

[A] 9

***

```c
/* Question 22
 * What is the output of the program?
 */
void main()
{
    int x = -1;
    while(x--) ;
    printf("%d", x);
}
```

**Options:**

- [A] 1
- [B] -1
- [C] 0
- [D] -32768

**Answer:**

[B] -1

***

```c
/* Question 23
 * If the expression if((a>=13 && a<=19) || (b>=13 && b<=19) || (c>=13 && c<=19)) evaluates to 0, what can you say about the values of a, b and c?
 */
```

**Options:**

- [A] Neither a nor b nor c has the value between 13 and 19 inclusive
- [B] All a & b & c have values between 13 and 19 inclusive
- [C] All a & b & c have positive values
- [D] Either a or b or c has a value between 13 and 19 inclusive

**Answer:**

[B] All a & b & c have values between 13 and 19 inclusive

***

```c
/* Question 24
 * What is the output of the program?
 */
void main()
{
    if(sizeof(int) > -1)
    {
        printf("Hello");
    }
    else
    {
        printf("Hai");
    }
}
```

**Options:**

- [A] Hai
- [B] Hello
- [C] Error
- [D] No output

**Answer:**

[A] Hai

***

```c
/* Question 25
 * What is the output of the program?
 */
void main()
{
    int a = 5;
    sizeof(++a);
    printf("%d", a);
}
```

**Options:**

- [A] 5
- [B] Garbage value
- [C] 6
- [D] No output

**Answer:**

[A] 5

***

```c
/* Question 26
 * What is the output of the program?
 */
void main()
{
    int x = 5, y = 7, a;
    a = x ^ ( (x ^ y) & ~(x < y));
    printf("%d", a);
}
```

**Options:**

- [A] 12
- [B] 0
- [C] 7
- [D] 5

**Answer:**

[C] 7

***

```c
/* Question 27
 * printf("%X", -1 << 4);
 */
```

**Options:**

- [A] No output
- [B] FFFF
- [C] FFF0
- [D] Error

**Answer:**

[C] FFF0

***

```c
/* Question 28
 * What is the output of the program?
 */
void main()
{
    int a,b;
    a = 5;
    b = ++a;
    printf("%d %d", a,b);
}
```

**Options:**

- [A] None of the above
- [B] 5 6
- [C] 6 6
- [D] 5 5

**Answer:**

[A] None of the above

***

```c
/* Question 29
 * int a=-1, b=-2;
 * int value=(!!a+!!b==1+(!a==b));
 * value=?
 */
```

**Options:**

- [A] True
- [B] -2
- [C] 1
- [D] 0

**Answer:**

[A] True

***

```c
/* Question 30
 * void main()
 * {
 *     unsigned int num;
 *     int count=0;
 *     for( ; num; num>>=1)
 *     {
 *         if(num & 1)
 *         {
 *             count++;
 *         }
 *     }
 * }
 * The count is 6 for a particular value of num. Guess that value of num?
 */
```

**Options:**

- [A] 126
- [B] 100
- [C] 77
- [D] 133

**Answer:**

[A] 126

***

```text
Question 31
Which of the following declaration is correct?
```

**Options:**

- [A] int long;
- [B] char float;
- [C] char int;
- [D] int length;

**Answer:**

[D] int length;

***

```c
/* Question 32
 * What is the output of the following code?
 */
void main()
{
    int i = 10, j = 2;
    printf("%d ", printf("%d  %d", i, j));
}
```

**Options:**

- [A] Compile time error
- [B] 10 2 2
- [C] 10 2 5
- [D] 10 2 4

**Answer:**

[C] 10 2 5

***

```c
/* Question 33
 * Which of the following is an invalid method for input?
 */
```

**Options:**

- [A] None of above
- [B] scanf("%d%d",&a,&b,&c);
- [C] scanf("Three values are %d%d%d", &a, &b, &c);
- [D] scanf("%d %d %d", &a, &b, &c);

**Answer:**

[C] scanf("Three values are %d%d%d", &a, &b, &c);

***

```c
/* Question 34
 * What is the output of the following code?
 */
void main()
{
    if(-2)
        printf("-ve is true ");
    else
        printf("-ve is false");
}
```

**Options:**

- [A] Compile time error
- [B] -ve is false
- [C] -ve is true
- [D] -ve is true -ve is false

**Answer:**

[C] -ve is true

***

```c
/* Question 35
 * What is the output of the following code?
 */
void main()
{
    char c = -64;
    int i = -32;
    unsigned int u = -16;
    if(c > i)
    {
        printf("pass1");
        if(c < u)
            printf("pass2 ");
        else
            printf("fail2 ");
    }
    else
        printf("fail1 ");
    
    if(i < u)
        printf("pass2 ");
    else
        printf("fail2 ");
}
```

**Options:**

- [A] fail2 pass2
- [B] fail2 pass1
- [C] fail1 pass2
- [D] pass2 fail1

**Answer:**

[C] fail1 pass2

***

```text
Question 36
By default a real number is treated as a
```

**Options:**

- [A] double
- [B] far double
- [C] long double
- [D] float

**Answer:**

[A] double

***

```c
/* Question 37
 * What is the output of the following code?
 */
void main()
{
    void v = 0;
    printf("%d", v);
}
```

**Options:**

- [A] None of these
- [B] No error
- [C] Program terminates abnormally
- [D] Error: Declaration syntax error 'v' (or) Size of v is unknown or zero

**Answer:**

[D] Error: Declaration syntax error 'v' (or) Size of v is unknown or zero

***

```c
/* Question 38
 * What is the output of the following code?
 */
void main()
{
    int x = 3;
    float y = 3.0;
    if(x == y)
        printf("You");
    else
        printf("Me");
}
```

**Options:**

- [A] Me
- [B] Unpredictable
- [C] You
- [D] No output

**Answer:**

[C] You

***

```c
/* Question 39
 * What will be the output of the program?
 */
void main()
{
    char ch;
    if(ch = printf(""))
        printf("It matters\n");
    else
        printf("It doesn't matter\n");
}
```

**Options:**

- [A] It matters
- [B] It doesn't matter
- [C] No output

**Answer:**

[B] It doesn't matter

***

```text
Question 40
Which of the following is not an operator in C?
```

**Options:**

- [A] #ERROR!
- [B] None of above

**Answer:**

[B] None of above

***

```c
/* Question 41
 * What will be the output of the program?
 */
void main()
{
    j = 100;
    printf("%d", j++);
}
```

**Options:**

- [A] 102
- [B] 100
- [C] Compile time error
- [D] 101

**Answer:**

[C] Compile time error

***

```c
/* Question 42
 * What will be the output of the program?
 */
void main()
{
    int x = 1, y = 0, z = 5;
    int a = x && y || z++;
    printf("%d", z);
}
```

**Options:**

- [A] varies
- [B] 5
- [C] 0
- [D] 6

**Answer:**

[D] 6

***

```c
/* Question 43
 * Which of the following is invalid statement?
 */
```

**Options:**

- [A] int b = 10;
- [B] int a;
- [C] int a float b - 10.5;
- [D] int ravana;

**Answer:**

[C] int a float b - 10.5;

***

```c
/* Question 44
 * What will be the output of the program?
 */
void main()
{
    int x = 1, y = 2, z = 3;
    x > y ? printf("%d", z) : return z;
}
```

**Options:**

- [A] 3
- [B] Run time error
- [C] Compile time error
- [D] 2

**Answer:**

[C] Compile time error

***

```c
/* Question 45
 * What will be the output of the program?
 */
void main()
{
    int a;
    if(a = 0)
        printf("Zero ");
    else
        printf("Not zero");
}
```

**Options:**

- [A] Zero
- [B] Run time error
- [C] Not zero
- [D] None

**Answer:**

[C] Not zero

***

```c
/* Question 46
 * What will be the output of the program?
 */
void main()
{
    int k = 8;
    int a = 0 == 1 && k++;
    printf("%d %d ", a, k);
}
```

**Options:**

- [A] 0 8
- [B] 1 9
- [C] 1 8
- [D] 0 9

**Answer:**

[A] 0 8

***

```text
Question 47
A variable declared in a function can be used in main
```

**Options:**

- [A] True if it is declared as static
- [B] TRUE
- [C] -FALSE()

**Answer:**

[C] -FALSE()

***

```c
/* Question 48
 * What will be the output of the program?
 */
void main()
{
    int x = 2;
    int y = 0;
    int z = (y++)? y==1 && x: 0;
    printf("%d", z);
}
```

**Options:**

- [A] False
- [B] 1
- [C] Compile time error
- [D] Undefined behaviour

**Answer:**

[A] False

***

```c
/* Question 49
 * What will be the output of the program?
 */
void main()
{
    while()
    {
        printf("In while");
    }
    printf("In main");
}
```

**Options:**

- [A] In while in main
- [B] Compile time error
- [C] In main
- [D] Infinite loop

**Answer:**

[B] Compile time error

***

```text
Question 50
Performing repetitive task or each pass through a loop is called as
```

**Options:**

- [A] execution
- [B] iteration
- [C] none of the above
- [D] enumeration

**Answer:**

[B] iteration

***

```text
Question 51
Find the correct order among the following
```

**Options:**

- [A] Code -> link->compile -> load -> execute
- [B] Code -> compile -> link -> load -> execute
- [C] Compile-> code-> load-> link -> execute
- [D] Code -> compile -> load -> link -> execute

**Answer:**

[B] Code -> compile -> link -> load -> execute

***

```text
Question 52
Which of the following symbol is allowed in declaration?
```

**Options:**

- [A] |
- [B] &
- [C] *
- [D] _

**Answer:**

[D] _

***

```text
Question 53
Which variables are not valid among following?
```

**Options:**

- [A] keyword and cpu
- [B] float_int
- [C] valid and ascii
- [D] None of the above

**Answer:**

[B] float_int

***

```text
Question 54
Find the odd one
```

**Options:**

- [A] constant
- [B] else
- [C] for
- [D] break

**Answer:**

[A] constant

***

```text
Question 55
Which of the following shows correct hierarchy of arithmetic operations?
```

**Options:**

- [A] All the above mentioned
- [B] * / % + -
- [C] / + * % -
- [D] + / * - %

**Answer:**

[B] * / % + -

***

```c
/* Question 56
 * Find the output of following code?
 */
#define MAX 10
void main()
{
    printf("%d", MAX*MAX);
}
```

**Options:**

- [A] 10
- [B] Garbage value
- [C] Error
- [D] 100

**Answer:**

[D] 100

***

```c
/* Question 57
 * void main()
 * {
 *     int var1=5, var2=5, var3=6, minmax;
 *     minmax = var1 > var2? var1 > var3? var1: var3:var2 > var3? var2: var3;
 *     printf("%d\n", minmax);
 * }
 * This program will
 */
```

**Options:**

- [A] Print 5
- [B] Produce a compilation error
- [C] Produce a runtime error
- [D] Print 6

**Answer:**

[D] Print 6

***

```text
Question 58
What are the types of linkages?
```

**Options:**

- [A] Internal and External
- [B] Internal
- [C] External and None
- [D] External; Internal; None

**Answer:**

[D] External; Internal; None

***

```c
/* Question 59
 * What is the output of the program?
 */
void main()
{
    enum status{pass, fail, atkt};
    enum status stud1, stud2, stud3;
    stud1=pass;
    stud2=atkt;
    stud3=fail;
    printf("%d %d %d\n", stud1, stud2, stud3);
}
```

**Options:**

- [A] 0 2 1
- [B] 0 1 2
- [C] 1 2 3
- [D] 1 3 2

**Answer:**

[A] 0 2 1

***

```c
/* Question 60
 * What will be the output of program in 16-bit platform?
 */
void main()
{
    extern int a;
    a=20;
    printf("%d", sizeof(a));
}
```

**Options:**

- [A] 4
- [B] 2
- [C] Based on compiler
- [D] Linker error

**Answer:**

[D] Linker error

***

```c
/* Question 61
 * What will be the output of the program?
 */
void main()
{
    struct emp
    {
        char name;
        int age;
        float sal;
    };
    struct emp e={"Tiger"};
    printf("%d ; %f", e.age, e.sal);
}
```

**Options:**

- [A] None of the above
- [B] Error
- [C] 0 ; 0.000000
- [D] Garbage value

**Answer:**

[C] 0 ; 0.000000

***

```c
/* Question 62
 * What will be the output of the program?
 */
void main()
{
    union a
    {
        int v;
        charch;
    };
    union a u;
    u.ch=3;
    u.ch=2;
    printf("%d %d, %d", u.ch, u.ch, u.v);
}
```

**Options:**

- [A] 3, 2, 515
- [B] 515, 2, 3
- [C] 3, 2, 5
- [D] None of the above

**Answer:**

[A] 3, 2, 515

***

```c
/* Question 63
 * In the following program how long for loop will get execute?
 */
void main()
{
    int i=5;
    for( ;scanf("%d", &i); printf("%d", i));
}
```

**Options:**

- [A] Loop will execute for only once
- [B] Cannot be determined
- [C] Loop will execute for 5 times
- [D] Loop will not be executed at all

**Answer:**

[B] Cannot be determined

***

```c
/* Question 64
 * Is there any difference in the following declarations?
 * int myfun(intarr[]);
 * int myfun(arr);
 */
```

**Options:**

- [A] No
- [B] Yes

**Answer:**

[B] Yes

***

```c
/* Question 65
 * What will be the output of the program?
 */
void display();
void display()
{
    printf("Follow the Rules\n");
}
void main()
{
    display();
}
```

**Options:**

- [A] Follow the rules
- [B] No output
- [C] Error
- [D] None of the above

**Answer:**

[A] Follow the rules

***

```c
/* Question 66
 * What will be the output of the program?
 */
void display();
void main()
{
    display();
}
void display()
{
    printf("World");
}
```

**Options:**

- [A] World
- [B] Error
- [C] No output
- [D] None of the above

**Answer:**

[A] World

***

```c
/* Question 67
 * What will be the output of the program?
 */
void main()
{
    void v = 0;
    printf("%d", v);
}
```

**Options:**

- [A] No error
- [B] Error as void type is not allowed
- [C] None of these
- [D] Program terminates abnormally

**Answer:**

[B] Error as void type is not allowed

***

```c
/* Question 68
 * Which of the following is correct about error used in the declaration given below?
 * typedef enum error{warning, test, exception} err;
 */
```

**Options:**

- [A] It is a typedef for enum error
- [B] It is a variable of type enum error
- [C] The statement is erroneous
- [D] It is a structure

**Answer:**

[D] It is a structure

***

```c
/* Question 69
 * Point out the error in the following code
 */
void main()
{
    void (*p)()=fun;
    (*p)();
}
void fun()
{
    printf("Welcome");
}
```

**Options:**

- [A] None of these
- [B] Error in int (*p)()-fun;
- [C] No error
- [D] Error in fun() prototype not defined

**Answer:**

[C] No error

***

```text
Question 70
What is ENUM?
```

**Options:**

- [A] None
- [B] Used to initialize variables
- [C] Used to define variables
- [D] Used to define constants

**Answer:**

[D] Used to define constants

***

```c
/* Question 71
 * void main()
 * {
 *     char b[]={'C', 'i', 's', ' ', 'f', 'u', 'n'};
 *     free(b);
 * }
 * The amount of memory released by b is
 */
```

**Options:**

- [A] 8 bytes
- [B] Depends on machine
- [C] 7 bytes
- [D] Run tme error

**Answer:**

[D] Run tme error

***

```c
/* Question 72
 * What is the output of the program?
 */
void main()
{
    int a[]={1,9,2};
    int *p;
    p=&a;
    printf("%d", *p);
}
```

**Options:**

- [A] Depends on the machine
- [B] 7
- [C] 4407
- [D] 2

**Answer:**

[D] 2

***

```c
/* Question 73
 * void main()
 * {
 *     charstrp[] = "Never ever say no";
 *     char *chp, v='e';
 *     int i, j;
 *     chp = strrchr(strp, v);
 *     i = chp-strp;
 *     for(j=0;j<=i;j++)
 *         printf("%c",strp[j]);
 * }
 * What is the output?
 */
```

**Options:**

- [A] Never ev
- [B] Never eve
- [C] Never ever say no
- [D] Neve

**Answer:**

[B] Never eve

***

```c
/* Question 74
 * Suppose that each integer occupies 4 bytes and each character 1 byte, what is the output of the following programme?
 */
void main()
{
    int a[] ={ 1,2,3,4,5,6,7};
    char c[] = {'s', 'a', 'n', 'j', 'u'};
    printf("%d %d", (&a-&a),(&c-&c));
}
```

**Options:**

- [A] 2021-03-03 00:00:00
- [B] 6 3
- [C] 12 3
- [D] 3 6

**Answer:**

[A] 2021-03-03 00:00:00

***

```c
/* Question 75
 * void main()
 * {
 *     int a[]={50,40,30,20,10};
 *     int i;
 *     i=a;
 *     printf("%d",i);
 * }
 * What is the output?
 */
```

**Options:**

- [A] 30
- [B] 10
- [C] 20
- [D] 50

**Answer:**

[C] 20

***

```c
/* Question 76
 * void main()
 * {
 *     int a;
 *     printf("%d",*(a/(a+9)));
 * }
 * What will the program do?
 */
```

**Options:**

- [A] None of the above
- [B] It will produce a runtime error as array a is not initialized.
- [C] It will result in a compilation error.
- [D] It will print some junk as array a is not initialized.

**Answer:**

[C] It will result in a compilation error.

***

```c
/* Question 77
 * int SumElement(int *,int);
 * void main()
 * {
 *     int x;
 *     int i=10;
 *     for(;;)
 *     {
 *         i--;
 *         *(x+i)=i;
 *     }
 *     printf("%d",SumElement(x,10));
 * }
 * intSumElement(int array[],int size)
 * {
 *     int i=0;
 *     float sum=0;
 *     for(j<size;i++)
 *         sum+=array[i];
 *     return sum;
 * }
 * What will be the output of this program?
 */
```

**Options:**

- [A] It will produce a compilation error in the last for statement
- [B] Both (b) and (c)
- [C] It will print 45
- [D] It will produce a type mismatch error as SumElement's return

**Answer:**

[C] It will print 45

***

```c
/* Question 78
 * int newval(int);
 * void main()
 * {
 *     int ia[ ]={12,24,45,0};
 *     int i, sum=0;
 *     for(i=0;ia[i];i++)
 *     {
 *         sum += newval(ia[i]);
 *     }
 *     printf("Sum = %d",sum);
 * }
 * int newval(int x)
 * {
 *     static int div = 1;
 *     return (x/div++);
 * }
 * The output of this program will be
 */
```

**Options:**

- [A] Compilation error
- [B] Sum = 61
- [C] Sum = 39
- [D] Runtime error

**Answer:**

[C] Sum = 39

***

```c
/* Question 79
 * #define MACRO(i,k) i*k
 * void main()
 * {
 *     float j;
 *     float x,y;
 *     x=5;
 *     y=10.5;
 *     j=MACRO(x,y);
 *     printf("%f\n",j);
 *     j=x*y;
 *     printf("%d",j);
 * }
 * The output is
 */
```

**Options:**

- [A] 52, not defined
- [B] Error (the program won't compile)
- [C] 52.5,5
- [D] 52.5, not defined

**Answer:**

[D] 52.5, not defined

***

```c
/* Question 80
 * #define TEN NINE
 * void main()
 * {
 *     enum digit {TEN,TWENTY=2,ONE};
 *     int mydigit=TEN+ONE;
 *     printf("%d",mydigit);
 * }
 */
```

**Options:**

- [A] 3
- [B] Error
- [C] 4
- [D] 2

**Answer:**

[A] 3

***

```c
/* Question 81
 * #define print "scanf is %s"
 * void main()
 * {
 *     char a[]="scanf";
 *     printf(print,a);
 * }
 * What is the output of the program?
 */
```

**Options:**

- [A] scanf is scanf
- [B] scanf is %
- [C] None of These
- [D] scanf

**Answer:**

[A] scanf is scanf

***

```c
/* Question 82
 * void main()
 * {
 *     void pa(int *a,int n);
 *     int arr={5,4,3,2,1};
 *     pa(arr,5);
 * }
 * void pa(int *a,int n)
 * {
 *     int i;
 *     for(i=0;i<n;i++)
 *         printf("%d\n",*(a++)+i);
 * }
 * Which of the following is correct?
 */
```

**Options:**

- [A] The Program prints the alternate elements of array.
- [B] It will not compile as 'array' cannot be incremented.
- [C] It will print 6 to 2 on individual lines.
- [D] It will print 5 five times

**Answer:**

[D] It will print 5 five times

***

```c
/* Question 83
 * void main()
 * {
 *     int i=3;
 *     while(i--)
 *     {
 *         int i=100;
 *         i--;
 *         printf("%d...",i);
 *     }
 * }
 * What is the output?
 */
```

**Options:**

- [A] error
- [B] 99...99...99...99...
- [C] 99...99...99...
- [D] 3...22...1...

**Answer:**

[C] 99...99...99...

***

```c
/* Question 84
 * static int k=2;
 * void main()
 * {
 *     int sum=0;
 *     do
 *     {
 *         sum+=(1/k);
 *     }
 *     while(0<k--);
 *     printf("%d", sum);
 * }
 * What is the value printf will print?
 */
```

**Options:**

- [A] 0
- [B] Nothing
- [C] Garbage value
- [D] 3

**Answer:**

[B] Nothing

***

```c
/* Question 85
 * What is the output of the program?
 */
void main()
{
    unsigned char i = 0x80;
    printf("%d\n", i<<1);
}
```

**Options:**

- [A] 100
- [B] 88
- [C] 256
- [D] 0

**Answer:**

[C] 256

***

```c
/* Question 86
 * What is the output of the program?
 */
void main()
{
    char str[ ] = "C-program";
    int a = 5;
    printf(a >10?"Ps\n":"%s\n", str);
}
```

**Options:**

- [A] Error
- [B] None of the above
- [C] c-program
- [D] Ps

**Answer:**

[C] c-program

***

```c
/* Question 87
 * What is the output of the program?
 */
void main()
{
    printf("%p", main);
}
```

**Options:**

- [A] Some address will be printed
- [B] Infinite loop
- [C] Error
- [D] None of the above

**Answer:**

[A] Some address will be printed

***

```c
/* Question 88
 * What is the output of the program?
 */
void main()
{
    printf("%p", main());
}
```

**Options:**

- [A] Error as multiple storage classes in declaration specifiers
- [B] Undefined behaviour
- [C] 123
- [D] 11

**Answer:**

[A] Error as multiple storage classes in declaration specifiers

***

```c
/* Question 89
 * Character datatype can't be declared as unsigned
 */
```

**Options:**

- [A] =TRUE()
- [B] =FALSE()

**Answer:**

[B] =FALSE()

***

```c
/* Question 90
 * void main()
 * {
 *     char *name ={"Kajol","Tabbu","Priti","Neha"};
 *     printf("%d", sizeof(name)/sizeof(char *));
 * }
 * What is the output?
 */
```

**Options:**

- [A] 19
- [B] 7
- [C] 5
- [D] 4

**Answer:**

[B] 7

***

```c
/* Question 91
 * void main()
 * {
 *     char *pDestn,*pSource="I Love You Daddy";
 *     pDestn=malloc(strlen(pSource));
 *     strcpy(pDestn,pSource);
 *     printf("%s",pDestn);
 *     free(pDestn);
 * }
 * What is the output?
 */
```

**Options:**

- [A] free() fails
- [B] Error
- [C] prints I Love You Daddy
- [D] strcpy() fails

**Answer:**

[C] prints I Love You Daddy

***

```c
/* Question 92
 * void main()
 * {
 *     void swap(int *e, int *d);
 *     inta,b,*p1,*p2;
 *     a=3;
 *     a=2;
 *     p1=&a;
 *     p2=&b;
 *     printf("a=%d\nb=%d",a, b);
 *     swap(p1, p2);
 *     printf("a=%d\nb=%d",a, b);
 * }
 * void swap(int *d, int *r)
 * {
 *     int *u;
 *     u=d;
 *     d=r;
 *     r=u;
 * }
 * The output of the program is
 */
```

**Options:**

- [A] a=2 b=3 a=3 b=2
- [B] a=3 b=2 a=2 b=3
- [C] a=3 b=3 a=2 b=2
- [D] a=2 b=0 a=2 b=0

**Answer:**

[D] a=2 b=0 a=2 b=0

***

```c
/* Question 93
 * #include<malloc.h>
 * char *f()
 * {
 *     char *s=malloc(8);
 *     strcpy(s, "goodbye");
 *     return s;
 * }
 * void main()
 * {
 *     char *f();
 *     printf("%c", *f()='A');
 * }
 * What is the output?
 */
```

**Options:**

- [A] goodbye
- [B] A
- [C] None of these
- [D] g

**Answer:**

[B] A

***

```c
/* Question 94
 * void main()
 * {
 *     unsigned char c;
 *     for(c=0; c!=256; c++)
 *     {
 *         printf("%d",c);
 *     }
 * }
 * Find the output?
 */
```

**Options:**

- [A] None of these
- [B] 255
- [C] 256
- [D] 0

**Answer:**

[A] None of these

***

```c
/* Question 95
 * constant k=100;
 * void main()
 * {
 *     int a;
 *     int sum=0;
 *     for(k=0;k<100;k++)
 *     *(a+k)=k;
 *     sum += a[--k];
 *     printf("%d", sum);
 * }
 * What will be the output of this program?
 */
```

**Options:**

- [A] It will print the sum of all the elements
- [B] It will print 99
- [C] It will produce a runtime error
- [D] None of the above

**Answer:**

[B] It will print 99

***

```c
/* Question 96
 * int printf(const char*,...);
 * void main()
 * {
 *     int i = 100,j=10,k=20;
 *     int sum;
 *     float ave;
 *     char myformat[]="ave = %.2f";
 *     sum=i+j+k;
 *     ave=sum/3;
 *     printf(myformat,ave);
 * }
 * What will the above program do?
 */
```

**Options:**

- [A] None of the above
- [B] It will produce a compilation error
- [C] It will print 43.00
- [D] It will print 43.34

**Answer:**

[C] It will print 43.00

***

```c
/* Question 97
 * int fn(void);
 * void print(int,int(*)());
 * int i = 10;
 * void main()
 * {
 *     int i = 20;
 *     print(i,fn);
 * }
 * void print(inti,int (*fn1)())
 * {
 *     printf("%d\n",(*fn1)());
 * }
 * int fn(void)
 * {
 *     return(i-=5);
 * }
 * What will the above program do?
 */
```

**Options:**

- [A] both (a) and (c)
- [B] It will print 5
- [C] There will be a linkage error as there is no fn1() function definition
- [D] There will be a compilation error

**Answer:**

[B] It will print 5

***

```c
/* Question 98
 * #define ONE 4
 * #define TWO 3
 * #define THREE 5.4
 * void main()
 * {
 *     int i=4;
 *     switch(i)
 *     {
 *         case ONE: i++;
 *         case TWO: i+=2;
 *         default: i=2;
 *     }
 *     printf("%d",i);
 * }
 * What is the output?
 */
```

**Options:**

- [A] 2
- [B] 4
- [C] 5
- [D] Error

**Answer:**

[A] 2

***

```c
/* Question 99
 * void main()
 * {
 *     int a;
 *     printf("%d", *(a/(a+9)));
 * }
 * What will the program do?
 */
```

**Options:**

- [A] None of the above
- [B] It will print some junk as array a is not initialised
- [C] It will result in a compilation error
- [D] It will produce a runtime error as array a is not initialised

**Answer:**

[C] It will result in a compilation error

***

```c
/* Question 100
 * void main()
 * {
 *     int a[ ] = {1,2,3,4,5,6,7};
 *     char c[ ] = {'a', 'x', 'h', 'o', 'k'};
 *     printf("%d %d ", (&a-&a),(&c-&c));
 * }
 * What will the program do?
 */
```

**Options:**

- [A] 3 4
- [B] 2021-03-03 00:00:00
- [C] None
- [D] 4 3

**Answer:**

[B] 2021-03-03 00:00:00
