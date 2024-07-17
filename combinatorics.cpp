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



/**
 * @brief Calculates the factorial of a given number.
 * 
 * @example fact(0) => 1
 * @example fact(1) => 1
 * @example fact(4) => 24
 * @example fact(8) => 40320
 * @param n The number for which factorial is to be calculated.
 * @return The factorial of the given number.
 */
unsigned long long fact(unsigned int n) {
    // base case
    if (n == 0 || n == 1) {
        return 1;
    }
    // recursive case
    return n * fact(n - 1);
}

/**
 * @brief Calculates the permutation of n and r.
 * 
 * @example perm(5, 2) => 20
 * @example perm(6, 3) => 120
 * @param n The total number of elements.
 * @param r The number of elements to be selected.
 * @return The permutation of n and r.
 */
unsigned long long perm(unsigned int n, unsigned int r) {
    // check if r is greater than n
    assert(r <= n);
    // return the permutation
    return fact(n) / fact(n - r);
}