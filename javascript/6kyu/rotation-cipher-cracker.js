/*
Codewars. 24/07/20. 'Rotation Cipher Cracker'. 6kyu. Here we create a function that rotates a msg 25 times looking for a decoded message, we
are given a substring, if a message contains that substring, it is a decoded message. We must return all decoded messages. Here is the 
solution I developed in order to solve the challenge.
1) We define our function decodeMS, which takes a message and a substring which could be contained in the original message, or a rotation
   of that message.
2) We initialize an empty array called decoded, where we will store decoded messages.
3) We create a for loop which will run 26 times. Our rotation involves, on each iteration, shifting each letter in the message 1 letter
   forward in the alphabet. To cover all possible ways of decoding, we must do this 26 times.
4) In our for loop, if msg includes the subString, we push that msg into decoded. On the first iteration, this will mean we check our
   original msg before rotating it.
5) We then rotate msg by turning it into an array of characters, mapping over that array of characters, and if the character is a 'z', we
   make it an 'a', otherwise, we turn the character into its ASCII code, add 1, then convert that ASCII code back into a string. Finally,
   we join the array of shifted characters back into a string.
6) Once our loop finishes, finding all possible decoded messages, we return the decoded array.
7) In Ruby, we were able to create a loop which ran 25 times using a times loop, here we had to use a for loop to do the same thing. In
   Ruby, we rotated message using the tr method, in JavaScript, no similar method exists as a built-in method, thus we had to map and use
   ASCII values.
*/

function decodeMS(msg, subString) {
  let decoded = [];
  for (let i = 1; i <= 26; i++) {
    if (msg.includes(subString)) {decoded.push(msg);}
    msg = [...msg].map(c => c === 'z' ? 'a' : String.fromCharCode(c.charCodeAt(0) + 1)).join('');
  }
  return decoded;
}

/*
Here is another solution, which rotates the message using one operation.
1) We initialize our empty array decoded, where we will store our decoded messages.
2) We create a for loop which will run 26 times.
3) If the index of the subString -  i.e. the starting index position of the substring - in msg is not -1, this means msg contains the
   substring, therefore we push msg into decoded.
4) To rotate msg, here we use the replace method and match every character in the string. For each character, we first convert it to its
   ASCII value, then we subtract 96 from its ASCII value to turn it into its ordinal position in the alphabet e.g. z = 122 - 96 - 26, a = 
   97 - 96 - 1. Then we do modulo 26, for all characters but z, this will be the same as the ordinal position, for z this will be 0. Then
   we add 97, which is pushing the ordinal position back into its lower case ASCII value (+96) then adding 1 to get the letter 1 place
   forward.
5) After we have shifted the ASCII value, we convert it back to its character form using String.fromCharCode().
6) Once our for loop finishes, we return decoded.
*/

function decode(msg, subString) {
  let decoded = [];
  for (let i = 0; i < 26; i++) {
    if (msg.indexOf(subString) != -1) {decoded.push(msg);}
    msg = msg.replace(/./g, c => String.fromCharCode((c.charCodeAt(0) - 96) % 26 + 97));
  }
  return decoded;
}