/*
Codewars. 24/06/20. 'How much hex is the fish'. 6kyu. We are given a string of a fish name. The input is always a string and can contain
nothing, spaces, upper case letters, lower case letters but no digits. We must extract all hexadecimal valid characters from the string
[abcdef], convert these hex values to their decimal representation and then xor them. Here is the solution I developed to solve the
challenge.
1) We define our method fisHexMS, which takes a string of a fish name as its argument.
2) First we handle our error checking, if the string is empty, we return 0.
3) We then convert the name to lowercase - because all hexadecimal values are lower case - and extract the hex values using the match
   method. We then map over the hex values and convert them to their decimal representation using the parseInt() method with 16 passed in as
   the radix, signifying that our string is hex. We store this array of decimals in a variable called decimals.
4) We then call the reduce method on the array of decimals, the default value of our accumulator is set to the first 2 decimals in the
   array XOR'd. Then in our reduce block we leave the accumulator the same if it's the first 2 decimals, and after that we change the
   accumulator to the accumulator ^ current decimal.
5) Technically, the value is not accumulated in the sense of adding or subtracting to the value, the value merely changes on each
   iteration based on accumulator ^ current decimal.
6) We return the result of reduce.
*/

function fisHexMS(name) {
  if (name === '') {return 0;}
  let decimals = name.toLowerCase().match(/[abcdef]/g).map(c => parseInt(c, 16));
  return decimals.reduce((r,d,i) => i < 2 ? r = r : r = r ^ d, decimals[0] ^ decimals[1]);
}

/*
Here is a superior solution, which doesn't even bother extracting the hex values.
1) We convert the string to an array of characters using the spread operator place inside an array. In this case our empty string becomes
   an empty array.
2) We call reduce on the array of characters, the initial value of the accumulator is set to 0.
3) For each character, we convert it to its decimal representation, with 16 as the radix, signifying that the character should be a hex
   character. Therefore, non-hex characters will return NaN (not a number value) in this conversion.
4) When a number is XOR'd with an NaN value, the result is the number.
5) Even when an uppercase letter is passed into parseInt() to convert to decimal from hex, it is treated as if it were lower case, so we
   get the correct result e.g. 'A' = 10, 'a' = 10.
5) Once our reduce block finishes we have our final result, which we return.
*/

function fisHex(name) {
  return [...name].reduce((r,c) => r ^ parseInt(c, 16), 0);
}

/*
Here is another solution, which does involve extraction.
1) We extract the hex characters using the match method, keeping upper and lower case in their original form. If the result of our match is
   null, we make the result an empty array, this will handle our empty string case.
2) We call reduce on the array of characters and set the initial value of the accumulator to 0.
3) As we iterate over the characters we convert them to their decimal representation, then XOR them with the current value of the
   accumulator.
4) We return the result of reduce.
*/

function fisHexX(name) {
  return (name.match(/[a-f]/ig) || []).reduce((s,c) => s ^ parseInt(c, 16), 0);
}