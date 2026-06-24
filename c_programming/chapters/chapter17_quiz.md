# Problem solving

## Declaration and Initializations

```c
/* Question 1.1
 * What would be the output of the following program?
 */
main() 
{
    char *s1, *s2;
    printf ( "%z %z", sizeof ( s1 ), sizeof ( s2 ) );
}
```
**Answer:**

- On a 64-bit system, it will output: 8 8 (since pointers are 8 bytes).
- On a 32-bit system, it will output: 4 4 (since pointers are 4 bytes).

***

```c
/* Question 1.2
 * What would be the output of the following program?
 */
int x = 40;
main() 
{
    int x = 20;
    printf ( "\n%d", x );
}
```
**Answer:**

20. Whenever there is a conflict between a local variable and a global variable it is the local variable which gets a priority.

***

```c
/* Question 1.3
 * What would be the output of the following program?
 */
main() 
{
    int x = 40;
    {
        int x = 20;
        printf ( "\n%d", x );
    }
    printf ( "%d", x );
}
```
**Answer:**

20 40. In case of a conflict between local variables, the one which is more local that gets the priority.

***

```text
Question 1.4
Is the following statement a declaration or a definition?

extern int i;
```
**Answer:**

Declaration. The `extern` keyword explicitly tells the compiler that the variable `i` is defined somewhere else.

***

```c
/* Question 1.5
 * What would be the output of the following program?
 */
main() 
{
    extern int i;
    i = 20;
    printf ( "%d", sizeof ( i ) );
}
```
**Options:**

- [A] 2
- [B] 4
- [C] Would vary from compiler to compiler
- [D] Error, i undefined

**Answer:**

[D] `extern int i` is a declaration and not a definition, hence the error.

***

```text
Question 1.6
Is it true that a global variable may have several declarations, but 
only one definition? <Yes/No>
```
**Answer:**

Yes

***

```text
Question 1.7
Is it true that a function may have several declarations, but only 
one definition? <Yes/No>
```
**Answer:**

Yes

***

```c
/* Question 1.8
 * In the following program where is the variable a getting defined 
 * and where is it getting declared?
 */
main() 
{
    extern int a;
    printf ( "%d", a );
}

int a = 20;
```
**Answer:**

`extern int a` is the declaration whereas `int a = 20` is the definition.

***

```c
/* Question 1.9
 * What would be the output of the following program?
 */
main() 
{
    extern int a;
    printf ( "\n%d", a );
}

int a = 20;
```
**Options:**

- [A] 20
- [B] 0
- [C] Garbage value
- [D] Error

**Answer:**

[A] 20

***

```text
Question 1.10
What's the difference between a definition and declaration of a variable?
```
**Answer:**

In the definition of a variable space is reserved for the variable and some initial value is given to it, whereas a declaration only identifies the type of the variable for a function. Thus definition is the place where the variable is created or assigned storage whereas declaration refers to places where the nature of the variable is stated but no storage is allocated.

***

```text
Question 1.11
If the definition of an external variable occurs in the source file 
before its use in a particular function, then there is no need for 
an extern declaration in the function. <True/False>
```
**Answer:**

True

***

```text
Question 1.12
Suppose a program is divided into three files f1, f2 and f3, and a 
variable is defined in the file f1 but used in the files f2 and f3. 
In such a case would we need the external declaration for the 
variables in the files f2 and f3? <Yes/No>
```
**Answer:**

Yes

***

```text
Question 1.13
When we mention the prototype of a function are we defining the 
function or declaring it?
```
**Answer:**

We are declaring it. When the function alongwith the statements belonging to it are mentioned we are defining the function.

***

```c
/* Question 1.14
 * What's the difference between the following declarations?
 */
extern int fun();
int fun();
```
**Answer:**

There is no difference except for the fact that the first one gives a hint that the function `fun()` is probably in another source file.

***

```c
/* Question 1.15
 * Why does the following program report a redeclaration error of 
 * function display()?
 */
main() 
{
    display();
}

void display() 
{
    printf ( "\nCliffhanger" );
}
```
**Answer:**

Here `display()` is called before it is defined. In such cases the compiler assumes that the function `display()` is declared as `int display();`. That is, an undeclared function is assumed to return an `int` and accept an unspecified number of arguments. Then when we define the function the compiler finds that it is returning `void` hence the compiler reports the discrepancy.

***

