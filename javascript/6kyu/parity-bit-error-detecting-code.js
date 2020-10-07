/*
Codewars. 15/07/20. 'Parity bit - Error detecting code'. 6kyu. A parity bit is a bit added to a string of binary code to indicate whether
the number of 1 bits in the string is even or odd. Parity bits are used as the simplest form of error detecting code, they can detect a 1 
bit error. Here we use even parity, the parity bit is set to 0 if the number of 1 bits is even, and 1 if odd. We are using them for the
transfer of ASCII characters in binary (7 bit strings), the parity bit is added to the end of the string, forming the 8th bit. Here we
create a function which tests for 1 bit errors and returns the correct ASCII characters in 7 bit format, or 'error' where errors were
detected. Here is the solution I developed to solve the challenge.
1) We define our function parityBitMS, which takes a string of one or more 8 bit binary strings, seperated by spaces.
2) We split the string at its spaces, converting it into an array of 8 bit binary strings, then we call the map method on the array.
3) Inside our map method, for every 8 bits we iterate over, we take the first seven bits and store this in a variable seven, this is the
   ASCII character in 7 bits.
4) If the 8 bit binary string ends with a 1, for it to be correct, it should have an odd amount of 1 bits. Thus we check if removing all
   the 0 bits from seven produces an odd number of bits, if so, the 8 bits is converted to 7 bits (i.e. the parity bit removed), if not,
   the 8 bits are converted to 'error'.
5) Instead of else if, we could have used else, but I used else if for better readability. So if the 8 bits ends with a 0, we check if
   removing all the 0 bits from it produces an even number of bits, if so, we return the 7 bits, if not, we return 'error'.
6) Once our map function finishes, we join the array back into a string delimited by spaces.
7) We return the string with correct 7 bits and errors.
*/

function parityBitMS(bits) {
  return bits.split(' ').map(b => {
    let seven = b.slice(0,-1);
    if (b.endsWith('1')) {
      return seven.replace(/0/g, '').length % 2 != 0 ? seven : 'error';
    } else if (b.endsWith('0')) {
      return seven.replace(/0/g, '').length % 2 == 0 ? seven : 'error';
    }
  }).join(' ');
}