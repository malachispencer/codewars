/*
Codewars. 05/07/20. 'Binaries'. 6kyu. Here we create two functions. encode, which takes a string of decimal digits, splits those decimal 
digits apart and then performs an encoding process on each of them, then combines the encoded digits back into a single string. Then we
create the function decode, which takes the encoded string and turns it back into its string of decimal digits. Here is the solution I
developed to solve the challenge.
1) We define our first function, encodeMS, which takes a string of decimal digits as its argument.
2) We split the string into an array of characters/string digits, then we map over each digit.
3) As we map, the encoding process requires us to convert the digit to binary and find out the amount of bits in its binary representation,
   we subtract 1 from the amount of bits in the digits binary representation and make the resulting number amount of zeros. We 
   concatenate '1' to bit length - 1 zeros, then concatenate the binary representation of the digit to the end of the possible zeros and 1.
4) Each digit is now encoded in 0s and 1s, we then join the encoded digits back into a string.
5) Because we are encoding single digits, the only possible numbers to encode are 0-9. Therefore, once we know what 0-9 are encoded, we can
   easily decode them. Thus using our encode method, we generate an object called zeroToNine, where the key is the encoded representation
   and the value is the decimal digit.
6) In our second function decodeMS, which takes the encoded string as its argument, the first thing we do is build our regular expression
   object which will split apart each encoded digit. We take the keys of zeroToNine and join them delimited by a regex 'or' metacharacter. 
   Of course, we make our search global.
7) We then call the match method on the encoded string and pass in our regex object, which generates an array of the decimal digits in
   their encoded forms.
8) We then map over the encoded digits and use our zeroToNine object to convert them back into their decimal form.
9) We join the array back into a string of decimal digits and return this string.
*/

const zeroToNine = {'10': 0, '11': 1, '0110': 2, '0111': 3, '001100': 4, '001101': 5, '001110': 6,  
                    '001111': 7, '00011000': 8, '00011001': 9};

function encodeMS(str) {
  return str.split('').map(d => '0'.repeat(Number(d).toString(2).length - 1) + '1' + Number(d).toString(2)).join('');
}

function decodeMS(str) {
  let regex = new RegExp(`${Object.keys(zeroToNine).join('|')}`, 'g');
  return str.match(regex).map(encodedDigit => zeroToNine[encodedDigit]).join('');
}

/*
Here is another solution, which uses memoization and no regular expressions.
1) We keep the digits encoded in an array called digitsEncoded, their index positions represent their decimal representations 0-9.
2) In our encode function, we simply convert the string of digits to an array of characters then map over each digit and convert it to
   its encoded form using digitsEncoded index positions.
3) We join the array back into a string.
4) In our decode function, we initialize an empty string called decoded, which we will incrementally add to, recreating the string of digits
   we previously encoded.
5) We create a while loop which runs as long as our original string is not empty, because on each iteration we will remove the encoded
   digit we find at the start from it.
6) Inside our while loop, we find each encoded digit in a very ingeniuous way. We iterate over digitsEncoded and call the findIndex
   method on it, checking for the first encoded digit that the input string starts with. findIndex returns the index position, and of
   course, the index positions of all elements in digitEncoded are their decimal digit reprensentation. We store this in digit.
7) We add digit to the decoded.
8) Now we are going to remove the encoded digit we just found at the start of the input string, and then repeat the process we just
   undertook. We create a variable called startNewFrom, which is the length of the encoded digit we just found.
9) We then make the string equal to the string from the index position equal to startNewFrom, essentially we remove the encoded digit
   from the string.
10) The process repeats until the input string is empty.
11) We return decoded.
*/

const digitsEncoded = ['10','11','0110','0111','001100','001101','001110','001111','00011000','00011001'];

function encode(str) {
  return [...str].map(d => digitsEncoded[d]).join('');
}

function decode(str) {
  let decoded = '';
  while (str.length) {
    let digit = digitsEncoded.findIndex(ed => str.startsWith(ed));
    decoded += digit;
    let startNewFrom = digitsEncoded[digit].length;
    str = str.slice(startNewFrom);
  }
  return decoded;
}