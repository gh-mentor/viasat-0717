/*
This file contains operations used in combinatorics. Examples include factorial, permutation, and combination.
*/

#include <iostream>
// include the assertions librations
#include <cassert>


/*
Define a factorial function 'fact' that calculates the factorial of a number.
Arguments:
'n' - an unsigned integer
Return:
unsigned long long.
Requirements:
- The function should use recusion.
Implementation details:
- If n == 0 or n == 1, return 1
- return n * fact(n - 1)
Examples:
fact(0) => 1
fact(1) => 1
fact(4) => 24
fact(8) => 40320
*/

unsigned long long fact(unsigned int n) {
    // base case
    if (n == 0 || n == 1) {
        return 1;
    }
    // recursive case
    return n * fact(n - 1);
}