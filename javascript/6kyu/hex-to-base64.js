/*
Codewars. 24/06/20. 'Hex to base64'. 6kyu. Base64 is generally used in computer software to encode binary data and send it over a 
text-based protocol such as HTTP. It also ensures text does not get corrupted during transfer. Base64 does not conceal data so it should
not be used for encryption because Base64 can be easily decoded. Here we create a function that converts a hex encoded string to Base64.
Here is the solution I developed to solve the challenge.
1) First we create a string called base64Index, where each index position 0-63 represents its base64 character.
2) We generate an array of the multiples of 6, up to the highest multiple of 6 we'll need for the kata. We use this to figure out how many
   zeros our binary string needs to be padded with.
3) We generate an array of the multples of 4, up to the highest multiple of 4 we'll need for the kata. We use this to figure out how many
   = signs our base64 string needs to be padded with.
4) We define our function hexToBase64MS, which takes a hexadecimal string as its argument.
5) The first thing we do inside our function is generate an array of each hex value in our hexadecimal string using the match method and
   matching every 2 characters in the string.
6) We then map over the array of hex values and for each hex value, we convert it to decimal using the parseInt() method with 16 passed in
   as the radix to signify the string we are parsing is hexadecimal. We then convert this decimal number binary using toString(2). The
   final operation we perform within the map block is to pad each binary with zeros until its width is 8.
7) We then join the array of binary strings into a single, long binary string where each hex value from our original string is represented
   in 8 bits. We store this in a variable binary.
8) Now, our string of 8 bits must be reinterpreted into 6 bit segments, but in order to do so we must ensure that the length of the binary
   string is a multiple of 6. So we call the find method on the multiplesOf6 array and return the first multiple which is equal to or
   greater than the length of the binary string. We store this in a variable binaryWidth.
9) We then pad the end of the binary string with zeros until its width is equal to its nearest multiple of 6 i.e. binaryWidth.
10) Now we split our binary string into segments of 6 using the match method.
11) We then map over the the array of 6 bit binary strings and convert each binary string to a decimal number. All of these 6 bit binary 
    strings will amount to a decimal number between 0 and 63. Then this decimal number is used to index base64Index. The decimal number 
    will be converted to its Base64 representation. We then join this array of Base64 characters into a string and this is stored in a
    string called base64.
12) A Base64 string must be a multiple of 4. So now we call the find method on multiples of 4 and return the first multiple that is
    equal to or greater than the length of the Base64 string. We store this in base64Width.
13) We return the Base64 string, with the end padded with = symbols until its length is equal to base64Width (and so a multiple of 4).
*/

const base64Index = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
const multiplesOf6 = Array.from({length:67}).map((e,i) => (i + 1) * 6);
const multiplesOf4 = Array.from({length:17}).map((e,i) => (i + 1) * 4);

function hexToBase64MS(hex) {
  let binary = hex.match(/../g).map(h => parseInt(h, 16).toString(2).padStart(8, '0')).join('');
  let binaryWidth = multiplesOf6.find(m => m >= binary.length);
  binary = binary.padEnd(binaryWidth, '0');
  let base64 = binary.match(/.{6}/g).map(b => base64Index[parseInt(b, 2)]).join('');
  let base64Width = multiplesOf4.find(m => m >= base64.length);
  return base64.padEnd(base64Width, '=');
}

/*
Here is a shorter solution, which uses the Node.js Buffer class.
1) We create a Buffer object from our hex string, by passing in the string as the first argument, and the form of encoding it's encased in
   as the second argument. For the Buffer.from() method, the second - encoding - parameter is optional.
2) We use the toString() method and pass in 'base64', which converts our hex buffer object to Base64.
*/

function hexToBase64(hex) {
  return Buffer.from(hex, 'hex').toString('base64');
}