/*
Codewars. 04/07/20. 'The furthest distance of index'. 6kyu. We are given an array of integers and a distance k. In the array, we must find 
two numbers, m and n, whereby the difference between m and n is at least k. We must return the m and n with the greatest distance between
them. If no such m and n numbers exist in the array, we must return -1. Here is the solution I developed to solve the challenge.
1) We define our function furthestDistanceMS, which takes an array of integers, and a distance k as its arguments.
2) We initialize a variable called maxDist - which will store the max distance between a pair of integers in the array whose difference is
   at least k - to -1. If no such integers are found, maxDist will remain -1.
3) We create a while loop which runs as long as the length of the array is above 0. Because after each for loop we are going to delete the
   first element from the array.
4) We create a for loop which will iterate from the 2nd element to the end of the array, because for every for loop we are going to compare
   the first element of the array with the rest, one at a time.
5) If the absolute value of the first element in the array minus the current element in the array is greater than or equal to k, we check
   if the differene between their index positions is greater than the current maxDist, if so, i - 0 becomes the new maxDist, otherwise,
   maxDist stays the same.
6) After the for loop, the first element from the array is deleted using shift(), then the for loop runs again because it is within a while
   loop.
7) Even though we are deleting an element from the array after each for loop, because we are always comparing the first element with the
   rest, the index position distance remains the same in each for loop as if all elements were still in the array.
8) We return maxDist, which will be -1 if no m and n pair was found.
*/

function furthestDistanceMS(arr,k) {
  let maxDist = -1;

  while (arr.length > 0) {
    for (let i = 1; i < arr.length; i++) {
      if (Math.abs(arr[0] - arr[i]) >= k) {
        maxDist = (i - 0 > maxDist ? i - 0 : maxDist);
      }
    }
    arr.shift();
  }
  
  return maxDist;
}