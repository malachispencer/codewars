/*
Codewars. 22/06/20. 'Bin to Hex and back'. 6kyu. Here we create a function which converts a binary string to hexadecimal and a function
which converts a hexadecimal string to binary. For binToHex, the binary string may or may not contain leading zeros, the hex string
returned must be lower case. For hexToBin, the input hexadecimal string can be upper or lower case and may contain any amount of leading
zeros, the binary string must be returned without leading. Here is the solution I developed to solve the challenge.
*/

/*
Binary To Hexadecimal:
1) In order to convert binary to hexadecimal, we must split the binary number into parts of 4, then use [8, 4, 2, 1] as an index of those
   parts of 4. For each part, everywhere there is a 1 in the part, we accumulate a sum by whichever of 8, 4, 2 or 1 is in the index
   position of that 1. Now each part will be a decimal number, those decimal numbers must be converted to their hexadecimal representation.
   Then the hexadecimal parts are joined together and leading zeros are removed. If the hex is '0', nothing is removed.
2) In light of this process, we create a hexTable array, where each index position 0-255 corresponds to its hexadecimal representation, we
   will use this to convert our decimals (gained from our binary parts) to hex.
3) We also create an array called multiplesOf4, storing all the multiples of 4 up to what we'll need for the kata, this is what we'll use
   to determine how many zeros we need to pad our initial binary string with, in order to split the binary string into equal parts of 4.
4) We then create an array called binToDecIndex, this is what we'll use to convert each binary part of 4 into its decimal number.
5) In our binToHexMS function, the first thing we do is find out how many zeros we need to add to the front of our binary string in order
   for it to be a multiple of 4. So we use the find method to return the first multiple that is greater than or equal to the length of
   the binary string. This is stored in a variable called width.
6) Using the padStart() method, we add zeros to the front of the string, until its length is equal to width. Now our binary string can be
   split into equal parts of 4.
7) We then use the match method to generate an array of each 4 bits in the binary string, then we map over those parts and split all of
   them into arrays of characters (i.e. single bits).
8) We then map over each part again, this time, for each part (4 bits) we call the reduce method and every time we encounter a 1 bit, we
   increment the accumulator by the value in the corresponding index position in binToDecIndex i.e. 8, 4, 2 or 1. If it's a zero, we 
   increment by 0.
9) Now we have an array where each 4 bits is a decimal number, we map over each decimal number and convert it to its hex representation
   by using the decimal as an index of hexTable. Remember, each index position of hexTable (0-255), holds its hexadecimal representation.
   We then join this array into a hex, it is now a hex string.
10) If the length of hex is above 1, we return the hex string with all the leading zeros removed by using the replace method. If it is 1,
    the initial binary string contained only zeros, and the hex string will be 0, but we don't want to remove any zeros in this case, so
    we simply return hex.
*/

/*
Hexadecimal To Binary:
1) To convert hex to binary, we convert each character in the hex string to its decimal number representation, then we convert each decimal
   to binary, then we each binary representation of the decimal with leading zeros until its width is 4, then we join the 4 bit binary
   strings into a single binary string. If the original hex string was not '0', we return the binary string with leading zeros removed, if
   not, we return the original hex string ('0').
2) In our hexToBinMS function, our first step is to convert the hex string to lower case, then split it into an array of characters. We
   then map over the array of characters and convert each character to its index position in hexTable, which represents its decimal
   representation. We store this array of decimal numbers in a variable called decimals.
3) We then map over the array of decimals and for each decimal, we convert it to binary by calling our 3rd function decToBin, then we
   pad with zeros if necessary until its width is 4. We then join this array of 4 bits into a string.
4) If our original hex string was '0', we return that same original hex string, because it's binary representation will also be '0'.
   Otherwise, we return the binary string with all leading zeros removed using the replace method.
*/

