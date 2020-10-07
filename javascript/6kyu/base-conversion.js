/*
Codewars. 07/07/20. 'Base Conversion'. 6kyu. Here we create a function that converts a positive number between different bases. We are
provided with an object which contains a string of the digits for each base we are working with. Here is the solution I developed to solve 
the challenge.

toDecimal:
1) In order to any number in any base to decimal - also known as standard base 10 - we can use the formula: 
   d10 * (base ** n) +  d10 * (base ** n-1)... where d10 is the base 10 representation of the digit, n is distance of the digit from the 
   end of the number and base is the base that the number is currently in.
2) Based on this logic, we first initialize our n variable, to the highest index position of the number.
3) We then split the number into an array of characters/digits using the spread operator then we call the reduce method on the array.
4) Inside our reduce function, we set int equal to the index position of the digit in its base digits string (source), this is the
   decimal representation of that particular base-k digit.
5) We increment the accumulator according to our forumala, multiplying int by the base - which is also the length of the base digits
   string - to the power of the distance from the end.
6) After this operation, we decrement n by 1.
7) We return the final value of the accumulator from our reduce function, and the value of our reduce function is returned from our
   toDecimal function.

baseConversionMS:
1) Our baseConversionMS function takes three arguments: input, a string number which can be in one of the 8 bases we are working with from 
   our alphabet object; source, which is the current base of the input number and also the value (digit string) of the current base; and
   target, which is the base we are to convert the input to, and also the value (digit string) of that target base in the alphabet object.
2) First we handle the special case where our input is '0', returning the first digit of the target base. If we didn't place this special
   step in, the rest of our function would return an empty string.
3) Next we use our toDecimal function to convert our input number in base-k to decimal, if the number is already decimal, it will stay the
   same even after being passed through the toDecimal function.
4) Next, for readability, we create a variable called newBase, which is equal to the length of the target base digits string. So for
   example, if we are converting to binary this will be 2, octal 8, alphaLower 26 etc.
5) Now we find the nearest power of the new base below our decimal number and store this in a variable called nearestPow.
6) We then intialize our output string as an empty string, we will add to this during our while loop.
7) We create a while loop which runs as long as nearestPow is above 0.
8) Inside our while loop, if decimal is greater than or equal to nearestPow - which it always will be on the first iteration - we check
   how many times nearestPow can fit into decimal and store this in a variable powFits.
9) powFits is now the decimal representation of the new base digit, so we add to output, the digit in the new base digit string, which
   is at the index position of powFits.
10) We then make decimal equal to the remainder of decimal divided by nearestPow, rounded down.
11) We then divie nearestPow by the new base, which brings nearestPow down 1 power of the new base.
12) If decimal is less than nearestPow, we add to output the first digit in the new base and then divide nearestPow by the new base,
    reducing it by 1 power of the new base.
13) The process repeats until nearestPow is 0. 
14) In this loop, we essentially perform a check on each power of the new base, below the starting value of the decimal.
15) Output is now the number in the new base, we return it.
16) NOTE: For rounding down, we must now use Math.floor moving forward, as using the double tilde operator (~~) for this kata was resulting
    in incorrect outputs.
*/

const alphabet = {
  binary:       '01',
  octal:        '01234567',
  decimal:      '0123456789',
  hexadecimal:  '0123456789abcdef',
  alphaLower:   'abcdefghijklmnopqrstuvwxyz',
  alphaUpper:   'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  alpha:        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
  alphaNumeric: '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
};

function toDecimal(num, source) {
  let n = num.length - 1;
  return [...num].reduce((sum,d) => {
    let int = source.indexOf(d);
    sum += int * (source.length ** n);
    n--;
    return sum;
  },0);
}

function baseConversionMS(input, source, target) {
  if (input === '0') {return target[0];}
  let decimal = toDecimal(input, source);
  let newBase = target.length;
  let nearestPow = Math.pow(newBase, Math.floor(Math.log(decimal) / Math.log(newBase)));
  let output = '';
  
  while (nearestPow > 0) {
    if (decimal >= nearestPow) {
      let powFits = Math.floor(decimal / nearestPow);
      output += target[powFits];
      decimal = Math.floor(decimal % nearestPow);
      nearestPow = Math.floor(nearestPow / newBase);
    } else {
      output += target[0];
      nearestPow = Math.floor(nearestPow / newBase);
    }
  }
  return output;
}