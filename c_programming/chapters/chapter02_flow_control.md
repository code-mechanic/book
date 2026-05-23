\newpage

# Flow control

## If Conditional Construct

- Whenever conditon is true do some specific job. When condition is false do some other specific task. At that time we are going for `if-else` conditional construct.
- `else` keyword must be immediatly placed after `if` body.
- If some statement is placed between `if` body and `else` then that is error.

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

## If else Conditional Construct
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
