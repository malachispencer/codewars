/*
Codewars. 15/07/20. 'Adding Binary Numbers'. 6kyu. Here we create a function that takes two binary strings and performs addition on them.

Rules for binary addition:
1) 0 + 0 = 0.
2) 1 + 0 = 1.
3) 1 + 1 = 0 (carry 1). 10 in binary is 2 in decimal.
4) 1 + 1 + 1 = 1 (carry 1). 11 in binary is 3 in decimal.

Here is the solution I developed to solve the challenge.
1) We define our function addBinaryMS, which takes two binary strings as its arguments.
2) First we handle our special case, if b1 and b2 both equate to 0, the resulting binary string will be 0, so we return that.
3) To make our life easier, if one of our binary strings is shorter in length than the other, we pad the front of the shorter one with
   0s until its length is equal to that of the longer one.
4) Our sum will be stored in a string, so we initialize a sum variable as an empty string.
5) We initialize our carry variable to 0, necessary when performing addition.s
6) We create a for loop. Because addition is performed from right to left, we set our index variable initially to be the last element in
   bothh binary strings. Our loop runs as long as our index variable is greater than or equal to 0. On each iteration our index variable
   decrements by 1.
7) Inside our for loop, we set the current digit of b1 to b1b and the current digit of b2 to b2b, standing for b1-bit or b2-bit.
8) We create a variable bcsum, which stands for bits-carry-sum. This can range from 0 (0 + 0 + 0) to 3 (1 + 1 + 1).
9) If bcsum is 1 or 3, we add concatenate a 1 to the front of sum. Otherwise, bcsum must be 0 or 2, in which case we concatenate a 0 to
   the front of sum.
10) If bcsum is 2 or 3, this creates a carry that must be added to b1b and b2b for the next iteration, that carry will be 1. If bcsum is
    0 or 1, there is no carry, and so carry becomes 0 for the next iteration.
11) Once we have gone through our for loop, if the last bcsum produced a carry, we concatenate 1 to the front of sum, and this is our
    final result, if no carry was produced, we simply remove any possible leading zeros, and this is our final result.
*/

function addBinaryMS(b1,b2) {
  if (b1 == 0 && b2 == 0) {return '0';}
  if (b1.length < b2.length) {b1 = b1.padStart(b2.length, '0');}
  if (b2.length < b1.length) {b2 = b2.padStart(b1.length, '0');}
  let sum = '';
  let carry = 0;
  
  for (let i = b1.length - 1; i >= 0; i--) {
    let b1b = +b1[i];
    let b2b = +b2[i];
    let bcsum = b1b + b2b + carry;
    if (bcsum == 1 || bcsum == 3) {
      sum = 1 + sum;
    } else {
      sum = 0 + sum;
    }
    carry = bcsum > 1 ? 1 : 0;
  }
  
  return carry ? carry + sum : sum.replace(/^0+/, '');
}