/*
Codewars. 18/06/20. 'Almost Even'. 6kyu. Here we must create a function that divies a given integer into a given amount of parts, the sum of 
the parts should be the given integer, and they should be as close as possible. For example, (20, 6) should return [3, 3, 3, 3, 4, 4].
Here is the solution I developed to solve the challenge.
1) We define our method splitIntegerMS, which takes an integer and the amount of parts that integer needs to be split into as its
   arguments.
2) First we find the quotient - result obtained by diving one quantity by another - of the integer divided by the parts. We store this in
   a variable q. We use the ~~ double tilde operator to round down the quotient.
3) We then find the remainder of the integer divided by the parts, we store this in a variable r.
4) We use the Array.from() method to generate an array and we pass in a length parameter thereby defining the array's length. We define
   the length as the parts minus the remainder.
5) In JavaScript, the fill() method populates an array with a static value, we can specify where to start and end the fill, but if we do not,
   the entire array is filled with the static value. fill() alters the original array.
6) We fill the newly created array with the quotient. For example, if our input was (20, 6), this array would contain [3, 3, 3, 3].
7) In JavaScript, the concat() method can be used to join two or more arrays, it doesn't alter the originals, it returns a new array.
8) We call the concat method on our newly created array containing the quotient (parts - remainder) times. Inside the concat method, we
   create another new array using Array.from() and this time we make the length of this array the remainder. We then fill this array with
   the quotient plus 1, if our input is (20, 6), this array will be [4, 4].
9) Now we have an almost even array - e.g. [3, 3, 3, 3, 4, 4] if our input is (20, 6) - we return it.
10) Note, if the remainder were 0. Our remainder array would be an empty array, but adding this empty array to the parts - remainder
    array would not cause any problems.
*/

function splitIntegerMS(n, p) {
  let q = ~~(n / p);
  let r = n % p;
  return Array.from({length:p - r}).fill(q).concat(Array.from({length:r}).fill(q + 1));
}

/*
Here is a variation of my solution, where concatenates the two arrays in a different way.
1) Again, we get the quotient by dividing the integer by the parts, then rounding the result down using the double tilde operator.
2) Again, we get the remiander of the integer divided by the parts.
3) Inside an array, we generate an array using the constructor (new Array), this array's size is the parts minus the remainder, we fill
   this array with the quotient. We then generate another array using the constructor, this array is the size of the remainder and this
   array is filled with the quotient + 1.
4) Using the spread operator (...) on both arrays, we turn both these arrays into their comprising elements. Essentially, we know have a
   flat, one dimensional array of both arrays elements. We return this array.
*/

function splitInteger(n, p) {
  let q = ~~(n / p);
  let r = n % p;
  return [...new Array(p - r).fill(q), ...new Array(r).fill(q+1)];
}