```c
/* Question 1.16
 * What would be the output of the following program?
 */
main() 
{
    extern int fun ( float );
    int a;
    a = fun ( 3.14 );
    printf ( "%d", a );
}

int fun ( aa )
float aa;
{
    return ( ( int ) aa );
}
```
**Options:**

- [A] 3
- [B] 3.14
- [C] 0
- [D] Error

**Answer:**

[D] The error occurs because we have mixed the ANSI prototype with K & R style of function definition. When we use ANSI prototype for a function and pass a float to the function it is promoted to a double. When the function accepts this double into a float a type mismatch occurs hence the error. The remedy for this error could be to define the function as: `int fun ( float aa ) { return ( ( int ) aa ); }`

***

```c
/* Question 1.17
 * Point out the error, if any, in the following program.
 */
struct emp 
{
    char name;
    int age;
}

/* some more code may go here */

fun ( int aa ) 
{
    int bb;
    bb = aa * aa;
    return ( bb );
}

main() 
{
    int a;
    a = fun ( 20 );
    printf ( "\n%d", a );
}
```
**Answer:**

Because of the missing semicolon at the end of the structure declaration (the intervening comment further obscures it) the compiler believes that `fun()` would return something of the type `struct emp`, whereas in actuality it is attempting to return an `int`. This causes a mismatch, hence an error results.

***

```text
Question 1.18
If you are to share the variables or functions across several source 
files how would you ensure that all definitions and declarations are 
consistent?
```
**Answer:**

The best arrangement is to place each definition in a relevant `.c` file. Then, put an external declaration in a header file (`.h` file) and use `#include` to bring in the declaration wherever needed. The `.c` file which contains the definition should also include the header file, so that the compiler can check that the definition matches the declaration.

***

```c
/* Question 1.19
 * How would you rectify the error in the following program?
 */
f ( struct emp );
/* any other prototypes may go here */

struct emp 
{
    char name;
    int age;
};

main() 
{
    struct emp e = { "Soicher", 34 };
    f ( e );
}

f ( struct emp ee ) 
{
    printf ( "\n%s %d", ee.name, ee.age );
}
```
**Answer:**

Declare the structure before the prototype of `f()`.

***

```text
Question 1.20
Global variables are available to all functions. Does there exist a 
mechanism by way of which I can make it available to some and not 
to others.
```
**Answer:**

No. The only way this can be achieved is to define the variable locally in `main()` instead of defining it globally and then passing it to the functions which need it.

***

```text
Question 1.21
What do you mean by a translation unit?
```
**Answer:**

A translation unit is a set of source files seen by the compiler and translated as a unit: generally one `.c` file, plus all header files mentioned in `#include` directives.

***

```c
/* Question 1.22
 * What would be the output of the following program?
 */
main() 
{
    int a = { 2, 3 };
    printf ( "\n%d %d %d", a, a, a );
}
```
**Options:**

- [A] Garbage values
- [B] 2 3 3
- [C] 3 2 2
- [D] 0 0 0

**Answer:**

[D] 0 0 0. When an automatic array is partially initialised, the remaining array elements are initialised to 0.

***

```c
/* Question 1.23
 * What would be the output of the following program?
 */
main() 
{
    struct emp 
    {
        char name;
        int age;
        float sal;
    };
    struct emp e = { "Tiger" };
    printf ( "\n%d %f", e.age, e.sal );
}
```
**Options:**

- [A] 0 0.000000
- [B] Garbage values
- [C] Error
- [D] None of the above

**Answer:**

[A] 0 0.000000. When an automatic structure is partially initialised, the remaining elements of the structure are initialised to 0.

***

```c
/* Question 1.24
 * Some books suggest that the following definitions should be 
 * preceded by the word static. Is it correct?
 */
int a[] = { 2, 3, 4, 12, 32 };
struct emp e = { "sandy", 23 };
```
**Answer:**

Pre-ANSI C compilers had such a requirement. Compilers which conform to ANSI C standard do not have such a requirement.

***

```c
/* Question 1.25
 * Point out the error, if any, in the following program.
 */
main() 
{
    int ( *p )() = fun;
    ( *p )();
}

fun() 
{
    printf ( "\nLoud and clear" );
}
```
**Answer:**

Here we are initialising the function pointer `p` to the address of the function `fun()`. But during this initialisation the function has not been defined. Hence an error. To eliminate this error add the prototype of the `fun()` before declaration of `p`, as shown below: `extern int fun();` or simply `int fun();`

***

