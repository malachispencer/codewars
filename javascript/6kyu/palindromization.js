/*
Codewars. 02/09/20. 'Palindromization'. 6kyu. Here we create a function which takes a string and an integer n and returns a palindrome of
length n using the characters from the string, according to a formation rule. The palindrome should begin with the first character from the
string, after we have obtained a pair from the string, we move onto the second character in the string, placing this pair inside the middle
of the palindrome, we continue this process, circling the string if necessary, until the palindrome is length n. For example  when 
str = '123', n = 2 = 11, n = 3 = 121, n = 4 = 1221, n = 5 = 12321, n = 6 = 123321, n = 7 = 1231321 etc. Here is the solution I developed to
solve the challenge.

The Algorithm
1) This is an algorithm I developed by myself, simply by using pattern recognition for the test inputs and outputs.
2) We divide n by 2 and then round up the result. Let's call this mid.
3) If we iterate over the string mid number of times - circling over the string if necessary - we cover the first half of the palindrome.
   If n is odd number, we cover the larger half of the palindrome. We can call this left.
4) Now to get the second half, we take the first n - mid characters from the left half and then reverse them. Let's call this right.
5) We join left and right together, giving us our palindrome.

The Implementation
1) First we handle our error checking, return 'Error!' if the string is empty or n is less than 2, which is the minimum length our
   palindromes need to be.
2) We create a variable called mid, which is n divided by 2 and rounded up.
3) We initialize an empty array called palin, which will store the left side of our palindrome.
4) We create a for loop which iterates over the string mid number of times. When we are at the last character of the string, our iterator
   wraps back around landing on the first character of the string.
5) As we iterate, we push the currrent element into palins.
6) Now, in a variable called drome, we store the right half of the palindrome by taking the first n - mid elements from palin then reversing
   them. For example, when str = '123' and n = 3, mid = 2, n - mid = 1, so palin is ['1','2'] and then drome becomes ['1']. When 
   str = '123' and n = 7, palin is [ '1', '2', '3', '1' ] and drome is [ '1', '2', '3' ] initially then after we reverse it it becomes
   ['3','2','1'].
7) Using concat, we merge palin (left) and drome (right), join the array into a string and return our palindrome.
*/

function palindromizationMS(str, n) {
  if (!str || n < 2) {return 'Error!';}
  
  let mid = Math.ceil(n / 2);
  let palin = [];
  
  for (let i = 0; i < mid; i++) {
    palin.push(str[i % str.length]);
  }
  
  let drome = palin.slice(0, n - mid).reverse();
  return palin.concat(drome).join('');
}

/*
Here is a very clever solution, submitted by a Codewars user.
1) We first handle the error checking.
2) To create the left side of our palindrome, we repeat the string n times, then slice from 0 up to but not including the element that is
   indexed at Math.ceil(n / 2). We store this in a variable called left.
3) In a variable called right, we slice the left string up to the middle using Math.floor this time, because for odd n's our left half
   is the larger half, now we need the smaller half. We then convert this string to an array of characters, reverse it and join it back
   into a string.
4) We concatenate left and right and return the string, our palindrome.
*/

function palindromization(str, n) {
  if (!str || n < 2) {return 'Error!';}
  let left = str.repeat(n).slice(0, Math.ceil(n / 2));
  let right  = [...left.slice(0, Math.floor(n / 2))].reverse().join('');
  return left + right;
}