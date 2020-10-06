/*
Codewars. 02/07/20. 'Equal Sides Of An Array'. 6kyu. We are given an array of integers. We must create a function which returns the first 
index position where the sum of the integers to the left of the number are equal to the sum of the integers to the right of the integer. If
no such integer/index position is found in the array, we must return -1. For example, [1,100,50,-51,1,1] should return 1 because at position
1 (100), the sum of integers to the left [1] is 1 and the sum of the integers of the right [50,-51,1,1] is 1. Here is the solution I
developed to solve the challenge.
1) We define our function findEvenIndexMS, which takes an array of integers as its argument.
2) We call the findIndex() method on the array, which returns the index position of the first match, and -1 if no match is found.
3) Inside the findIndex() method, we use reduce() to calculate the sum of all integers up to the current integer, and we compare this
   with the sum of all the integers after the current number. When the sums are equal our method will return the index position of the
   current number.
4) If no true value is found, findIndex() returns -1.
*/

function findEvenIndexMS(arr) {
  return arr.findIndex((n,i) => {
    return arr.slice(0,i).reduce((s,n) => s + n, 0) == arr.slice(i+1).reduce((s,n) => s + n, 0);
  });
}

/*
Here is the JavaScript version of the Ruby solution developed by Emily during our pair programming session on 02/07/20.
1) We create a variable called rightSum, which we initialize to the sum of the entire array. 
2) We create a variable called leftSum, which we initialize to 0.
3) We create a for loop which will traverse the array.
4) First we decrement rightSum by the current integer.
5) Now leftSum is the sum of all the integers to the left of the current number, and rightSum is the sum of all the numbers to the right
   of the current number. So we do our check to see if they are equal, if so, we return i.
6) If they are not equal, we increment leftSum by the current number and go on to the next iteration. The process loops until equal sums
   are found or we finish traversing the array.
7) If no equal sums were found, we return -1.
*/

function findEvenIndex(arr) {
  let rightSum = arr.reduce((s,n) => s + n, 0);
  let leftSum = 0;

  for (let i = 0; i < arr.length; i++) {
    rightSum -= arr[i];
    if (leftSum == rightSum) {return i;}
    leftSum += arr[i];
  }

  return -1;
}