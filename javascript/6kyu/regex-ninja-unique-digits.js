/*
Codewars. 07/07/20. 'Regex Ninja: Unique Digits'. 6kyu. Here we create a function that uses a regular expression to check if a string 
contains all unique digits. For example, '1234' will return true and '1232' will return false. Here is the top solution on Codewars.
1) We define our function allUniqueDigits, which takes a string of digits as its argument.
2) We call the test method on our regex and pass in the string.
3) In our regex, ^ asserts position at the start of the string.
4) ?! is a negative lookahead, in our regex we use this to check that what follows the current position (the start of the string) is NOT
   the pattern.
5) We check for 0 or more characters, followed by a characer (CG1), followed by 0 or more characters, followed by a repitition of capture 
   group 1. Essentially, we check that no single character in the string is repeated.
*/

function allUniqueDigits(str) {
  return (/^(?!.*(.).*\1)/).test(str);
}

/*
Here is another solution which is exactly the same as above, but instead of using . uses the digit character class.
*/

function allUniqueDigitsX(str) {
  return (/^(?!\d*(\d)\d*\1)/).test(str);
}