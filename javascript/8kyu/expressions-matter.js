/*
Codewars. 10/06/20. "Expressions Matter". 8kyu. Given three integers, return the largest number obtained after inserting the following
operators and brackets +*(). Here is the solution I developed to solve the challenge.
1) We define our function expressionsMatterMS, which takes 3 integers as its arguments.
2) In JavaScript, we can get the can get the maximum number by using the Math.max() method. We can pass in as many numbers as we like, as
   we do in our function, with four combinations of the operators and brackets.
3) To find the largest number in an array, we can simply do Math.max(...arr).
*/

function expressionMatterMS(a, b, c) {
  return Math.max(a + b + c, a * b * c, (a + b) * c, a * (b + c));
}