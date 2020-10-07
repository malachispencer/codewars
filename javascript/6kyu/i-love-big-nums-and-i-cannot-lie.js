/*
Codewars. 29/08/20. 'I love big nums and I cannot lie'. 6kyu. Here we create a function which takes an array of positive integers and
arranges them such that they form the biggest number. The output is returned as a string number. Here is the solution I developed to solve
the challenge.

The Algorithm
1) We first find the largest number in the array and find the length of its digits. We call this maxLen.
2) We create an extended version of all the numbers in the array, the length of the extended numbers will be maxLen + 1 and made using the
   digits of the number incrementally, so 1 or more digits can potentially be cut off at the end of the extended number.
3) We sort the original numbers in according to their extended value, in descending order.
4) We concatenate the sorted numbers.

My Implementation
1) First we handle our edge case, if the array of numbers are all zeros, we return 0.
2) We then use Math.max to find the largest number in the array, we convert it to a string and then take its length. We store this in a
   variable called maxLen.
3) We initialize an object called extended, where we will store our array numbers as properties and their extended version as values.
4) We iterate over nums using forEach and set the property of extended to the number in the array, then we turn the number into a string
   and call the padEnd method on it, we make the length of the padding equal to maxLen + 1 and pad with the number itself. We then turn
   this string number into an integer. This is the value of the property, the extended number.
5) We then call the sort method on the input array and sort the numbers in descending order according to their extended versions. We join
   the array into a string.
6) We now have the biggest number we could have formed, we return it.
*/

function biggestNumMS(nums) {
  if (nums.every(v => v === 0)) {return '0';}
  let maxLen = (Math.max(...nums) + '').length;
  let extended = {};
  nums.forEach(v => extended[v] = +(v + '').padEnd(maxLen + 1, v));
  return nums.sort((a,b) => extended[b] - extended[a]).join('');
}

/*
Here is a shorter implementation of the algorithm that I developed.
1) We find the length of the largest number in the array, add 1 to it and then store this in extLen. This will be the length of the
   extended numbers.
2) We map over nums and convert all the numbers to strings.
3) We call the sort method on nums and sort according to extended b - extended a, which sorts nums according to their extended numbers, in
   descending order.
4) We join the array back into a string and to handle our edge case by replacing 1 or more zeros at the start of the string with a single
   0.
5) Now we have the biggest number that could be formed, we return it.
*/

function biggestNums(nums) {
  let extLen = `${Math.max(...nums)}`.length + 1;
  return nums.map(String).sort((a,b) => {
    return b.padEnd(extLen, b) - a.padEnd(extLen, a);
  }).join('').replace(/^0+/, '0');
};