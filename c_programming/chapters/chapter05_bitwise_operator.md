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
    while (x) {             /* loop runs exactly as many times as there are set bits */
        x &= x - 1;        /* x-1 flips all bits from LSB up to (and including) the
                               lowest set bit, so AND-ing zeroes that bit out.
                               e.g.  x     = 1010 1000
                                     x-1   = 1010 0111
                                     x&x-1 = 1010 0000  <- one set bit gone */
        count++;
    }
    return count;           /* result = number of 1-bits in original x */
}
```

### Check if a number is a power of 2

```c
bool is_power_of_2(uint32_t n)
{
    /* n=0 excluded: 0 is not a power of 2 */
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

### Find first set bit in a number

```c
/* Shift right until LSB is 1, counting each step.
 * O(position of lowest set bit) — worst case O(32).               */
int first_set_bit_manual(uint32_t x)
{
    if (!x) return -1;

    int pos = 0;
    while ((x & 1U) == 0) {    /* while LSB is 0... */
        x >>= 1;                /* ...shift right (discard LSB) */
        pos++;                  /* ...and count the step */
    }
    return pos;                 /* pos where (x >> pos) & 1 is first true */
}

/* isolation trick
 *
 * -x in two's complement = ~x + 1
 * ~x flips all bits, +1 then ripples carry rightward until it sets
 * exactly the position of the original lowest set bit.
 * Result is a VALUE with only that one bit set, not the position.
 *
 * e.g.  x      = 0000 1010 0  (LSB at bit 1)
 *       -x     = 1111 0110 0
 *       x & -x = 0000 0010 0  <-> isolated LSB as a value           */
uint32_t isolate_lsb(uint32_t x)
{
    return x & (-x);            /* returns the bit VALUE, not position */
}
```

> x        =  0000 1010 1000   (lowest set bit at position 3)
> x - 1    =  0000 1010 0111   (borrow flips bits 0..3)
> x & -x   =  0000 0000 1000   (isolates ONLY bit 3 as a value)

### Find last set bit in a number

```c
/* Keep shifting x right until it becomes 0.
 * Each shift discards one bit from the top.
 * The number of shifts needed = position of the highest set bit.
 *
 * e.g.  x = 0110 0100  (decimal 100)
 *       shift 1 -> 0011 0010   pos = 1
 *       shift 2 -> 0001 1001   pos = 2
 *       ...
 *       shift 6 -> 0000 0001   pos = 6
 *       shift 7 -> 0000 0000   loop exits, return pos = 6            */
int last_set_bit_shift(uint32_t x)
{
    if (!x) return -1;

    int pos = 0;
    while(x) {
        x = x >> 1     /* shift right; loop exits when x becomes 0 */
        pos++;         /* count each shift, final value = MSB position */
    }
    return pos;
}

/* Binary search / divide-and-conquer
 *
 * Narrows down the MSB position in exactly 5 steps (log2 of 32).
 * Checks whether any bit exists in the upper half; if yes, shift
 * the entire value down by that half and accumulate the offset.
 * O(log 32) = O(5) — no loop dependency on the actual bit position.
 *
 * Step sizes:  16 -> 8 -> 4 -> 2 -> 1                                  */
int last_set_bit_bsearch(uint32_t x)
{
    if (!x) return -1;

    int pos = 0;

    if (x & 0xFFFF0000U) { pos += 16; x >>= 16; }  /* bit in upper 16? */
    if (x & 0x0000FF00U) { pos +=  8; x >>=  8; }  /* bit in upper 8?  */
    if (x & 0x000000F0U) { pos +=  4; x >>=  4; }  /* bit in upper 4?  */
    if (x & 0x0000000CU) { pos +=  2; x >>=  2; }  /* bit in upper 2?  */
    if (x & 0x00000002U) { pos +=  1; x >>=  1; }  /* bit in upper 1?  */

    return pos;
}
```

### Reverse bits of 32-bit number

```c
/*
 * Reverse all 32 bits of an unsigned integer.
 * e.g.  0b 1011 0100 0000 0000 0000 0000 0000 0001
 *       0b 1000 0000 0000 0000 0000 0000 0010 1101 (result)
 */

/* Divide-and-conquer with bitmasks (portable, O(log 32))
 *
 * Core idea: repeatedly swap the two halves of the number,
 * each time at half the previous granularity.
 *
 * 5 stages: 16-bit halves -> bytes -> nibbles -> bit-pairs -> bits
 *
 * Mask anatomy (memorise these — they come up in other problems too):
 *
 *   0xFFFF0000 = 1111 1111 1111 1111 | 0000 0000 0000 0000  (upper half)
 *   0x0000FFFF = 0000 0000 0000 0000 | 1111 1111 1111 1111  (lower half)
 *
 *   0xFF00FF00 = 1111 1111 | 0000 0000 | 1111 1111 | 0000 0000  (odd bytes)
 *   0x00FF00FF = 0000 0000 | 1111 1111 | 0000 0000 | 1111 1111  (even bytes)
 *
 *   0xF0F0F0F0 = 1111 | 0000 | 1111 | 0000 | ...  (odd nibbles)
 *   0x0F0F0F0F = 0000 | 1111 | 0000 | 1111 | ...  (even nibbles)
 *
 *   0xCCCCCCCC = 11 | 00 | 11 | 00 | ...           (odd bit-pairs)
 *   0x33333333 = 00 | 11 | 00 | 11 | ...           (even bit-pairs)
 *
 *   0xAAAAAAAA = 1010 1010 ...                      (odd single bits)
 *   0x55555555 = 0101 0101 ...                      (even single bits)
 *
 * Pattern: each stage's two masks are bitwise complements of each other.
 * Each stage shifts by exactly half its working block size.          */

uint32_t reverse32(uint32_t x)
{
    /* Stage 1: swap upper 16 bits with lower 16 bits
     *   before: [A B C D | E F G H | I J K L | M N O P]
     *   after:  [I J K L | M N O P | A B C D | E F G H]  */
    x = ((x & 0xFFFF0000U) >> 16) | 
        ((x & 0x0000FFFFU) << 16);

    /* Stage 2: swap odd bytes with even bytes within each 16-bit half
     *   before: [I J K L | M N O P | A B C D | E F G H]
     *   after:  [M N O P | I J K L | E F G H | A B C D]  */
    x = ((x & 0xFF00FF00U) >>  8) | 
        ((x & 0x00FF00FFU) <<  8);

    /* Stage 3: swap odd nibbles with even nibbles within each byte
     *   each byte: [HI LO] -> [LO HI]                      */
    x = ((x & 0xF0F0F0F0U) >>  4) | 
        ((x & 0x0F0F0F0FU) <<  4);

    /* Stage 4: swap odd bit-pairs with even bit-pairs within each nibble
     *   each nibble: [b3 b2 | b1 b0] -> [b1 b0 | b3 b2]   */
    x = ((x & 0xCCCCCCCCU) >>  2) | 
        ((x & 0x33333333U) <<  2);

    /* Stage 5: swap every odd bit with its even neighbour
     *   final swap of adjacent bits — completes the full reversal  */
    x = ((x & 0xAAAAAAAAU) >>  1) | 
        ((x & 0x55555555U) <<  1);

    return x;
}

/* Naive loop
 *
 * Extract LSB of x each iteration, push it into result from the MSB end.
 * O(32) — always 32 iterations regardless of bit pattern.           */
uint32_t reverse32_loop(uint32_t x)
{
    uint32_t result = 0;
    int bits = 32;

    while (bits--) {
        result = result << 1;        /* shift result up*/
        result = result | (x & 1U);  /* OR in LSB of x */
        x = x >> 1;                  /* discard the LSB just consumed */
    }

    return result;
}
```

### Swap even and odd bits

```c
uint32_t swap_even_odd_bits(uint32_t x)
{
    uint32_t odd_bits  = x & 0xAAAAAAAAU;   /* isolate bits at pos 1,3,5,7,...
                                               zero out all even-position bits  */

    uint32_t even_bits = x & 0x55555555U;   /* isolate bits at pos 0,2,4,6,...
                                               zero out all odd-position bits   */

    return (odd_bits  >> 1)                 /* slide odd-position bits DOWN by 1
                                               pos 1->0, 3->2, 5->4, 7->6, ...     */
         | (even_bits << 1);               /* slide even-position bits UP by 1
                                               pos 0->1, 2->3, 4->5, 6->7, ...     */
}
```

### Check if the number has only one bit set

If the number is [power of 2](#check-if-a-number-is-a-power-of-2) then that number has only one bit set.

### Clear all the bits from MSB to nth bit pos

```c
/*
 * Clear all bits from the MSB down to position n (inclusive).
 * Keep bits [n-1 .. 0] untouched.
 *
 * Visual:
 *   bit pos:  31 30 29 ... n+1  n  | n-1  n-2 ... 1   0
 *   before:    ?  ?  ? ...  ?   ?  |  ?    ?  ... ?   ?
 *   after:     0  0  0 ...  0   0  |  ?    ?  ... ?   ?   <- upper cleared
 *                                    ^^^^^^^^^^^^^^^^^^^
 *                                    these bits preserved exactly
 *
 * e.g.  x = 0xFF  (1111 1111),  n = 4
 *       clear bits [7..4], keep bits [3..0]
 *       result = 0x0F  (0000 1111)
 */

/*  Method 1: Lower-bits mask (preferred — one expression) 
 *
 * Key insight: (1U << n) - 1  produces exactly n ones in the low positions.
 *
 *   n = 4:
 *   1U << 4         = 0000 0000 0001 0000   (1 at position n)
 *   (1U << 4) - 1   = 0000 0000 0000 1111   (all ones below position n)
 *
 * AND-ing with this mask:
 *   — bits [n-1..0] : masked with 1 -> preserved unchanged
 *   — bits [31..n]  : masked with 0 -> forced to 0 (cleared)            */

uint32_t clear_msb_to_n(uint32_t x, uint8_t n)
{
    return x & ((1U << n) - 1U);    /* keep only the lower n bits */
    /*
     * (1U << n) - 1U  builds the "keep" mask at compile time if n is
     * a constant — zero runtime cost on any architecture.
     */
}

/*  Method 2: Complement + shift (shows understanding of bit width) 
 *
 * Build a mask of ones for the upper bits, then invert and AND.
 *
 *   ~0U             = 1111 1111 1111 1111 1111 1111 1111 1111
 *   ~0U << n        = 1111 1111 1111 1111 1111 1111 1111 0000  (n=4)
 *   ~(~0U << n)     = 0000 0000 0000 0000 0000 0000 0000 1111  <- same mask
 *
 * Identical result to Method 1, but makes the complement relationship
 * explicit — useful when explaining to an interviewer.                  */

uint32_t clear_msb_to_n_v2(uint32_t x, uint8_t n)
{
    return x & ~(~0U << n);         /* ~0U = all ones; shift left clears low n;
                                       invert again -> low n ones = keep mask  */
}
```

### Extract a bit field from a register

- **Given start bit position and len**

```c
uint32_t extract_bitfield(uint32_t reg, uint8_t start, uint8_t width)
{
    return (reg >> start)               /* Step 1: shift field to bit 0      */
         & ((1U << width) - 1U);        /* Step 2: mask off everything above */
}
```

- **Given start bit position and end bit position**

```c
uint32_t extract_bits(uint32_t value,
                      uint8_t start,
                      uint8_t end)
{
    uint32_t width = end - start + 1;
    uint32_t mask = (1U << width) - 1;
    return (value >> start) & mask;
}
```

- **Given mask and position**

```c
uint32_t extract_with_cmsis_style(uint32_t reg,
                                   uint32_t mask,
                                   uint8_t  pos)
{
    return (reg & mask) >> pos;
}
```

### Insert a bit field into a register

- **Given start bit position and width**

```c
uint32_t insert_bitfield(uint32_t reg,
                         uint32_t field_val,
                         uint8_t start,
                         uint8_t width)
{
    uint32_t mask = ((1U << width) - 1U) << start;

    reg &= ~mask;                            /* Clear field region          */
    reg |= (field_val << start) & mask;      /* Insert new field value      */

    return reg;
}
```

- **Given start bit position and end bit position**

```c
uint32_t insert_bits(uint32_t reg,
                     uint32_t field_val,
                     uint8_t start,
                     uint8_t end)
{
    uint32_t width = end - start + 1;
    uint32_t mask = ((1U << width) - 1U) << start;

    reg &= ~mask;                            /* Clear target bits           */
    reg |= (field_val << start) & mask;      /* Insert field                */

    return reg;
}
```

- **Given mask and position**

```c
uint32_t insert_with_cmsis_style(uint32_t reg,
                                 uint32_t field_val,
                                 uint32_t mask,
                                 uint8_t pos)
{
    reg &= ~mask;                            /* Clear field                 */
    reg |= (field_val << pos) & mask;        /* Insert shifted value        */

    return reg;
}
```