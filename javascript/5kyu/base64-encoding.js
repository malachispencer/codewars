/*
Codewars. 24/06/20. 'Base64 Encoding'. 5kyu. Here we must extend the String object, creating a function which converts a string of ASCII
text to Base64, and a function which converts a Base64 encoded string to a string of ASCII text. Here is the solution I developed to
solve the challenge.
1) In Ruby, we use metaprogramming in order to add a method to a class for example the String class or Array class. In JavaScript, we can
   do a similar thing. Here we extend the string object, creating a method that can be called directly on a string.
2) The syntax for extending the string object is:
   String.prototype.methodName = function() {
     
   };
3) For our Base64 methods, we create a constant string called base64Index, where the index positions are decimal numbers (0-63) holding
   the Base64 character of that decimal number.
4) In the case of adding a method to the string object, the keyword 'this' is like the 'self' keyword in Ruby, it refers to the object the
   method is being called on.
5) We split the string into an array of characters, then we map over the array of characters.
6) As we map, we convert each character to its ASCII value, then each of these ASCII decimals to binary. If the binary is less than 8 bits,
   we pad the front of it with zeros until it is 8 bits. We join this array of 8 bit binaries into a single string.
7) In some cases, we'd now need to pad the end of the binary string with zeros until its length is a multiple of 6, because we are about to
   split it into bits of 6. However, for this kata, that was not required for any of the tests because all the binary strings formed had
   a length that was a multiple of 6.
8) Now we split our binary string into parts of 6, then we map over each set of 6 bits, for each 6 bits, we convert it to decimal
   using the parseInt() method then we convert this decimal number to its Base64 representation by using it to index base64Index. We
   join this array of Base64 characters into a string.
9) We return the Base64 string.
10) For our fromBase64MS(), which is called on a Base64 string. We first split this Base64 string into an array of characters. We can
    safely do so because every Base64 value is a single character.
11) We then map over the array of Base64 characters and for each character, we convert it to its index position in base64Index. Its index
    position in base64Index is its decimal representation. We then convert this decimal number to binary, and pad the start with zeros
    until it is 6 bits, if the binary is less than 6 bits. We then join this array of 6 bit binaries into a single string.
12) In some cases, we'd need to pad the end of the binary string with zeros until its length is a multiple of 8, because we are about to
    split it into parts of 8 bits. However, in this kata all of the test cases binary string came out to have a length that is a multiple
    of 8, so this step is not needed for this kata.
13) We split the binary string into an array of 8 bit binaries, then we map over the array. As we map, we convert each 8 bit binary to
    its decimal representation, which is also its ASCII value, then we convert this ASCII value to its word character representation.
    We then join the array of characters into a string.
14) We return the string of text.
*/

const base64Index = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

String.prototype.toBase64MS = function() {
  let binary = this.split('').map(c => c.charCodeAt(0).toString(2).padStart(8, '0')).join('');
  let base64 = binary.match(/.{6}/g).map(sixBits => base64Index[parseInt(sixBits, 2)]).join('');
  return base64;
};

String.prototype.fromBase64MS = function() {
  let binary = this.split('').map(b64c => base64Index.indexOf(b64c).toString(2).padStart(6, '0')).join('');
  let string = binary.match(/.{8}/g).map(eightBits => String.fromCharCode(parseInt(eightBits, 2))).join('');
  return string;
};

/*
Here is a quick solution, which uses the Node.js Buffer class.
1) For toBase64, we create a buffer object from the string using the Buffer.from() method. In the Buffer.from method, the first (required)
   argument is the string, the second (optional) argument is the encoding its encased in.
2) We then conver the buffer object to a Base64 string using the toString('base64') method.
3) For fromBase64, we create a buffer object from the Base64 string and specify its encoding as being base64.
4) We then convert the buffer object to a string using the toString() method.
*/

String.prototype.toBase64 = function() {
  return Buffer.from(this).toString('base64');
};

String.prototype.fromBase64 = function() {
  return Buffer.from(this, 'base64').toString();
};

