/*
Codewars. 04/07/20. 'Split and then add both sides of an array together.' 6kyu. We are given an array of integers and a number n. We must
split the array in half, place both halves on top of each other, then add both halves of the array together i.e. add same-indexed elements.
If the left half is shorter than the right half, we place a 0 at the front of the left array. We repeat this process n times and return the 
final array. Here is the solution I developed to solve the challenge.
1) We define our function splitAndAddMS, which takes an array of integers and a number (n) of times we must perform our split and add
   process as its arguments.
2) The first thing we do in our function is create a while loop which runs as long as n is above 0, we will decrement n on each iteration.
3) We find the mid point of the array by dividing the array length in half, then flooring the result using the double tilde operator.
4) We create our left array, which is from 0 up to and not including the mid point, so if our array length is odd, left will always be
   the shorter side, before we pad it with a 0.
5) We create our right array, which is from the mid point to the end of the array.
6) The slice() method does not change the original array, it returns new arrays, so it is safe for us to place left and right slices on
   seperate lines.
7) If left is shorter than right in length, we pad left with a 0 by using the unshift() method. This makes sure that our indexes align
   correctly when it's time to add the arrays together.
8) We then set our input array equal to left and right added together.
9) We decrement n by 1.
10) Our while loop performs this process again until n is equal to 0.
11) Once our loop finishes, we return the final array.
*/

function splitAndAddMS(arr,n) {
  while (n > 0) {
    let mid = ~~(arr.length / 2);
    let left = arr.slice(0, mid);
    let right = arr.slice(mid);
    if (left.length < right.length) {left.unshift(0);}
    arr = left.map((n,i) => n + right[i]);
    n--;
  }
  return arr;
}

/*
Here is a solution that uses recursion.
1) If n is 0, the array is returned.
2) If the array length is an odd number, we add a zero to the beginning to even it out. As opposed to my solution, here we add the zero to
   the front before we've split the array in half.
3) We recusively call the function.
4) Inside this function call, we split the array into a left half using splice(). The first parameter of splice is where we start the 
   extraction and the second parameter is how many elements we are extracting, so we extract the first half of the array.
5) splice() creates a new array and changes the original array, so now splice() is the left half and arr is the right half. Thus we map
   over the left half and add the right half elements to the same-indexed elements of the left half. This creates a new array which will
   be the array next time our function runs.
6) The second argument of our function is n subtracted by 1. We cannot use a decrementer i.e. n--, we must do n - 1.
7) The function runs recursively as long as n is above 0 and once n hits 0, the final array is returned.
*/

function splitAndAdd(arr,n) {
  if (n == 0) {return arr;}
  if (arr.length % 2 != 0) {arr.unshift(0);}
  return splitAndAdd(arr.splice(0, arr.length / 2).map((n,i) => n + arr[i]), n-1)
}