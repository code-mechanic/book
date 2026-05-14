\newpage

# Bitwise Operators

| **Operator** | **Name**                           | **Description**                            |
| ------------ | ---------------------------------- | ------------------------------------------ |
| &            | Bitwise AND                        | Sets bit to 1 if both bits are 1           |
| \|           | Bitwise OR                         | Sets bit to 1 if at least one bit is 1     |
| ^            | Bitwise XOR                        | Sets bit to 1 if bits are different        |
| ~            | Bitwise NOT / One's Complement     | Inverts all bits                           |
| <<           | Left Shift                         | Shifts bits to left                        |
| >>           | Right Shift                        | Shifts bits to right                       |

## One's Complement

| **!**            | **~**             |
|------------------|-------------------|
| Output is 1 or 0 | output is integer |
| !3.14 is 0       | ~3.14 is error    |


```C
void main()
{
    int a;
    a = ~0;
    printf("%d", a);
}

/*
if int datatype = 2 bytes

0  = 0000 0000 0000 0000 (result = 0)
~0 = 1111 1111 1111 1111 (result = -1)
*/
```

- If MSB = 0, then number is +ve and it is original data
- If MSB = 1, then number is -ve and number is in 2's complement.

### Binary(2's complement) to decimal

- If MSB = 0, Convert normally from binary to decimal.
- If MSB = 1,
    1. Take 2's complement again
    2. Convert to decimal
    3. Add negative sign

Example
```C
/*
Binary(2's complement) = 1111 1111 1111 0101
original data          = 0000 0000 0000 1010
                                          +1
                        --------------------
                         0000 0000 0000 1011 = 11 (consider this as negative)
*/
```

```C
/*
~5
~(0000 0000 0000 0101)
1111 1111 1111 1010
                | |
                V V
                4+1 = 5
                      |
                      V
                      5 + 1 = 6 (consider as negative)

~5 = -6
*/
```

```C
/*
~9
~(0000 0000 0000 1001)
1111 1111 1111 0110
               |  |
               V  V
               8 +1 = 9
                      |
                      V
                      9 + 1 = 10 (consider as negative)

~9 = -10

So,
~0 = -1
~5 = -6
~9 = -10
~37 = -38
~-6 = 5
~-3107 = 3106
~-10906 = 10905
~3.14 = Error (Complement on float is error)
*/

```

### Summary
> 1. Add `1`
> 2. Change the sign of result

## Left shift Operator

```C
/*
5 << 1 = 0000 0000 0000 0101
         0000 0000 0000 1010 (shift by 1) = 10

5 << 2 = 0000 0000 0000 0101
         0000 0000 0001 0100 (shift by 2) = 20

-5 << 1 = 1111 1111 1111 1011
          1111 1111 1111 0110 (shift by 1) = -10

-6 << 2 = 1111 1111 1111 1010
          1111 1111 1110 1000 (shift by 2) = -24
*/
```

### Summary
> a << b is equal to a * 2^b

## Right shift Operator

```C
/*
5 >> 1 = 0000 0000 0000 0101
         0000 0000 0000 0010 = 2
         |
         V
         This position is filled by the value of MSB because signed

11 >> 2 = 0000 0000 0000 1011
          0000 0000 0000 0010 = 2
          ||
          VV
          This position is filled by the value of MSB because signed

-9 >> 1 = 1111 1111 1111 0111
          1111 1111 1111 1011 = -5
          |
          V
          This position is filled by the value of MSB because signed

-6 >> 2 = 1111 1111 1111 1010
          1111 1111 1111 1110 = -2
          ||
          VV
          This position is filled by the value of MSB because signed
*/
```

### Summary

1. 
$$
5 >> 1
= \frac{5}{2^2}
= 2
$$

2. 
$$
11 >> 2
= \frac{11}{2^2}
= 2
$$

3. 
$$
-9 >> 1
= \sim(\frac{\sim -9}{2^1})
= \sim(\frac{8}{2})
= \sim(4)
= -5
$$

4. 
$$
-6 >> 2
= \sim(\frac{\sim -6}{2^2})
= \sim(\frac{5}{4})
= \sim(1)
= -2
$$

> $$
> a >> b =
> \begin{cases}
> \dfrac{a}{2^b}, & \text{if } a \text{ is positive} \\
> \\
> \left (\sim\dfrac{\sim a}{2^b}\right) & \text{if } a \text{ is negative}
> \end{cases}
> $$
> - For signed data gap is filled with MSB  
> - For unsigned data gap is filled with 0  
> - Shifting like `10 << 40`, `81 >> 100`, `10 << -2`, `8 >> -3` are machine dependant

## Bitwise AND, OR, XOR

| **AND**                | **XOR**                  | **OR**                |
|------------------------|--------------------------|-----------------------|
| x & 1 => x             | x ^ 1 => !X **(Toggle)** | X \| 1 => 1 **(Set)** |
| x & 0 => 0 **(Clear)** | X ^ 0 => X               | X \| 0 => X           |

- `X` is don't care

### Summary

> 1. Set a bit, use OR
> 2. Clear a bit, use AND
> 3. Toggle a bit, use XOR

## Problem solving

### Check if the nth bit is set

```c
bool is_bit_set(uint32_t x, uint8_t n)
{
    return (x >> n) & 1U;
    /* OR: return (x & (1U << n)) != 0; */
}
```

### Set the nth bit

```c
uint32_t set_bit(uint32_t x, uint8_t n)
{
    return x | (1U << n);
}
```

### Clear the nth bit

```c
uint32_t clear_bit(uint32_t x, uint8_t n)
{
    return x & ~(1U << n);
}
```

### Toggle the nth bit

```c
uint32_t toggle_bit(uint32_t x, uint8_t n)
{
    return x ^ (1U << n);
}
```

### Count number of set bits

```c
uint8_t count_set_bits(uint32_t x)
{
    uint8_t count = 0;
    while (x) { 
        x &= x - 1;
        count++;
    }
    return count;
}
```

### Check if a number is a power of 2

```c
bool is_power_of_2(uint32_t n)
{
    return (n != 0) && ((n & (n - 1)) == 0);
}
```

### Swap two numbers using XOR

```c
void xor_swap(uint32_t *a, uint32_t *b)
{
    if (a != b) {          /* guard against aliasing */
        *a ^= *b;
        *b ^= *a;          /* *b = original *a */
        *a ^= *b;          /* *a = original *b */
    }
}
```