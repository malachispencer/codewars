/*
Codewars. 22/08/20. 'Maximum subarray sum'. 5kyu. Here we create a function which finds the maximum sum of a contiguous sequence of integers
in an array. For example, [-2, 1, -3, 4, -1, 2, 1, -5, 4] will return 6, [4, -1, 2, 1]. If the array consists of all negative integers, our
function must return 0. Here is the solution I developed to solve the challenge.
1) First we handle our error check, returning 0 if all elements in the array are negative integers.
2) We then initialize a variable called maxSum to 0, here we will store the maximum sum.
3) We then create a while loop which will wrap around our for loop and runs as long as the array has elements. After every for loop we will
   delete the first element from the array.
4) We create our for loop which traverses each integer in the array.
5) Inside our for loop, we create a variable called subSum, which takes all the integers from index position 0 to i, and sums them.
6) If subSum is greater than maxSum, the value of subSum becomes maxSum.
7) After the for loop, we delete the first element from the array and the while loop performs this process again.
8) This is brute force algorithm that will assess all the sum permutations of the array, for example, if our input array is 
   [-2, 1, -3, 4, -6], the first run of the for loop will assess [-2], [-2, 1], [-2, 1, -3], [-2, 1, -3, 4] and [-2, 1, -3, 4]. So all
   permutations, whether elements are near the start, middle or end, will be assessed.
9) Once our while loop finishes, we return maxSum.
*/

function maxSequenceMS(arr) {
  if (arr.every(n => n < 0)) {return 0;}

  let maxSum = 0;

  while (arr.length > 0) {
    for (let i = 0; i < arr.length; i++) {
      let subSum = arr.slice(0,i+1).reduce((s,v) => s + v, 0);
      if (subSum > maxSum) {maxSum = subSum;}
    }
    arr = arr.slice(1);
  }

  return maxSum;
}

/*
Here is a solution which uses Kadane's algorithm. Kadane's algorithm is a question asked in interviews by the likes of Microsoft, LinkedIn,
Amazon and Samsung. While a brute force solution like mine has a time complexity of O(n squared), Kadane's algorithm is faster at O(n).

Kadane's Algorithm
1) The algorithm works by initializing a currentSum variable and maxSum variable to the first element in the array, then it iterates over the
   array starting from the second element. 
2) On each iteration, it compares whether adding the current element to currentSum or the current element itself is higher in value, 
   whichever is higher, becomes the new currentSum. If the new currentSum is the current element, essentially, a new sequence has been 
   started and all the elements before are disregarded as they cannot be the maxSum. They can be disregarded because the sequence must be
   contiguous i.e. elements next to each other and one element can be the maxSum.
3) Also on each iteration, the new currentSum is compared with the maxSum, if the new currentSum is higher than the current maxSum, the 
   new currentSum becomes the new maxSum, otherwise maxSum stays the same.
4) Essentially, currentSum is likely to change on every iteration because it is always deciding whether the sequence needs to be added to,
   or a new sequence needs to be started. On other hand, maxSum only changes when currentSum is higher than it.

The Code Explained
1) We first once again handle our error check, returning 0 if all elements in the array are negative.
2) We intialize a variable called maxSum and set it to the first element in the array.
3) We initialize a variable called currentSum and set it equal to maxSum.
4) We then create a for loop which will traverse the integers in the array, starting from the second.
5) On each iteration, we update currentSum. We check whether adding the current element to currentSum, or the current element itself is
   higher, whichever is higher becomes currentSum.
6) We then check whether maxSum or currentSum is higher, if currentSum is higher, this becomes the new maxSum, otherwise maxSum stays the
   same.
7) Once our loop finishes, we return maxSum.

Example: maxSequence([-2, 2, 5, -11, 6])
1) maxSum is initialized to -2. currentSum is initialized to -2.
2) Iteration 1. arr[i] = 2. arr[i] + currentSum = 0. arr[i] is higher to currentSum = 2. currentSum = 2, maxSum = -2. The new maxSum = 2.
3) Iteration 2. arr[i] = 5. arr[i] + currentSum = 7. The new currentSum = 7. The new maxSum = 7.
4) Iteration 3. arr[i] = -11. arr[i] + currentSum = -4. The new currentSum = -4. maxSum is still 7 because -4 is lower.
5) Iteration 4. arr[i] = 6. arr[i] + currentSum = 2. The new currentSum = 6 because it's higher than arr[i] = 2. maxSum is still 7.
6) The loop finishes, maxSum 7 is returned.
*/

function maxSequence(arr) {
  if (arr.every(n => n < 0)) {return 0;}

  let maxSum = arr[0];
  let currentSum = maxSum;

  for (let i = 1; i < arr.length; i++) {
    currentSum = Math.max(currentSum + arr[i], arr[i]);
    maxSum = Math.max(maxSum, currentSum);
  }

  return maxSum;
}

/*
Here is another solution which uses Kadane's algorithm, but using the reduce method instead.
*/

function maxSequence(arr) {
  if (arr.every(n => n < 0)) {return 0;}

  let currentSum = arr[0];
  
  return arr.slice(1).reduce((maxSum, n) => {
    currentSum = Math.max(currentSum + n, n);
    return maxSum = Math.max(currentSum, maxSum);
  }, currentSum);
}