/*
Decimal To Binary:
1) In our decToBinMS function, which we call inside our hexToBinMS function, we convert a decimal number to binary using the successive
   division method. Essentially, we successively divide the decimal number by 2, if the resulting number has remainder, we push a 1 into
   our binary, if not, we push a 0 into our binary. We read the binary from the most significant bit (the rightmost bit after we've
   formed the binary number) to the least significant bit (the leftmost bit after we've formed the binary number), so we reverse the
   number to give the final binary representation of the decimal number.
2) Based on this process, we define our function decToBinMS, which takes a decimal number as its argument.
3) The first thing we do is initialize an empty array called binary, where we will store our 0s and 1s as we successively divide.
4) We create a while loop which runs as long as the decimal number is greater than 0.
5) Inside our while loop, if the decimal number modulo 2 is not 0 - i.e. there is remainder - we set the new decimal number equal to
   decimal divided by 2, then rounded down using Math.floor(). We then add a 1 to the binary array.
6) Otherwise - if there is no remainder when decimal is divided by 2 - we set the new decimal equal to decimal divided by 2 and add a 0
   to the binary array.
7) Our loop finishes once our decimal number is equal to 0. So after that we reverse the array of 0s and 1s, then join it into a string
   and return it. This is the binary representation of our input decimal number.
*/

const hexTable = [
  '0',  '1',  '2',  '3',  '4',  '5',  '6',  '7',  '8',  '9', 'a',  'b',  'c',  'd',  'e',  'f',  '10', '11', '12', '13',
  '14', '15', '16', '17', '18', '19', '1a', '1b', '1c', '1d', '1e', '1f', '20', '21', '22', '23', '24', '25', '26', '27',
  '28', '29', '2a', '2b', '2c', '2d', '2e', '2f', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '3a', '3b',
  '3c', '3d', '3e', '3f', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '4a', '4b', '4c', '4d', '4e', '4f',
  '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '5a', '5b', '5c', '5d', '5e', '5f', '60', '61', '62', '63',
  '64', '65', '66', '67', '68', '69', '6a', '6b', '6c', '6d', '6e', '6f', '70', '71', '72', '73', '74', '75', '76', '77',
  '78', '79', '7a', '7b', '7c', '7d', '7e', '7f', '80', '81', '82', '83', '84', '85', '86', '87', '88', '89', '8a', '8b',
  '8c', '8d', '8e', '8f', '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '9a', '9b', '9c', '9d', '9e', '9f',
  'a0', 'a1', 'a2', 'a3', 'a4', 'a5', 'a6', 'a7', 'a8', 'a9', 'aa', 'ab', 'ac', 'ad', 'ae', 'af', 'b0', 'b1', 'b2', 'b3',
  'b4', 'b5', 'b6', 'b7', 'b8', 'b9', 'ba', 'bb', 'bc', 'bd', 'be', 'bf', 'c0', 'c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7',
  'c8', 'c9', 'ca', 'cb', 'cc', 'cd', 'ce', 'cf', 'd0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'd8', 'd9', 'da', 'db', 
  'dc', 'dd', 'de', 'df', 'e0', 'e1', 'e2', 'e3', 'e4', 'e5', 'e6', 'e7', 'e8', 'e9', 'ea', 'eb', 'ec', 'ed', 'ee', 'ef', 
  'f0', 'f1', 'f2', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 'f9', 'fa', 'fb', 'fc', 'fd', 'fe', 'ff' 
];

const multiplesOf4 = [4, 8, 12, 16, 20, 24, 28, 32, 36, 40];
const binToDecIndex = [8, 4, 2, 1];

function binToHexMS(binary) {
  let width = multiplesOf4.find((m) => m >= binary.length);
  binary = binary.padStart(width, '0');
  binary = binary.match(/..../g).map((part) => part.split(''));
  binary = binary.map((part) => part.reduce((sum, n, i) => n === '1' ? sum += binToDecIndex[i] : sum += 0, 0));
  hex = binary.map((decimal) => hexTable[decimal]).join('');
  return hex.length > 1 ? hex.replace(/^0+/, '') : hex;
}

function hexToBinMS(hex) {
  let decimals = hex.toLowerCase().split('').map(c => hexTable.indexOf(c));
  let binary = decimals.map(d => decToBin(d).padStart(4, '0')).join('');
  return hex === '0' ? hex : binary.replace(/^0+/, '');
}

function decToBinMS(decimal) {
  let binary = [];
  while (decimal > 0) {
   if (decimal % 2 != 0) {
     decimal = Math.floor(decimal / 2);
     binary.push(1);
   } else {
     decimal /= 2;
     binary.push(0);
   }
  }
  return binary.reverse().join('');
}

