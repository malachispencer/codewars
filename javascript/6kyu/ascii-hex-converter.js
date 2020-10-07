/*
Codewars. 23/06/20. 'ASCII hex converter'. 6kyu. Here we create a function that can take ASCII text and convert it to hex and a function
which can take hex and convert it to ASCII text. For example, asciiToHex('Look mom, no hands') should return '4c6f6f6b206d6f6d2c206e6f206
8616e6473' and hexToASCII('4c6f6f6b206d6f6d2c206e6f2068616e6473') should return 'Look mom, no hands'. Here is the solution I developed to
solve the challenge.
1) We define our first function asciiToHexMS, which takes a string of ASCII text as its argument.
2) We split the text into an array of characters.
3) We then map over each character, for each character, we convert it to its ASCII value using the charCodeAt() method, then we convert the
   ASCII value (i.e. decimal number) to its hex representation using the toString(16) method.
4) Now we have an array of hex values, we join them into a string with no spaces.
5) We define our second function hexToASCIIMS, which takes a hexadecimal string as its argument.
6) In this kata, none of the hex values are the decimal 0-15 hex values, which are single characters, so we can split the hex string into
   an array after every 2 characters (a single hex value) using the match method.
7) We then map over the array of hex values and for each hex, we convert it to its decimal/ASCII value using parseInt(j, 16), then we
   convert this ASCII value to its word character representation using the String.fromCharCode() method.
8) We then join the array of now word characters into a string.
*/

function asciiToHexMS(ascii) {
  return ascii.split('').map(c => c.charCodeAt(0).toString(16)).join('');
}

function hexToASCIIMS(hex) {
  return hex.match(/../g).map(h => String.fromCharCode(parseInt(h, 16))).join('');
}

/*
Here is a similar solution, which uses the replace() method instead of splitting and mapping.
*/

function asciiToHex(ascii) {
  return ascii.replace(/./g, c => c.charCodeAt(0).toString(16));
}

function hexToASCII(hex) {
  return hex.replace(/../g, h => String.fromCharCode(parseInt(h, 16)));
}