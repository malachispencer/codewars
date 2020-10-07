/*
Codewars. 02/09/20. 'Simple Fun #78: Build Palindrome'. 6kyu. Here we create a function which takes a string of characters and returns the
shortest possible palindrome that can be formed by adding characters to its end. For example, 'abcdc' will return 'abcdcba' and 'ababab'
will return 'abababa'. Here is the solution I developed to solve the challenge.

The Algorithm
The way our algorithm works is by taking the first character from the string, appending it to the end of the string, then checking if this 
new string is a palindrome. Then it takes the first 2 characters, reverses them, appends them to the string and performs a palindrome check. 
Then it performs this process with the first 3 characters, and so on, until we find a palindrome. This will be the shortest palindrome that
could be formed.

The Implementation
1) We first check if the input is a palindrome, using our effecient isPalindrome function, if so, we return the same string.
2) For all other cases, we create a for loop which starts at index 1 and traverses the rest of the string.
3) Inside our for loop, on each iteration we have a variable called subStr which is the 0th element up to but not including the ith element.
   Because our i variable starts at 1, on the first iteration subStr is the first character of the input string.
4) We convert subStr to an array of characters, reverse those characters, and then join them back into a string and append this string to
   our original string. We store this in merged.
5) If merged is a palindrome, we return merged.
6) All of our test cases were palindromes so there was no need for further return values.
*/

function buildPalindromeMS(str) {
  if (isPalindrome(str)) {return str;}
  for (let i = 1; i < str.length; i++) {
    let subStr = str.slice(0,i);
    let merged = str + [...subStr].reverse().join('');
    if (isPalindrome(merged)) {return merged;}
  }
}

const isPalindrome = (str) => {
  let mid = Math.floor(str.length / 2);
  for (let i = 0; i < mid; i++) {
    if (str[i] !== str[str.length - 1 - i]) {return false;}
  }
  return true;
}