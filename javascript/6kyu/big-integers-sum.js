/*
Codewars. 14/07/20. 'Big integers sum'. 6kyu. Here we create a function that sums extremely large integers, which come in the form of 
strings. This time however, there can be more than 2 numbers as input. Here is the solution I developed to solve the challenge.
1) We define our function sumBigIntsMS, which takes any number of arguments, thus we use the spread operator for nums.
2) First we handle some error checking, if the length of nums is 1 or 0, we return '0'. nums is an array.
3) We then standardize our input, converting all our numbers to strings, in case integers were submitted as input.
4) Some of our numbers may have an arbitrary amount of leading zeros, so we handle this too, we map over nums and if a number starts with
   a zero, we remove all leading zeros.
5) We then find the max length of any number in our nums array and store this in a variable maxLen.
6) We map over nums yet again and if any number is less than the length of maxLen, we pad the front of it with zeros, this makes our life
   easier when performing our addition on the digits.
7) We initialize a sum variable, where we will store our output in a string.
8) We intialize a carry variable, which will start off as 0.
9) We then create our for loop, which runs as the length of every number (now maxLen).
10) In our for loop, we call the reduce method on nums, and add each digit from each number, then we add the carry to the result of this. We
    convert the resulting number to a string and this is our digits + carry sum.
11) thisDig is what will be added to the front of our sum string on each iteration, this is the last digit in digCarrySum. We add thisDig
    to the front of our sum string.
12) We then make the carry for the next iteration. If digCarrySum is 10 or above, we set it equal to the first digit in digCarrySum, for
    example if digCarrySum is 26, the carry will be 2, if digCarrySum is 47, the carry will be 4. Otherwise, the carry is 0. This carry
    system will 100% work for inputs of up to 9 numbers, where the max digCarrySum can be 90 (9 * 9 = 81 + max carry 9 = 90). For inputs
    of 10 or more numbers a different peice of code may be required here.
13) Once we've finished our for loop, if carry is not zero, we concatenate that last carry to the front of sum and this is our final
    result, if carry is zero, we simply return sum.
*/

function sumBigIntsMS(...nums) {
  if (nums.length <= 1) {return '0';}

  nums = nums.map(String);
  nums = nums.map(n => n.startsWith('0') ? n.replace(/^0+/, '') : n);
  let maxLen = Math.max(...nums.map(n => n.length));
  nums = nums.map(n => n.length < maxLen ? n.padStart(maxLen, '0') : n);

  let sum = '';
  let carry = 0;
  
  for (i = 0; i < maxLen; i++) {
    let digCarrySum = String(nums.reduce((nis, n) => nis + +n[n.length - 1 - i], 0) + carry);
    let thisDig = digCarrySum.slice(-1);
    sum = thisDig + sum;
    carry = +digCarrySum >= 10 ? +digCarrySum[0] : 0;
  }
  
  return carry ? carry + sum : sum;
}