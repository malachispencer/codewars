/*
Codewars. 30/08/20. 'Integer reduction'. 6kyu. Here we create a function which takes two integers n and k and our task is to remove k-digits
from n returning the lowest possible number without changing the order.

The Algorithm
1) A digit in the first k + 1 digits must be in the resultant number.
2) Thus we pick the smallest number from the first k + 1 digits and add it to the new number.
3) We perform this process again for the remaining digits after the first k + 1, also decrementing k by the index position of the smallest
   number from the first k + 1 digits.
4) Once the new number is the length it should be (n.length - k) we return it.

My Implementation
1) While this algorithm can be implemented using recursion, in my implementation I use a while loop.
2) We first convert n to a string, then to an array of characters and store this in a variable arr.
3) We do the arr.length - k and store this in a variable reducedLen. This is the length of the new number, we will use this to track our
   for loop, breaking out of it once our new number has this length.
4) We initialize a string called reduced, where we store our lowest possible number.
5) We create a while loop which runs as long as the length of reduced is less than reducedLen.
6) We take the first k + 1 digits of the number and store them in numSlice. 
7) We then take the minimum of the first k + 1 digits and store this in min.
8) We then find the index position of min using indexOf. We have to convert min to a string when we pass it into indexOf because Math.min
   converts the value it grabs to an integer.
9) We add min to reduced by splicing it out of the array, thereby removing it from the array.
10) We disregard any digits before minInd and decrement k by minInd, then our while loop runs this entire process again. On some tests, we
    we don't decrement k by minInd, our loop runs indefinitely.
11) Once reduced has reducedLen number of elements our for loop breaks and now we have the lowest possible number that could be formed by
    removing k digits and not changing the order of the number. We return reduced.

Example: numReductionMS(8027190, 4)
1) reducedLen = 3.
2) Iteration 1:
   1) n at start = 8027190. numSlice = 80271.
   2) n with minRemoved = 827190. reduced = 0.    
   3) minInd = 1. n from minInd = 27190.
   4) k = 4. k -= minInd = 3.
3) Iteration 2:
   1) n at start = 27190. numSlice = 2719.
   2) n with minRemoved = 2790. reduced = 01.
   3) mindInd = 2. n from minInd = 90.
   4) k = 3. k -= minInd = 1.
4) Iteration 3:
   1) n at start = 90. numSlice = 0.
   2) n with minRemoved = 9. reduced = 010.
   3) minInd = 1. n from minInd = .
   4) k = 1. k -= minInd = 0.
5) reduced has a length equal to reducedLen so our loop breaks. We return reduced, which is 010.
*/

function numReductionMS(n, k) {
  let arr = [...(n + '')];
  let reducedLen = arr.length - k;
  let reduced = '';
  while (reduced.length < reducedLen) {
    let numSlice = arr.slice(0, k+1);
    let min = Math.min(...numSlice);
    let minInd = arr.indexOf(min + '');
    reduced += arr.splice(minInd, 1);
    arr = arr.slice(minInd);
    k -= minInd;
  }
  return reduced;
}

/*
Here is a recursive version of my solution, which I developed based on the above algorithm.
*/

function numReduction(n, k) {
  let arr = [...`${n}`];
  let reduced = '';
  let reducedLen = arr.length - k;

  function helper(arr, k) {
    if (reduced.length === reducedLen) {return reduced;}
    let numSlice = arr.slice(0, k+1);
    let min = Math.min(...numSlice);
    let minInd = arr.indexOf(min + '');
    reduced += arr.splice(minInd, 1);
    helper(arr.slice(minInd), k - minInd);
  }
  
  helper(arr, k);
  return reduced;
}