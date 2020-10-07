/*
Codewars. 27/08/20. 'Factorial length'. 6kyu. Here we create a function which takes an integer n and returns the number of digits in
n! i.e. factorial n. Here is the solution I used to solve the challenge, which uses Kamenetsky's formula, which provides an approximation of
the digits in n!.
*/

function factorialLengthMS(n) {
  return Math.ceil((n * Math.log10(n / Math.E) + Math.log10(2 * Math.PI * n) / 2));
}

/*
Here is another solution which uses Kamenetsky's formula, flooring and adding one instead of ceiling. This solution also handles edge cases, 
which were not in the kata tests.
*/

function factorialLength(n) {
  if (n < 0) {return 0;}
  if (n === 0 || n === 1) {return 1;}
  return Math.floor((n * Math.log10(n / Math.E) + Math.log10(2 * Math.PI * n) / 2)) + 1;
}

/*
Here is a solution which uses an exact formula, but is much slower than the solutions which use Kamenetsky's formula.
*/

function factorialLengthX(n, len = 0) {
  while (n > 1) {
    len += Math.log10(n);
    n--;
  }
  return Math.ceil(len);
}