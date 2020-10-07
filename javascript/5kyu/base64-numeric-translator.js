/*
Codewars. 06/07/20. 'Base64 Numeric Translator'. 5kyu. Our standard numbering system is base 10, which includes the digits 0-9. Base 2
(binary) consists of digits 0 and 1. Hexadecimal is base 16, which consists of 0-9 then A-F. Base 64 contains 64 individual characters
which translate in base 10 to 0-63. Here we create a function which converts a base 64 string to its base 10 integer value.

Base representation and base 64 to base 10:
1) Any number can be represented as each of its digits multiplied by its base to the power of the digit's right-to-left index position in 
   the number i.e. the digit's distance from the end of the number or decimal point.
2) B10 Example 1: 52 can be represented as 5 * (10 ** 1) + 2 * (10 ** 0) = 5 * 10 + 2 * 1 = 50 + 2 = 2. 
3) B10 Example 2: 469 can be represented as 4 * (10 ** 2) + 6 * (10 ** 1) + 9 * (10 ** 0) = 4 * 100 + 6 * 10 + 9 + 1 = 469.
4) This is the process we use to convert a base 64 number to base 10.
5) B64 Example 1: BA. B = 1 in base 10. A = 0 is base 10. 1 * (64 ** 1) + 0 * (64 ** 0) = 1 * 64 + 0 * 1 = 64 + 0 = 64.
6) B64 Example 2: //. / is 63 in base 10. 63 * (64 ** 1) + 63 * (64 ** 0) = 4032 + 63 = 4095.

The Code:
1) Based on the above process, we first create a string with all our base 64 characters, each character's index position is its base 10
   (decimal) representation. We call the string base64Ind.
2) In our base64ToBase10MS function, the first thing we do is initialize a variable i to the max index position of the digit. This will
   be decremented on each iteration in our reduce function, giving us each digit's distance from the end of the number.
3) We split the base64 string into an array of characters using the spread operator, then we call reduce on the array.
4) Inside our reduce function, we create a variable called n, which will be the index position of the current character in base64Ind, this
   index position is the character's base 10 value.
5) We increment the sum by n (the base 64 character's base 10 value) multiplied by 64 to the power of i.
6) We decrement i.
7) Once we've traversed every character in the base 64 string, we return the sum and the result of our reduce function is returned from
   our base64ToBase10MS function.
*/

const base64Ind = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

function base64ToBase10MS(b64) {
  let i = b64.length - 1;
  return [...b64].reduce((sum,c) => {
    let n = base64Ind.indexOf(c);
    sum += n * (64 ** i);
    i--;
    return sum;
  }, 0);
}