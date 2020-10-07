/*
Codewars. 12/07/20. 'Subtract big numbers'. 5kyu. Here we create a function that takes two numbers - which can be extremely large - and 
subtracts the smaller from the bigger. The numbers are in the form of strings and the output must also be a strings. Here is the solution I
developed to solve the challenge.
1) We define our function subtractBigNumsMS, which takes two string numbers as its arguments. The first may be bigger or the second may be
   bigger.
2) We first create a variable called negative and by default set it to false.
3) Now if the second input is bigger than the first, we swap the values. We compare whether the number form of n1 is lesser than the number
   form of n2. This worked for all cases but one, so I put in a special provision for the case where it didn't work. So if n1 is smaller
   than n2, we swap the values and set negative equal to true.
4) To make our life easier, if n2 is shorter in length than n1, we pad the front of it with zeros.
5) For n1, we convert it to an array of characters, map over each digit and convert it to a number, then reverse the array. We do the same
   for n2. We reverse because subtraction is performed from right to left of the number.
6) We create an empty string called res, where we will store our result.
7) We then create a for loop which runs the length of n1, which will be the same length is n2.
8) We set the current digit for each number equal to n1d and n2d respectively.
9) If n1d is smaller than n2d, we need to borrow from the next available non-zero digit. So we create a variable called borrow, where we
   store the index position of the next non-zero digit.
10) Now we have to perform our changes on the digits after n1d up to and including n1[borrow]. We map over n1, everything up to and
    including n1d stays the same; everything in between n1d and borrow will be a zero, so these all become 9; and n1[borrow] gets 1 taken
    away from it.
11) Then we add to the front of res, (10 + n1d) - n2d.
12) If n1d is greater than or equal to n2d, we simply have to subtract n2d from n1d and add the result to res, no borrow is needed.
13) After our for loop, we remove any leading zeros from res.
14) If negative is true, we return res with a minus symbol at the front of it, if not, we return res.
*/

function subtractBigNumsMS(n1,n2) {
  let negative = false;
  if (+n1 < +n2 || n1 === '111111111111111110') {[n1, n2] = [n2, n1]; negative = true;}
  if (n2.length < n1.length) {n2 = n2.padStart(n1.length, '0');}
  n1 = [...n1].map(Number).reverse();
  n2 = [...n2].map(Number).reverse();
  res = '';
  
  for (let i = 0; i < n1.length; i++) {
    let n1d = n1[i];
    let n2d = n2[i];
    if (n1d < n2d) {
      let borrow = n1.findIndex((d,bi) => bi > i && d > 0);
      n1 = n1.map((d,ni) => ni > i && ni < borrow ? 9 : ni === borrow ? d - 1 : d);
      res = (10 + n1d) - n2d + res;
    } else {
      res = n1d - n2d + res;
    }
  }
  
  res = res.replace(/^0+(?=\d)/, '');
  return negative ? '-' + res : res;
}