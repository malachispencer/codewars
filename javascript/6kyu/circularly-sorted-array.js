/*
Codewars. 22/08/20. 'Circularly Sorted Array'. 6kyu. An array is circularly sorted if its elements are sorted in ascending order, but it is
rotated by any number of steps. Here we create a function which determines whether an array is circularly sorted. For example, 
[20, 39, 87, 0, 1] should return true because it is [0, 1] + [20, 39, 87]. [4, 1, 2, 5] should return false. Here is the solution I
developed to solve the challenge.
1) First we handle cases where all the elements in the array are already in ascending order i.e. not rotated. We call the every method and
   check whether all the elements either have an index position of 0, or the previous element is lower than or equal to the current
   element. We must do the i === 0 condition because a[i-1] will be undefined when i = 0 and this will make our function return false
   instead of true when the case is actually true.
2) We then create a for loop. Our i variable will start at the last element of the array, because we are going to iterate from the end of
   the array and stop when we reach the first element.
3) Inside our for loop, we create a variable called right. On the first iteration, this stores the last element of the array, on the
   second iteration, the last 2 elements, then third iteration last 3 elements and so on.
4) We also create a variable called left, this will be all the elements up to but not including the first element in right.
5) We then place the right portion of the array before the left portion of the array using the concat method, and use our every function
   to check if all the elements are in ascending order, if so, we return true. Here we also could have done the following
   if (right.concat(left).join('') === sorted) {return true;} where sorted is a copy of the input array, sorted.
6) Once we have finished our for loop, we have checked every permutation of rotating the array, so if we haven't returned true already,
   the array is not circularly sorted, so we return false.
*/

function isCircleSortedMS(arr) {
  if (arr.every((n,i,a) => i === 0 || a[i-1] <= n)) {return true;}

  for (let i = arr.length - 1; i > 0; i--) {
    let right = arr.slice(i, arr.length);
    let left = arr.slice(0, i);
    if (right.concat(left).every((n,i,a) => i === 0 || a[i-1] <= n)) {return true;}
  }

  return false;
}

/*
Here is a one line solution, inspired by a similar solution of a Codewars user.
1) We create two copies of the original array and merge them using the spread operator, then we convert them into a string where each
   element is delimited by a comma using + ''.
2) We then check if the doubled array includes the original array when it is sorted and also join into a string delimited by commas.
3) Example true case: isCircleSorted([20,39,87,0,1]). Doubled array joined = '20,39,87,0,1,20,39,87,0,1' and sorted array joined =
   0,1,20,39,87. As we can see, the latter is definitely included in the former.
4) Example false case: isCircleSorted([3, 2, 4, 5, 6]). Double array joined = '3,2,4,5,6,3,2,4,5,6' and sorted array joined =
   2,3,4,5,6. As we can see, the latter is not included in the former.
*/

function isCircleSorted(arr) {
  return ([...arr,...arr] + '').includes(arr.sort((a,b) => a - b) + '');
}


/*
Here is a very clever solution, probably the most effecient out of the three.
1) We initialize a variable called nextLower to 0. During our for loop this variable will be incremented if and only if the next number in
   the array - including the first element when we are on the last element - is lower than the current number. 
2) In an ascending ordered array, only 1 element should be lower, in a perfectly sorted array that will be the first element when we are on 
   the last, for example, in [1, 2, 3, 4, 5] when we are on 5, 1 is the next number and it is lower. In a rotated array, the only nextLower
   will be after the first element that was rotated, for example, in [10, 11, 6, 7, 9] 6 is lower than 11, and 11 is the first element in
   this array that was rotated i.e. [11, 6, 7, 9, 10], [6, 7, 9, 10, 11].
3) We create our for loop which traverses the array.
4) On each iteration of our for loop, we check whether the current element is higher than the next element. The use of modulo means that
   when we are on the last element of the array, the next element is indexed as the first element of the array. If the current element is
   higher than the next element, nextLower is incremented by 1.
5) As stated before, in an ascending ordered array, nextLower should only amount to 1. In an empty array, nextLower will be 0. In our tests
   empty arrays should evaluate to true. So if nextLower is less than or equal to 1, our function returns true, otherwise it returns false.
6) Of course, more than 1 nextLower means we have higher numbers coming before lower numbers (descending), so this cannot be an ascending
   ordered and hence circularly sorted array.
*/

function isCircleSortedX(arr) {
  let nextLower = 0;

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] > arr[(i + 1) % arr.length]) {nextLower++;}
  }

  return nextLower <= 1; 
}