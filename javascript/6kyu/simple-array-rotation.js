/*
Codewars. 29/08/20. 'Simple array rotation'. 6kyu. Here we create a function which takes an array of integers and determines whether it is
in ascending or descending order and whether it is rotated or not. Here is the solution I developed to solve the challenge.
1) First we check if the array is non-rotated ascending. We call the every method on the array and for all elements it checks if i === 0 or 
   the previous element is less than the current element. If true for all elements the method returns true and then we return 'A'.
2) We then check if the array is non-rotated descending. Again we call the every method and for all elements it checks if i === 0 or the
   previous element is greater than the current element. If true for all elements the method returns true and then we return 'D'.
3) We then initialize a counter variable called nextHigher to 0, this will be incremented during our for loop when the next element is
   greater than the current element.
4) We create our for loop which traverses the array from start to finish.
5) On each iteration we check if the current element is less than the next element, if so, we increment nextHigher by 1. When we are on the
   index position of last element of the array, the next element will be the first element of the array, that is the purpose of our
   modulo operation.
6) If the value of nextHigher is greater than 1, we have a rotated ascending array so we return 'RA', if it is 1, we have a rotated
   descending array so we return 'RD'. 
7) The reason for the latter is that in any descending ordered array, there will always be 1 next higher. In a D array, for example
   [5, 4, 3, 2, 1], when we are on 1, we compare it with 5 and 5 is higher. So in D arrays nextHigher is incremented when i is on the last
   element. In an RD array, e.g. [5,9,8,7,6], the next element is higher when we are on the last element that was rotated, in this case 5.
8) nextHigher (or if we used nextLower) would be 0 if we had an array with all equal numbers.
*/

function arrRotationMS(arr) {
  if (arr.every((v,i,a) => i === 0 || a[i-1] < v)) {return 'A';}
  if (arr.every((v,i,a) => i === 0 || a[i-1] > v)) {return 'D';}

  let nextHigher = 0;

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] < arr[(i + 1) % arr.length]) {nextHigher++;} 
  }
  
 return nextHigher > 1 ? 'RA' : 'RD';
}