```c
/* Question 1.26
 * Point out the error, if any, in the following program.
 */
main() 
{
    union a 
    {
        int i;
        char ch;
    };
    union a z = 512;
    printf ( "%d %d", z.ch, z.ch );
}
```
**Answer:**

In a pre-ANSI compiler a `union` variable cannot be initialised. However, ANSI C permits initialisation of first memeber of the union.

***

```text
Question 1.27
What do you mean by scope of a variable? What are the 4 different 
types of scopes that a variable can have?
```
**Answer:**

Scope indicates the region over which the variable's declaration has an effect. The four kinds of scopes are: file, function, block and prototype.

***

```text
Question 1.28
What are the different types of linkages?
```
**Answer:**

There are three different types of linkages: external, internal and none. External linkage means global, non-static variables and functions, internal linkage means static variables and functions with file scope, and no linkage means local variables.

***

## Control instructions

```c
/* Question 2.1
 * What would be the output of the following program?
 */
main()
{
    int i = 4 ;
    switch ( i )
    {
        default :
            printf ( "\nA mouse is an elephant built by the Japanese" ) ;
        case 1 :
            printf ( "\nBreeding rabbits is a hare raising experience" ) ;
            break ;
        case 2 :
            printf ( "\nFriction is a drag" ) ;
            break ;
        case 3 :
            printf ( "\nIf practice makes perfect, then nobody's perfect" ) ;
    }
}
```
**Answer:**

A mouse is an elephant built by the Japanese
Breeding rabbits is a hare raising experience

***

```c
/* Question 2.2
 * Point out the error, if any, in the for loop.
 */
main()
{
    int i = 1 ;
    for ( ; ; )
    {
        printf ( "%d", i++ ) ;
        if ( i > 10 )
            break ;
    }
}
```
**Options:**

- [A] The condition in the `for` loop is a must.
- [B] The two semicolons should be dropped.
- [C] The `for` loop should be replaced by a `while` loop.
- [D] No error.

**Answer:**
 
[D] No error.

***

```c
/* Question 2.3
 * Point out the error, if any, in the while loop.
 */
main()
{
    int i = 1 ;
    while ( )
    {
        printf ( "%d", i++ ) ;
        if ( i > 10 )
            break ;
    }
}
```
**Options:**

- [A] The condition in the `while` loop is a must.
- [B] There should be at least a semicolon in the `while( )`.
- [C] The `while` loop should be replaced by a `for` loop.
- [D] No error.

**Answer:**
 
[A] The condition in the `while` loop is a must.

***

```c
/* Question 2.4
 * Point out the error, if any, in the while loop.
 */
main()
{
    int i = 1 ;
    while ( i <= 5 )
    {
        printf ( "%d", i ) ;
        if ( i > 2 )
            goto here ;
    }
}

fun()
{
here:
    printf ( "\nIf it works, Don't fix it." ) ;
}
```
**Answer:**
 
`goto` cannot take control to a different function.

***

```c
/* Question 2.5
 * Point out the error, if any, in the following program.
 */
main()
{
    int i = 4, j = 2 ;
    switch ( i )
    {
        case 1 :
            printf ( "\nTo err is human, to forgive is against company policy." ) ;
            break ;
        case j :
            printf ( "\nIf you have nothing to do, don't do it here." ) ;
            break ;
    }
}
```
**Answer:**
 
Constant expression required in the second case, we cannot use `j`.

***

```c
/* Question 2.6
 * Point out the error, if any, in the following program.
 */
main()
{
    int i = 1 ;
    switch ( i )
    {
        case 1 :
            printf ( "\nRadioactive cats have 18 half-lives." ) ;
            break ;
        case 1 * 2 + 4 :
            printf ( "\nBottle for rent - inquire within." ) ;
            break ;
    }
}
```
**Answer:**
 
No error. Constant expressions like `1 * 2 + 4` are acceptable in cases of a `switch`.

***

```c
/* Question 2.7
 * Point out the error, if any, in the following program.
 */
main()
{
    int a = 10 ;
    switch ( a )
    {
        printf ( "Programmers never die. They just get lost in the processing" ) ;
    }
}
```
**Answer:**
 
Though never required, there can exist a `switch` which has no cases.

***

