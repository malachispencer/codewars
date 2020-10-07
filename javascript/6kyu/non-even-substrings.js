/*
Codewars. 03/07/20. 'Non-even substrings'. 6kyu. Here we create a function that returns the amount of odd numbered substrings that can be
formed from a string of numbers. For example, in the case of '1341', they are '1', '13', '1341', '3'. '41', '341', '1', a total of 7 odd
numbered substrings. Here is the solution I developed to solve the challenge.
1) We define our function oddSubtringsMS, which takes a string number as its argument.
2) We initialize a count variable to 0, this will be incremented every time we find an odd number substring.
3) We create a while loop which runs while the length of the string is above 0, because every time our for loop runs through, we are going
   to remove the first digit from the string. So eventually our string will be empty.
4) Inside our while loop, we create a for loop which will iterate every digit in the string.
5) Inside our for loop, we create a variable called currentNum, which will be str[0..i] (in Ruby syntax).
6) We then check if the last digit in currentNum is 1, 3, 5, 7 or 9, if so, we inrecement count by 1. 
7) To grab the last character of currentNum we use the substr() method. The substr() method extracts parts of a string, the first parameter 
   is where the extraction begins. We can pass in negative values to begin from the end of the string, just like we'd do str[-1] in Ruby,
   which we can't do in JavaScript. substr() also takes an optional second parameter, which specifies how many characters to extract, if
   this parameter is omitted, it simply extracts the rest of the string. substr() does not change the original string.
7) Once our for loop finished, we remove the first digit from the string, and run the for loop again.
8) Once our loops finish, we return the count.
*/

/*
Example: oddSubstringMS('1357')
1) 1st iteration: str = 1357. currentNum = 1, 13, 135, 1357. count = 4.
2) 2nd iteration: str = 357. currentNum = 3, 35, 357. count = 7.
3) 3rd iteration: str = 57. currentNum = 5, 57. count = 9.
4) 4th iteration: str = 7. currentNum = 7. count = 10.
5) Final count is 10 so 10 is returned.
*/

function oddSubstringsMS(str) {
  let count = 0;
  while (str.length > 0) {
    for (let i = 0; i < str.length; i++) {
      let currentNum = str.slice(0,i+1);
      if (/[13579]/.test(currentNum.substr(-1))) {count++;}
     }
    str = str.replace(/^./, '');
  }
  return count;
}

/*
Here is a solution which uses a shortcut formula to calculate how many odd numbered substrings can be formed.
1) We convert the string number to an array of characters/string digits using the spread operator.
2) We call the reduce method on the array of characters/string digits. Our callback function takes the count (the accumulator), the digits
   and the index positions. The initial value of count is 0.
3) In our reduce block, count is incremented according to a boolean. +n converts the string digit to a number, and the conditional is
   whether +n modulo 2 produces remainder. +n % 2 ? contains a true value if there is remainder (i.e. +n is odd) and a false value if 
   there is no remainder (i.e. +n is even).
4) If n is an odd number, count is incremented by its index position plus 1, if n is an even number, count is incremented by 0 i.e. not
   incremented at all, it stays the same.
5) The result of reduce is returned, which is the count of odd numbered substrings that can be formed.
*/

function oddSubstrings(s){
  return [...s].reduce((count,n,i) =>  count + (+n % 2 ? i + 1 : 0), 0);
}