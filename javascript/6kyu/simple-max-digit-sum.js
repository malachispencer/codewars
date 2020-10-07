/*
Codewars. 29/08/20. 'Simple max digit sum'. 6kyu. Here we create a function which takes an integer n and returns the largest integer less
than or equal to n which has the highest digit sum. Here is the solution I developed to solve the challenge.

Pattern Recognition:
1) The brute force approach simply would not work for this kata, so I didn't even try it. There is a mathematical approach to solving this
   kata, but instead I opted for a pattern recognition solution, at no point did I actually calculate any digit sums. 
2) A pattern I noticed is that for all integers with 3+ digits, we can simply figure out a rule by looking at second digit.
3) If there are 1 or more 9s after the first digit, we take that slice of the first digit plus the 9s, decrement the last 9 by 1 and join
   that together with an amount of 9s equal to the digits of the original number minus the slice. For example, 19999525076 has a slice of
   19999 so that becomes 19998 and gets joined with 999999 to form 19998999999. If n is 39117694261, the slice is 39, which becomes 38 and
   gets joined with 999999999 to form 38999999999.
4) If the second digit is not a 9 but the first is 2-9, we simply decrement the first digit and then join the amount of 9s the remainder of
   the original number. For example, 25267865164 becomes 19999999999.
5) If the second digit is not 9 and the first is 1, we simply form a series of 9s 1 less in length than the original number.

The Code:
1) We create a constant object called decrement, where the property is a digit and the value is its predecessor. This means we can
   decrement our string digits without doing any subtraction or having to convert them to integers.
2) In our function, we create a variable called s where we store the string form of the number.
3) We first handle edge cases, single digit numbers return the same input. Likewise, 2 digits numbers that have an 8 or 9 as the second
   digit, will have the highest digit sum of any number under it. For example, 48 = 4 + 8 = 12, 39 = 3 + 9 = 12 but 48 is higher so 48 is
   returned. Similarly, 49 = 4 + 9 = 13, 48 = 12, 39 = 12.
4) Now we get onto our bulk cases, if the first digit is 1-9 and the second digit is 9, in a variable called start we store the first
   digit together with the 1 or more 9s at the start of the string. We then concantenate start up to but not including its last digit,
   with the last digit of start decremented, and the amount of 9s that make the string equal to the length of the original number. We
   convert the string to a number and return it.
5) If the second digit is not 9 and the first is 2-9, we decrement the first digit and concatenate that to an amount of 9s equal to 1 less 
   than the length of the original number, we convert that string to a number and return it.
6) If the second digit is not 9 and the first is 1, we return a number that is all 9s, 1 less than the length of the original number.
*/

const decrement = {2: '1', 3: '2', 4: '3', 5: '4', 6: '5', 7: '6', 8: '7', 9: '8'}

function maxDigitSumMS(n) {
  let s = String(n);
  
  if (s.length === 1) {return n;}
  if (s.length === 2 && /[89]/.test(s[1])) {return n;}
  
  if (/[1-9]/.test(s[0]) && s[1] === '9') {
    let start = s.replace(/^(.9+)(.+)$/, '$1');
    return +(start.slice(0,-1) + decrement[start.slice(-1)] + '9'.repeat(s.length - start.length));
  } else if (/[2-9]/.test(s[0])) {
    return +(decrement[s[0]] + '9'.repeat(s.slice(1).length));
  } else if (s[0] === '1') {
    return +('9'.repeat(s.length - 1));
  }
}