/*
Codewars. 26/08/20. 'Numerical Palindrome #2'. 6kyu. Here we create a function which takes a number n and returns whether that number
contains a palindrome. Single digit numbers will not count as palindromes. Here is the solution I developed to solve the challenge, which is
a permutational, brute force solution. According to Stack Overflow, the isPalindrome helper function is the most effecient way to determine
whether a string is a palindrome.

palindromesWithinMS:
1) we first handle our error checking, returning 'Not valid' if n is not an integer of n is a negative integer.
2) We then convert n to a string so that we can slice it.
3) We create a while loop which runs as long as n contains more than 1 digit.
4) Inside our while loop, we create a for loop where i starts at 1 and we iterate the rest of the digits in the string.
5) Inside our for loop, we create a variable called subStr, which always starts off taking the first 2 digits of the string and gets 1
   digit longer as i traverses the rest of the string index.
6) We pass subStr into our isPalindrome helper function, if subStr turns out to be a palindrome as evaluated by our helper function, our
   main function returns true.
7) If not, after our for loop, we remove the first digit from the string, and our while loop runs the for loop again. This process
   continues until n is only 1 digit, at which point the while loop breaks.
8) Once we have been through the while loop and seen all the permutations and not returned true, we know that our input number did not
   contain a palindrome, so we return false.

isPalindrome:
1) Our isPalindrome function is an arrow function which takes a string as its argument. 
2) First we find the middle index of the array by diving its length by 2 and flooring the result. For example, if our has 5 elements we'll
   do 5 / 2 = 2.5 then rounding down we get 2. We store this in a variable called mid.
3) We then create a for loop which runs as long as i is less than mid.s
4) In our for loop, if at any point str[i] is not equal to the element at its opposite index position (str[str.length - i - 1]), we return
   false because the string is definitely not a palindrome.
5) If we have gone through our for loop and our function has not returned false, we have a palindrome, so we return true.
6) Odd length true example: isPalindrome('12321')
   1) mid = 5 / 2 = 2.5, rounded down = 2.
   2) str[0] = 1. str[5 - 0 - 1] = str[4] = 1.
   3) str[1] = 2. str[5 - 1 - 1] = str[3] = 2.
   4) Now i = 2, which is not less than mid, so the for loop stops. At this point we only have 1 character in the string to assess, but up
      to now everything has been equal, so this is definitely a palindrome.
   5) True is returned.
7) Even length true example: isPalindrome('123321')
   1) mid = 6 / 3 = 3.
   2) str[0] = 1. str[6 - 0 - 1] = str[5] = 1.
   3) str[1] = 2. str[6 - 1 - 1] = str[4] = 2.
   4) str[2] = 3. str[6 - 2 - 1] = str[3] = 3.
   5) i is now 3, which is no longer less than mid, so the for loop finishes.
   6) True is returned.
*/

function palindromeWithinMS(n) {
  if (!Number.isInteger(n) || n < 0) {return 'Not valid';}
  n = String(n);
  while (n.length > 1) {
    for (let i = 1; i < n.length; i++) {
      let subStr = n.slice(0, i+1);
      if (isPalindrome(subStr)) {return true;}
    }
    n = n.slice(1);
  }
   return false;
 }
   
 const isPalindrome = str => {
   let mid = Math.floor(str.length / 2);
   for (let i = 0; i < mid; i++) {
     if (str[i] !== str[str.length - i - 1]) {return false;}
   }
   return true;
 }

/*
Here is a solution which doesn't permute n and instead uses a regular expression to find whether there is a palindrome in the string.
1) In our ternary operator we first check if n is not an integer or is a negative integer, if so we return 'Not valid'.
2) Otherwise, we call the test method on n converted to a string (with no delimiter). In our regex, we match a digit, followed by 0 or 1
   digit, followed by a repitition of the first digit.
3) Our regular expression will match two of the same digit next to each other, or three digits where the first and last are the same but
   the middle one is different. For example, if our input is 123322367, we can match two palindromes here with this regex, 33 and 22. If
   our input is 1215, we can match 121 with our regex.
4) A pattern we have noticed is that if there is a palindrome in the string, we don't need to search for 4, 5 or 6+ length palindromes, we
   only need to find 2 or 3 length palindromes.
*/

function palindromeWithin(n) {
  return !Number.isInteger(n) || n < 0 ? "Not valid" : /(\d)\d?\1/.test('' + n);
}