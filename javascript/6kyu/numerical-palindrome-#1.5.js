/*
Codewars. 26/08/20. 'Numerical Palindrome #1.5'. 6kyu. Here we create a function which takes two numbers, n and s, and returns an array of
the first s palindromes after (and including) n. Here is a refined version of the solution I developed to solve the challenge, which is a
brute force solution.
1) First we handle our error checking. Using the Number.isInteger() method, we check if n is not an integer or s is not an integer and if so
   we return 'Not valid'. Likewise, if n is a negative integer we return 'Not valid'.
2) We initialize an empty array called palins, where we will store all the palindromes after and including n.
3) We create a for loop, our iteration variable n is the higher of our input n or 11. This is primarily for cases where n is a single
   digit number, because we are not counting single digit numbers as palindromes. But also if for example n is 10, it will make our search
   start at 11 instead of 10.
4) Our for loop runs as long as palins has less than s elements and on each iteration n is incremented by 1.
5) If the string form of our number is equal to the string form in reverse, we push that integer into palins.
6) Our loop stops when palins has s elements, then we return palins.
*/

function palindromesAfterNMS(n,s) { 
  if (!Number.isInteger(n) || !Number.isInteger(s) || n < 0) {return 'Not valid';}
  let palins = [];
  for (n = Math.max(11, n); palins.length < s; n++) {
    if (String(n) === [...String(n)].reverse().join('')) {palins.push(n);}
  }
  return palins;
}

/*
Here is another variation of my solution, which uses a helper function to check if the number is a palindrome.
1) Our helper function is an arrow function that takes a string as its argument.
2) We first initialize a variable called isPalin to true.
3) We also initialize a variable i to the index of the first character in the string, and a variable j to the index of the last character
   in the string.
4) We create a while loop which runs as long as i is less than j and isPalin equal to true.
5) On each iteration, we make isPalin equal to the result of whether str[i] === str[j] and then we increment i by 1 and decrement j by 2.
6) If isPalin is false at any point, the loop is broken out of immediately and isPalin (false) is returned.
7) When we have a palindrome, if its length is odd - for example '12321' - on the first iteration str[i] = 1 and str[j] = 1, on the second
   str[i] = 2 and str[j] = 2, then at the next loop check i = 2 and j = 2. i is no longer less than j because there is only one character - 
   the middle character - left to check so the loop is broken out of and we return isPalin (true).
8) When we have a palindrome and its length is even - for example '123321' - on the first iteration str[i] = 1 and str[j] = 1, on the
   second str[i] = 2 and str[j] = 2, on the third str[i] = 3 and str[j] = 3. Then i = 3 and j = 2, i is no longer less than j so the loop
   is broken out of and isPalin (true) is returned.
*/

function palindromesAfterN(n,s) { 
  if (!Number.isInteger(n) || !Number.isInteger(s) || n < 0) {return 'Not valid';}
  let palins = [];
  for (n = Math.max(11, n); palins.length < s; n++) {
    if (isPalindromeX(String(n))) {palins.push(n);}
  }
  return palins;
}

const isPalindrome = str => {
  let isPalin = true;
  let i = 0;
  let j = str.length - 1;
  while (i < j && isPalin === true) {
    isPalin = str[i] === str[j];
    i++;
    j--;
  }
  return isPalin;
}
