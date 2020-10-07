/*
Codewars. 23/06/20. 'Words to Hex'. 6kyu. Here we create a function which takes a string of words and returns an array of those words as
hexadecimal colour values. A word consists of a sequence of ASCII characters between two white space characters or the first and last
word in the string. Each word will represent a hexadecimal value by taking the first 3 characters of the word, finding the ASCII value for
each of the 3 characters, then converting this ASCII to hex. These hex values will represent the colours red, blue and green. This will
then be combined into one readable RGB hexadecimal value e.g. #FFFFFF. If the word is less than 3 characters, its hex must be padded with
zeros. Here is the solution I developed to solve the challenge.
1) We define our function wordsToHexMS, which takes a string of words as its argument.
2) We split the words at the spaces, into an array of words.
3) We then map over the array of words and perform a series of operations on each word.
4) We first take only the first 3 characters of the word using the slice() method.
5) We then call the replace method on the first 3 characters of the word, we match each character and create a block variable c, then
   for each character we convert it to its ASCII value using charCodeAt() and then convert the ASCII value to hex using toString(16).
6) Now we have an red, blue and green hex representation for each word, but if the word contained less than 3 characters, we'll be missing
   1 or more hex values, so we use the padEnd() method to concatenate 0s to the end until the width of the hex string is 6.
7) All of the operations we have performed on each word, we place in string interpolation, so that we can add a hash symbol to the front
   of the string, which completes the words transformation to an RGB hexadecimal value.
8) We return the array of RGB hexadecimal values.
*/

function wordsToHexMS(words) {
  return words.split(' ').map(w => `#${w.slice(0,3).replace(/./g, c => c.charCodeAt(0).toString(16)).padEnd(6, '0')}`);
}