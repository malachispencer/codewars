/*
Codewars. 28/06/20. 'I need more speed!' 6kyu. Here we create a function that mimics the reverse() method, reversing an array in-place i.e.
the original array is changed. Reversing an array out-of-place means creating a new array where the elements of the original array are
reversed. Here is the solution I used to solve the challenge.
1) We define our function reverseMS, which takes an array as its argument.
2) We find the middle index of our array, by dividing the length of the array by two then using the double tilde operator to round the 
   result down if the result is not a whole number.
3) We create a for loop which runs until i hits the middle index.
4) Inside our for loop, we set a variable called temp, which will change every iteration, temp is initially the last element in the array,
   then it will move inwards 1 element at a time on each iteration.
5) We make the actual element which temp duplicated, equal to the current element. The current element at this point is still its
   original element.
6) We then make the current element equal to temp.
7) Once our loop finishes, we have a reversed array, which we return.
*/

/*
Example 1: reverseMS([1,2,3,4,5])
1) mid = 5 / 2 = 2.5, rounded down = 2.
2) Iteration 1: i = 0. Current element = 1, End matching element = 5. temp becomes 5. End match gets changed to 1. Current gets changed to 5.
3) Iteration 2: i = 1. Current = 2, End match = 4. temp becomes 4. End match gets changed to 2. Current gets changed to 4.
4) Loop is broken out of because i is no longer less than mid, mid is 2.
5) Reversed array is returned.
6) As we can see, when there is an odd number of elements in the array, the very middle element is not touched.
*/

/*
Example 2: reverseMS([1,2,3,4,5,6])
1) mid = 6 / 3 = 3.
2) Iteration 1: i = 0. Current element = 1. End matching element = 6. temp becomes 6. End match gets changed to 1. Current changed to 6.
3) Iteration 2: i = 1. Current = 2. End match = 5. temp becomes 5. End match gets changed to 2. Current changed to 5.
4) Iteration 3: i = 2. Current = 3. End match = 4. temp becomes 4. End match gets changed to 3. Current changed to 4.
5) Loop is broken out of because i is no longer less than mid, which is 3.
6) Reversed array is returned.
7) When there is an even number of elements in the array, all elements are touched.
*/

function reverseMS(arr) {
  let mid = ~~(arr.length / 2);

  for (let i = 0; i < mid; i++) {
    let temp = arr[arr.length - 1 - i];
    arr[arr.length - 1 - i] = arr[i];
    arr[i] = temp;
  }

  return arr;
}

/*
Here are two functions which passed all tests but were not efficient enough and hence caused a time out.
*/

function reverseBeta(arr) {
  let left = arr.length - 1;

  while (left > 0) {
    arr.splice(left, 0, arr.shift());
    left--;
  }

  return arr;
}

function reverseBetaX(arr) {
  let start = 0;
  let end = arr.length -1;

  while (start < end) {
    [arr[start], arr[end]] = [arr[end], arr[start]];
    start++;
    end--;
  }
  
  return arr;
}