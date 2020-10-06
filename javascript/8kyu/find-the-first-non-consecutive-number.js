/*
Codewars. 10/06/20. "Find the first non-consecutive number". 8kyu. Here we are given a sorted array of integers and we have to find the
first non-consecutive number in the array. For example, [-3,-2,0,1,2,3,6] should return 0. If the entire array is consecutive we return
null. Here is the solution I developed to solve the challenge.
1) We define our method firstNonConsecutiveMS, which takes an array of integers as its argument.
2) We create a for loop. In JavaScript, when we create a for loop 3 statements are required. Statement 1 is executed one time before the
   execution of the code block, this is where we intialize our block variable i. Statement 2 defines the condition for executing the block,
   this is where we run the loop as long as i is less than the length of the array minus 1, so we basically loop the index of the array.
   Statement 3 is executed on each iteration of the loop once it's been executed, this is where we increment i by 1 using the shortest
   increment by 1 syntax (i++).
3) In our for loop, we use an if block, where if the next element minus the current element is not 1, we return the next element.
4) If we have gone through our loop and nothing has been returned, this means the entire array was consecutive, therefore we return null.
   When we get to arr[i] being the last element in the array, arr[i+1] == undefined, the calculation arr[i+1] - arr[i] is also
   undefined. In Ruby, we'd get a nil error, but we get no error here in JavaScript.
*/

function firstNonConsecutiveMS (arr) {
  for (let i = 0; i < arr.length - 1; i++) {
    if (arr[i+1] - arr[i] != 1) {
      return arr[i+1]
    }
  }
  return null;
}

/*
Here is a very similar solution to mine. 
1) Here we do ++i instead of i++ when creating our incrementer in our for loop.
2) Here we check if arr[i] + 1 is not equal value or type to arr[i+1].
3) For example, if our input is [1,2,3,4,6,7,8] and i is currently 3. arr[i] = 4, arr[i] + 1 = 5, but arr[i+1] = 6. The latter two are not
   equal value, so we return arr[i+1], the first non-consecutive number.
4) The !== operator checks if two values are not equal value or type.
*/

function firstNonConsecutive(arr) {
  for (let i = 0; i < arr.length - 1; ++i) {
    if (arr[i] + 1 !== arr[i + 1]) {
      return arr[i + 1]
    }
  }
  return null;
}

/*
Here is another solution I developed, where we use the JavaScript's find method.
1) In JS, the find method is similar to Ruby's find method, in that it returns the first element which is true to the given block. However,
   JavaScript's find method can take in a function, elements, indexes (and more) as parameters.
2) When we call the find method on our array, we pass in element (e) and index (i) as block variables. We check for the first element
   whose index is not 0 and this element minus the previous element is not 1. We store the first non-consecutive in a variable r.
3) Now we use JavaScript's ternary operator, which follows the syntax: return (boolean ? return this if true : return this if false).
4) If r is undefined, we had an array of all consecutives, so we return null, if not, we return r.
*/

function firstNonConsecutiveMSX (arr) {
  let r = arr.find((e,i) => i != 0 && arr[i] - arr[i-1] != 1);
  return (r == undefined ? null : r);
}