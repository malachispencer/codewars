/*
Codewars. 21/08/20. 'Prefill an Array'. 6kyu. Here we create a function which returns an array of n elements that all have the same value v,
without using a loop. Our function must also pass some substantial error checking. Valid numbers are positive, whole numbers and can be
number types or string numbers. Invalid inputs include infinity, negative numbers, decimal point numbers and booleans. In the case of
invalid inputs our function must return a TypeError with the message 'n is invalid' where n is the dynamic input value. Here is the solution
I used to solve the challenge.
1) We first handle our extensive error checking. If n is not a number, or is not a finite number, or is negative, or is a float, or is a 
   boolean, we throw a TypeError and using string interpolation we return that the input is not valid.
2) Otherwise, we use the Array.from() method to create an empty array and pass in a length of n, then we use the fill method to populate
   that array with a static value of v.
3) If n is 0, we get an empty array even if v contains a value.
4) If v is ommitted, we get an array of n length populated with all undefined.
5) Even if n is a string number, the length property will read it as a number inside Array.from().
*/

function prefillArrayMS(n, v) {
  if (isNaN(n) || !isFinite(n) || n < 0 || n % 1 || typeof n === 'boolean') {
    throw new TypeError(`${n} is invalid`);
  } else {
    return Array.from({length:n}).fill(v);
  }
}

/*
Here is a shorter solution, submitted by a Codewars user.
1) To capture all the error conditions, we can simply convert n to a number using parseInt() and compare if its value is not equal to the
   absolute value of n, if so, we throw our TypeError.
2) Now we use the ternary operator to check if n contains a value, if it does, we create an array using an array constructor and makes its
   length equal to n as a number type, then we call the fill method to populate it with v. If n is an empty string, an empty array will be
   returned.
*/

function prefillArray(n, v) {
  if (parseInt(n) !== Math.abs(n)) throw new TypeError(`${n} is invalid`);
  return n ? Array(+n).fill(v) : [];
}