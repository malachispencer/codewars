/*
Codewars. 17/06/20. 'Three added Characters'. 6kyu. We are provided with two strings, s1 and s2. s2 will be the same as s1 but it will
have 3 extra characters and it may be shuffled. The 2 added characters are all the same character, and this character may also exist in s1.
We must create a function which returns the added character. Here is the solution I developed to solve the challenge.
1) We define our function addedCharMS, which takes s1 and s2 as its argument.
2) We first convert s1 to an array of characters by using split(''), then we sort the array of characters.
3) We do the exact same for s2.
4) Another way to generate an array of characters from a string is to use [...s1].
5) Then we call the find method on s2, the find method returns the first element which passes our test. In our test, we check if the
   current character in s2 is not equal value or type to the character in the same index position in s1, because both array of characters
   are sorted - and apart from the extra characters are the same - the first time this occurs, we have stumbled upon the extra character.
6) We return the extra character.
*/

function addedCharMS(s1, s2) {
  s1 = s1.split('').sort();
  s2 = s2.split('').sort();
  return s2.find((c,i) => c !== s1[i]);
}

/*
Here is another solution, which converts the characters to their ASCII codes.
1) We initialize an accumulator variable called code, to which we'll add the ASCII values of s2 and subtract the ASCII values of s1.
2) We create a for loop which will traverse s2, the longer string.
3) In JavaScript, the charCodeAt() method converts a character to Unicode, the first 128 Unicode code points are a direct match of ASCII
   values. In its argument the charCodeAt() method takes an index position.
4) Inside our for loop, we increment code by the difference between the ASCII value of the current character in s2 and the ASCII value of
   the current character in s1.
5) Because s2 is longer than s1, eventually s1.charCodeAt(i) will be returning NaN (not a number value). Therefore to coerce this to an
   integer - which will be 0 - we use the double tilde operator (~~). The doulbe tilde operator is sometimes used as a substitute for
   Math.floor in JavaScript, some say it's slightly faster.
6) Now code is the difference between the sum of ASCII values of s2 and the sum of ASCII values of s1. Because there are 3 extra - all the
   same - characters in s2, if we divide code by 3, we will get the ASCII value of the extra character. So we do just that and using the
   String.fromCharCode() method we convert the Unicode value of the extra character, into its word character.
7) We return the extra character.
*/

function addedChar(s1, s2) {
  let code = 0;
  for (let i = 0; i < s2.length; i++) {
    code += (s2.charCodeAt(i) - ~~s1.charCodeAt(i));
  }
  return String.fromCharCode(code / 3);
}

/*
Here is another solution which uses Unicode, this time using the reduce method.
1) We split s2 into an array of characters so that we can call the reduce method on it.
2) We call the reduce method, and pass in the accumulator (s), the element (e) and the index (i) as the three paramaters. We set the
   initial value of the accumulator to 0.
3) We increment the accumulator by the difference between the Unicode of the current character in S2 and the Unicode of the current
   character in s1. Once we have traversed all the elements of s1, the double tilde ~~ operator ensures that NaN is coerced into 0.
4) The sum of our reduce function is the difference between the ASCII values of s2 and s1, we divide this by 3 to give us the ASCII value
   of the extra character.
5) We convert the ASCII value of the extra character into its word character using the String.fromCharCode method and return this.
*/

function addedCharX(s1, s2) {
  let code = s2.split('').reduce((s,e,i) => s += (s2.charCodeAt(i) - ~~s1.charCodeAt(i)), 0) / 3;
  return String.fromCharCode(code);
}

/*
Here is a solution which involves creating a counter object, similar to the common practice of creating a counter hash in Ruby.
1) We create an empty object where we will store the counts of each character for s1 and we do the same for s2.
2) We split s1 into an array of characters, then call the forEach() method on it, as we iterate each character, s1o[c] ? essentially is
   the same as s1o[c] != undefined, so it's asking if there is a value in this object key, if there is, the value is incremented by 1, if
   not, the value becomes 1.
3) Basically, if there is not yet a value in the key, we assign it the value 1, then after that, every time it is encountered, we increment
   the value by 1.
4) We do the exact same process of 2) and 3) for s2.
5) Now we have 2 objects which hold the counts of each character in s1 and s2 respectively, we use the Object.keys() method to turn the
   keys of s20 into an array - we also could have simply used s2.split('') again here - then we call the find method on the array of s2's
   characters.
6) In our find test, we check which value of s1o and s2o's object key's are different. So if our inputs are 'aabbcc' and 'aacccbbcc', this
   will be c because s1o['c'] = 2 and s2o['c'] = 5. In the case of our inputs being 'abcde' and '2db2a2ec', this will be 2 because all
   other keys will have the same value, but 2 will be 3 for s2o and undefined for s1o.
7) Find returns the first match, but remember because there is only one added character, the extra character can only be that added
   character.
*/

function addedCharZ(s1, s2) {
  let s1o = {};
  let s2o = {};
  s1.split('').forEach(c => s1o[c] ? s1o[c]++ : s1o[c] = 1);
  s2.split('').forEach(c => s2o[c] ? s2o[c]++ : s2o[c] = 1);
  return Object.keys(s2o).find(c => s2o[c] != s1o[c]);
}