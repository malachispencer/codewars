/*
Codewars. 19/08/20. 'FizzBuzz Backwards'. 6kyu. We are given an array of a FizzBuzz sequence where the multiples being replaced are not
restricted to 3 and 5. We must create a function which returns the numbers whose multiples are being replaced. Here is the solution I
developed to solve the challenge.
1) In order to solve this problem, we simply have to find the index position of the first appearance of Fizz and the index position of the
   first appearance of Buzz. As the numbers for Fizz and Buzz could be the same, we do so in a manner whereby we find the first instance
   in an array where the string includes Fizz/Buzz.
2) Thereore, we call the findIndex method on the array and check for the first string that includes the word Fizz. We do the same for buzz.
   Then we add 1 to both in order to convert the index position into the number, and we return both inside an array.
*/

function reverseFizzBuzz(arr) {
  return [arr.findIndex(e => (/Fizz/).test(e)) + 1, arr.findIndex(e => (/Buzz/).test(e)) + 1];
}