```c
/* Question 2.8
 * Point out the error, if any, in the following program.
 */
main()
{
    int i = 1 ;
    switch ( i )
    {
        printf ( "Hello" ) ; /* common for both cases */
        case 1 :
            printf ( "\nIndividualists unite!" ) ;
            break ;
        case 2 :
            printf ( "\nMoney is the root of all wealth." ) ;
            break ;
    }
}
```
**Answer:**
 
Though there is no error, irrespective of the value of `i` the first `printf()` can never get executed. In other words, all statements in a `switch` have to belong to some case or the other.

***

```c
/* Question 2.9
 * Rewrite the following set of statements using conditional operators.
 */
int a = 1, b ;
if ( a > 10 )
    b = 20 ;
```
**Answer:**
 
```c
int a = 1, b, dummy ;
a > 10 ? b = 20 : ( dummy = 1 ) ;
```
Note that the following would not have worked: `a > 10 ? b = 20 : ; ;`

***

```c
/* Question 2.10
 * Point out the error, if any, in the following program.
 */
main()
{
    int a = 10, b ;
    a >= 5 ? b = 100 : b = 200 ;
    printf ( "\n%d", b ) ;
}
```
**Answer:**
 
lvalue required in function `main()`. The second assignment should be written in parentheses as follows:
`a >= 5 ? b = 100 : ( b = 200 ) ;`

***

```c
/* Question 2.11
 * What would be the output of the following program?
 */
main()
{
    char str[ ] = "Part-time musicians are semiconductors" ;
    int a = 5 ;
    printf ( a > 10 ? "%50s" : "%s", str ) ;
}
```
**Options:**

- [A] Part-time musicians are semiconductors
- [B] Part-time musicians are semiconductors
- [C] Error
- [D] None of the above

**Answer:**
 
[A] Part-time musicians are semiconductors

***

```text
Question 2.12
What is more efficient a switch statement or an if-else chain?
```
**Answer:**
 
As far as efficiency is concerned there would hardly be any difference if at all. If the cases in a `switch` are sparsely distributed the compiler may internally use the equivalent of an `if-else` chain instead of a compact jump table. However, one should use `switch` where one can. It is definitely a cleaner way to program and certainly is not any less efficient than the `if-else` chain.

***

```text
Question 2.13
Can we use a switch statement to switch on strings?
```
**Answer:**
 
No. The cases in a `switch` must either have integer constants or constant expressions.

***

```text
Question 2.14
We want to test whether a value lies in the range 2 to 4 or 5 to 7. 
Can we do this using a switch?
```
**Answer:**
 
Yes, though in a way which would not be very practical if the ranges are bigger. The way is shown below:
```c
switch ( a )
{
    case 2 :
    case 3 :
    case 4 :
        /* some statements */
        break ;
    case 5 :
    case 6 :
    case 7 :
        /* some other statements */
        break ;
}
```

***

```text
Question 2.15
The way break is used to take the control out of switch can continue
be used to take the control to the beginning of the switch? <Yes/No>
```
**Answer:**
 
No. `continue` can work only with loops and not with `switch`.

## Expressions

```c
/* Question 3.1
 * What would be the output of the following program?
 */
main()
{
    static int a[20] ;
    int i = 0 ;
    a[i] = i++ ;
    printf ( "\n%d %d %d", a[0], a[1], i ) ;
}
```
**Answer:**
0 0 1

That's what some of the compilers would give. But some other compiler may give a different answer. The reason is, when a single expression causes the same object to be modified or to be modified and then inspected the behaviour is undefined.

***

```c
/* Question 3.2
 * What would be the output of the following program?
 */
main()
{
    int i = 3 ;
    i = i++ ;
    printf ( "%d", i ) ;
}
```

**Answer:**

4

But basically the behaviour is undefined for the same reason as in 3.1 above.

***

```text
Question 3.3
The expression on the right hand side of && and || operators does not 
get evaluated if the left hand side determines the outcome. <True/False>
```

**Answer:**

True. For example if `a` is non-zero then `b` will not be evaluated in the expression `a || b`.

***

```c
/* Question 3.4
 * What would be the output of the following program?
 */
main()
{
    int i = 2 ;
    printf ( "\n%d %d", ++i, ++i ) ;
}
```

**Options:**

- [A] 3 4
- [B] 4 3
- [C] 4 4
- [D] Output may vary from compiler to compiler.

**Answer:**

[D] The order of evaluation of the arguments to a function call is unspecified.

***

```c
/* Question 3.5
 * What would be the output of the following program?
 */
main()
{
    int x = 10, y = 20, z = 5, i ;
    i = x < y < z ;
    printf ( "\n%d", i ) ;
}
```
**Options:**
- [A] 1
- [B] 0
- [C] Error
- [D] None of the above.

