/*
Codewars. 21/06/20. 'Simplify the number!'. 6kyu. Here we create a function which takes a positive integer and returns a string where 
each element - corresponding to a digit in the number - is multiplied by a power of 10 in such a way that the sum of these elements form
the original number. For example, 999 should return '9*100+9*10+9'; 10004 should return '1*10000+4'. Here is the solution I developed to
solve the challenge.
1) We define our function simplifyNumMS, which takes a positive integer as its argument.
2) We first conver the number to a string, then split it into an array of digits. The digits are in string form. We reassign n to this
   array of digits.
3) We then map over the array of digits. If the digit is 0, we leave it the saame. If it's the last digit in the array, we also leave
   it the same.
4) Otherwise, we convert the digit to d multiplied by (10 to the power of how many elements/digits are remaining in the array/number).
   We use string interpolation and the slice method to do this.
5) In Ruby, we can slice an array using bracket notation for example n[i+1..-1]. However, in JavaScript we cannot do this, so we have to
   use the slice() method instead. The first argument in the slice method is where we start the slice (inclusive), the second argument
   is the up to but excluding argument.
6) We don't want any of the zeros being left in our array, so using the filter method, we grab only the elements which are not 0.
7) Note, we use the same value == and not the same value != comparison operators. Even though we compare 0 with '0', they both return true.
8) We then join the array with + symbols.
9) We return our final string.
*/

function simplifyNumMS(n) {
  n = n.toString().split('');
  s = n.map((d,i) => d == 0 ? d : i == n.length - 1 ? d : `${d}*${10 ** n.slice(i+1, n.length).length}`);
  return s.filter((d) => d != 0).join('+');
}