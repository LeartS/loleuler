## FUCKS

### WAT IS TIS????
[Project Euler](https://projecteuler.net) PROBS SOLVED USIN LOLCODE

### Y????
Y NT?????

### THESE WORK FOR REALZ????
FUK U MAN IF U DONT BLEIVE ME INSTL [LCI](https://github.com/justinmeza/lci) N
SEE FO URSELF

## Seriously
This started as a "fun" way to lose time, but I've since found out
solving the problems using the restricted capabilities of LOLCODE (particularly
no arrays, no useful string functions, no exponentiation ...) forces you to work
around them in ways I think may actually exercise one's problem solving skills.

Here I will list some problems I've encountered solving the problems using
LOLCODE and how I solved them.

#### 1, 2, 3
Nothing particular to note.

#### 4
In normal programming languages the absolutely easiest way to check if an
integer is a palindrome is to get its string representation and check that the
string is the same in either direction.

In python:

```python
def is_palindrome(n):
    return str(n) == str(n)[::-1]
```

In LOLCODE the only thing you can do with strings is concatenate them and you
can't even get their length or access its chars using an array notation,
they are basically useless.

So I had to come out with a method to determine if a number is a palindrome
using only mathematical operations on the integer number.

```lolcode
HOW IZ I LONGT YR NUMBERZ
        I HAS A POWERTEN ITZ 1
    IM IN YR IFSTATEMENT UPPIN YR INDEX TIL FAIL
        BOTH SAEM QUOSHUNT OF NUMBERZ POWERTEN 0, O RLY?
            YA RLY, FOUND YR INDEX
            NO WAI, POWERTEN R PRODUKT OF POWERTEN 10
        OIC
    IM OUTTA YR IFSTATEMENT
IF U SAY SO

HOW IZ I ISBISEX YR POSSIBLEBISEX
    I HAS A CLONE1 ITZ POSSIBLEBISEX
    I HAS A CLONE2 ITZ POSSIBLEBISEX
    I HAS A FRONT
    I HAS A FRONTER ITZ 1
    I HAS A BACK
    I HAS A L ITZ I IZ LONGT YR POSSIBLEBISEX MKAY

    IM IN YR IFSTATEMENT UPPIN YR INDEX TIL BOTH SAEM SUM OF INDEX 1 L
        FRONTER R PRODUKT OF FRONTER 10
    IM OUTTA YR IFSTATEMENT

    IM IN YR REAR
        BOTH SAEM FRONTER 0, O RLY?
            YA RLY, FOUND YR WIN
        OIC
        FRONT R QUOSHUNT OF CLONE1 FRONTER
        BACK R MOD OF CLONE2 10
        DIFFRINT FRONT BACK, O RLY?
            YA RLY, FOUND YR FAIL
        OIC
        CLONE1 R MOD OF CLONE1 FRONTER
        CLONE2 R QUOSHUNT OF CLONE2 10
        FRONTER R QUOSHUNT OF FRONTER 10
    IM OUTTA YR REAR
IF U SAY SO
```

These are two functions: `LONGT`, which returns the length (number of digits)
of an integer, and `ISBISEX`, which returns `WIN` (`true`) if the argument
is a palindrome.

The basic idea is that we can get the first digit by dividing
(integer division! not float) the number by the largest power of then <= to it:

```
2345 / 1000 -> 2
99 / 10 -> 9
6439850 / 1000000 -> 6
```

And the last digit with `number % 10`:

```
2345 % 10 -> 5
99 % 10 -> 9
6439850 % 10 -> 0
```

How to find the second, third, ... digits?
Well, if you invert the operators (`/` and `%`)
you get all except the first and all except the last digits:

```
2345 % 1000 -> 345
99 % 10 -> 9
6439850 % 1000000 -> 439850

2345 / 10 -> 234
99 / 10 -> 9
6439850 / 10 -> 643985
```

So every time we find the first and last digit, we create a new number with
the remaining digits and, at the next iteration, we find the first and
last digits of that number! As soon as first != last you return false,
if you reach the end of the loop you return true.

The length functions is used to calculate the largest power of ten which is less
or equals to N (called `FRONTER` in the solution).