**Answer:**

[A] 1

***

```text
Question 3.6
Are the following two statements same? <Yes/No>

a <= 20 ? b = 30 : c = 30 ;
( a <= 20 ) ? b : c = 30 ;
```

**Answer:**

No

***

```text
Question 3.7
Can you suggest any other way of writing the following expression 
such that 30 is used only once?

a <= 20 ? b = 30 : c = 30 ;
```

**Answer:**

`*( ( a <= 20 ) ? &b : &c ) = 30 ;`

***

```text
Question 3.8
How come that the C standard says that the expression

j = i++ * i++ ;

is undefined, whereas, the expression

j = i++ && i++ ;

is perfectly legal.
```

**Answer:**

According to the C standard an object's stored value can be modified only once (by evaluation of expression) between two sequence points. A sequence point occurs:
- at the end of full expression (expression which is not a sub-expression in a larger expression)
- at the `&&`, `||` and `?:` operators
- at a function call (after the evaluation of all arguments, just before the actual call)

Since in the first expression `i` is getting modified twice between two sequence points the expression is undefined. Also, the second expression is legal because a sequence point is occurring at `&&` and `i` is getting modified once before and once after this sequence point.

***

```text
Question 3.9
If a[i] = i++ is undefined, then by the same reason i = i + 1 should 
also be undefined. But it is not so. Why?
```

**Answer:**

The standard says that if an object is to get modified within an expression then all accesses to it within the same expression must be for computing the value to be stored in the object. The expression `a[i] = i++` is disallowed because one of the accesses of `i` (the one in `a[i]`) has nothing to do with the value that ends up being stored in `i`. In this case the compiler may not know whether the access should take place before or after the incremented value is stored. Since there's no good way to define it, the standard declares it as undefined. As against this the expression `i = i + 1` is allowed because `i` is accessed to determine `i`'s final value.

***

```text
Question 3.10
Would the expression *p++ = c be disallowed by the compiler.
```

**Answer:**

No. Because here even though the value of `p` is accessed twice it is used to modify two different objects `p` and `*p`.

***

```text
Question 3.11
In the following code in which order the functions would be called?

a = f1 ( 23, 14 ) * f2 ( 12 / 4 ) + f3( ) ;
```

**Options:**

- [A] f1, f2, f3
- [B] f3, f2, f1
- [C] The order may vary from compiler to compiler
- [D] None of the above

**Answer:**

[C] Here the multiplication will happen before the addition, but in which order the functions would be called is undefined.

***

```text
Question 3.12
In the following code in which order the functions would be called?

a = ( f1 ( 23, 14 ) * f2 ( 12 / 4 ) ) + f3( ) ;
```

**Options:**

- [A] f1, f2, f3
- [B] f3, f2, f1
- [C] The order may vary from compiler to compiler
- [D] None of the above

**Answer:**

[C] Here the multiplication will happen before the addition, but in which order the functions would be called is undefined. In an arithmetic expression the parentheses tell the compiler which operands go with which operators but do not force the compiler to evaluate everything within the parentheses first.

***

```c
/* Question 3.13
 * What would be the output of the following program?
 */
main()
{
    int i = -3, j = 2, k = 0, m ;
    m = ++i && ++j || ++k ;
    printf ( "\n%d %d %d %d", i, j, k, m ) ;
}
```

**Answer:**

-2 3 0 1

***

```c
/* Question 3.14
 * What would be the output of the following program?
 */
main()
{
    int i = -3, j = 2, k = 0, m ;
    m = ++i || ++j && ++k ;
    printf ( "\n%d %d %d %d", i, j, k, m ) ;
}
```

**Answer:**

-2 2 0 1

***

```c
/* Question 3.15
 * What would be the output of the following program?
 */
main()
{
    int i = -3, j = 2, k = 0, m ;
    m = ++i || ++j || ++k ;
    printf ( "\n%d %d %d %d", i, j, k, m ) ;
}
```

**Answer:**

-2 2 0 1

***

```c
/* Question 3.16
 * What would be the output of the following program?
 */
main()
{
    int i = -3, j = 2, k = 0, m ;
    m = ++i && ++j && ++k ;
    printf ( "\n%d %d %d %d", i, j, k, m ) ;
}
```

**Answer:**

-2 3 1 1
