/*
Codewars. 19/08/20. 'Number of trailing zeros of N!' 5kyu. Here we create a function which calculates the number of trailing zeros in the
factorial of a given number n. The factorial of a number is simply the product of all positive integers less than or equal to n. For
example, 5! = 1 * 2 * 3 * 4 * 5 = 120.

The Method/Rule:
Any number greater than 4! ends in one or more zeros. In order to calculate the number of trailing zeros in a given factorial, we simply
have to successively divide that number by 5 until that number is less than 5. How ever many times n can be successively divided by 5, is
the number of trailing zeros of n!. For example, 30 / 5 = 6, then 6 / 5 = 1, so there are 7 trailing zeros in 30!. 30! is 
265252859812191058636308480000000 so this is correct.

The Code:
1) We create a variable called trailingZeros and initialize it to 0.
2) We create a while loop which runs as long as n is greater than or equal to 5.
3) We make n equal to n divided by 5 and floor the result, ceiling the result didn't work.
4) Each time we divide n by 5, we increment trailingZeros by the result.
5) Once n is lower than 5, the while loop is broken out of, and we return trailingZeros.
*/

function zerosMS(n) {
  let trailingZeros = 0;
  while (n >= 5) {
    n = Math.floor(n / 5);
    trailingZeros += n;
  }
  return trailingZeros;
}