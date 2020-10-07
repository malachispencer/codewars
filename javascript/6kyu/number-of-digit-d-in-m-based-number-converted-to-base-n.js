/*
Codewars. 07/07/20. 'Number of Digit d in m-based Number Converted to Base n'. 6kyu. Here we create a function that takes 4 inputs, a
string number in a particular base, the base of that number, the base we are to convert that number to and the digit we are to count in
that new number. Here is the solution I developed to solve the challenge.
1) We define our function countDigitMS, which takes num, fromBase, toBase and d as its arguments.
2) Using the parseInt method, we first convert our base-k string number to its decimal (base 10) representation.
3) Using the toString method, we then convert the number to the base we have to convert it to.
4) We then call the match method and pass in a regex object using a constructor, which we have to do because we need to use string
   interpolation to place the input digit we are searching for in the regex. We use the or empty array for cases where no matches are found
   so we get an empty array instead of null.
5) We return the length of our array, which is the number of matches i.e. the number of digit d in the base-k number.
*/

function countDigitMS(num, fromBase, toBase, d) {
  return (parseInt(num, fromBase).toString(toBase).match(RegExp(`${d}`, 'g')) || []).length;
}