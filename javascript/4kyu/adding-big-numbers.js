/*
Codewars. 11/07/20. 'Adding Big Numbers'. 4kyu. Here we create a function that takes two numbers - which can be extremely large - and sums 
them. Due to the length of the numbers, the inputs will be strings, the output must also be a string. This is the second 4kyu JavaScript 
kata I have self-solved and my third 4kyu self-solved overall. Here is the solution I developed to solve the challenge.
1) We define our function addBigNumsMS, which takes 2 string numbers as its arguments.
2) If one of our numbers is shorter than the other, we will pad the shorter one with 0s at the beginning to make our life easier, thus we
   check if either is shorter and pad with 0s until the shorter is equal in length to the longer number.
3) We initialize a variable called sum, as an empty string, we will store our output here.
4) We initialize a variable called carry to 0, this will be the carry as we add the digits together as we traverse both numbers.
5) We create a for loop which runs the length of the numbers.
6) Inside our for loop, n1d becomes the current digit of n1. We perform addition from right to left so initially n1d is the last digit
   and on each iteration n1d becomes the digit to the left. We do the same for n2 with n2d.
7) We create a variable called digCarrySum, where we add together the digit of n1, digit of n2 and the carry (which on the first
   iteration will be 0), then we convert the product to a string.
8) We create a variable called thisDig, which is the last digit of digCarrySum, this is the digit that will be added to the front of the
   sum string on each iteration.
9) We then add thisDig to the front of sum.
10) Now we determine whether there will be carry that will be added to the sum of n1 and n2s respective digits in the next iteration,
    so if our digCarrySum from this iteration was 10 or above, there will be carry, and it will be 1, if not, we make it 0. The carry can
    only ever be 1 because we are adding single digits.
11) Once our for loop has finished, if carry was produced on the last iteration, we concatenate that carry to the front of sum and return
    it, otherwise, we simply return sum.

Example: addBigNumsMS('4888','22295')
1) n1 is shorter than n2 so n1 is padded with zeros. Now n1 = 04888.
2) Iteration 1: n1d = 8. n2d = 5. carry = 0. n1d + n2d + carry = 13. thisDig = 3. sum = 3. carry = 1.
3) Iteration 2: n1d = 8. n2d = 9. carry = 1. digCarrySum = 8 + 9 + 1 = 18. thisDig = 8. sum = 83. carry = 1.
4) Iteration 3: n1d = 8. n2d = 2. carry = 1. digCarrySum = 8 + 2 + 1 = 11. thisDig = 1. sum = 183. carry = 1.
5) Iteration 4. n1d = 4. n2d = 2. carry = 1. digCarrySum = 4 + 2 + 1 = 7. thisDig = 7. sum = 7183. carry = 0.
6) Iteration 5. n1d = 0. n2d = 2. carry = 0. digCarrySum = 0 + 2 + 0 = 2. thisDig = 2. sum = 27183. carry = 0.
7) carry is 0 so sum is returned, 27183.
*/

function addBigNumsMS(n1,n2) {

  if (n2.length < n1.length) {n2 = n2.padStart(n1.length, '0');}
  if (n1.length < n2.length) {n1 = n1.padStart(n2.length, '0');}

  let sum = '';
  let carry = 0;

  for (i = 0; i < n1.length; i++) {
    let n1d = n1[n1.length - 1 - i];
    let n2d = n2[n2.length - 1 - i];
    let digCarrySum = String(+n1d + +n2d + carry);
    let thisDig = digCarrySum.slice(-1);
    sum = thisDig + sum;
    carry = +n1d + +n2d + carry >= 10 ? 1 : 0;
  }
  
  return carry == 1 ? `1${sum}` : sum;
}