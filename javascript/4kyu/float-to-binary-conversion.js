/*
Codewars. 11/07/20. 'Float to Binary Conversion'. 4kyu. Here we create a function that converts a float (base 10) to IEEE 754 binary in
32 bit single precision. This is the first 4kyu JavaScript kata I have self-solved and the second 4kyu kata I have self-solved in general,
the first being 'Range Extraction' for Ruby. Here is the solution I developed to solve the challenge.

Converting float to IEEE754:
1) An IEEE754 32 bit floating point representation consists of three sections: the sign bit, which is 1 bit; the exponent, which is 8 bits;
   and the fraction, which is 23 bits.
2) The process of conversion from float involves a number of steps, the first of these is to convert the float to regular binary.
3) Once the float is in regular binary, we move its decimal point to just after the leftmost 1 bit. Everything after the decimal point in
   its new position, will comprise the fraction. For positive numbers, padding with zeros may be required to get the fraction to 23 bits,
   for negative numbers, keeping only the first 23 bits may be required because this may be longer than 23 bits.
4) When finding the exponent, we use a bias, which for IEEE754 32-bit is 127, for IEEE754 64 bit double precision, it is 1023. We add the
   amount of shifts we did when moving our decimal point after the leftmost 1 bit, to the bias, then convert the produce to regular binary,
   if necessary, we pad the start with zeros to make it 8 bits.
5) The easiest thing to find is the sign bit, this is 1 if the float is negative and 0 if the float is positive.
6) We concatenate the sign bit, the exponent and the fraction together.

The Code:
1) We define our function floatToBinaryMS, which takes a number as its argument. The number can be positive or negative and it can be in
   string form or number form.
2) As per the process described above, the first thing we do is convert the float to regular binary first by making any string numbers,
   a number data type and second by using toString(2) to convert to regular binary.
3) Now we find the sign bit, if the regular binary includes a minus symbol, we make the sign bit 1, if not, we make the sign bit 0.
4) Now we are going to perform our decimal shift, but first, to make our life easier, if the number is positive, we add a decimal point to 
   the end of binary.
5) Now we create a variable fraction, which is binary with the decimal point deleted, then placed after the first 1 bit in the binary
   number.
6) We then find the amount of shifts, by subtracting the index position of the decimal point in fraction (which is after the first 1 bit) 
   from the index position of the decimal point in binary (which is where it originally was). We store this in a variable shifts.
7) Now we change fraction to its (almost) final form, by first off removing every character up to and including the decimal point. Then we 
   use the slice method to keep only the first 23 bits, if there are more than 23 bits, which may be the case for negative inputs.
8) We then get the exponent, which is the bias (127) + shifts, converted to regular binary and padded with zeros at the start to make it
   8 bits if necessary.
9) We have all the components to create our IEEE754 32 bit binary, so we simply concatenate signBit, exponent and fraction. If our input
   was positive, fraction may still not be 23 bits, so we simply pad the end with zeros if this is the case, until we have 32 bits.
*/

function floatToBinaryMS(num) {
  let binary = parseFloat(num).toString(2);
  let signBit = binary.includes('-') ? 1 : 0;
  if (!binary.includes('-')) {binary = binary + '.';}
  let fraction = binary.replace(/\./, '').replace(/(?<=1)/, '.');
  let shifts = binary.indexOf('.') - fraction.indexOf('.');
  fraction = fraction.replace(/^-?[01]+\./, '').slice(0,23);
  let exponent = (127 + shifts).toString(2).padStart(8, '0');
  return (signBit + exponent + fraction).padEnd(32, '0');
}