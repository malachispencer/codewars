/*
Codewars. 17/06/20. 'search in multidimensional array'. 6kyu. Here we create a function which takes a multidimensional array and a value
and determines whether that value exists somewhere in that multidimensional array. For example, 
(['a','b',['c','d',['e',['a','b',['c','d',['e4']]]]]], 'e4') should return true. Here is the solution I developed to solve the challenge.
1) We define our function searchNestedArrayMS, which takes a multidimensional array and a value we are looking for in the array.
2) We return whether the array, when flattened - by passing it into our flatten function - includes the value, if so, our function
   returns true, if not, it returns false.
3) In JavaScript, the flat() method can flatten an array any specified number of depths, however, by default - with no depth passed in - it
   only flattens by 1 depth level. If we want to mimic the flatten method of Ruby - which flattens an array completely by default - we 
   pass in Infinity to the flat() method.
4) In this kata, the flat() method was not available, so in our flatten function, we build our own flattening algorithm.
5) The flatten function takes an array as its argument and our first step is to create an empty array call flat, where we will store the
   elements in the array and sub-arrays.
6) Because we are going to use recursion, but we want to keep whatever elements were pushed into flat in flat when we make a recursive
   call i.e. we don't want flat becoming an empty array again - we create a helper function inside our function. The helper function will
   perform the flattening.
7) Inside our helper function, we call forEach on the array, if the element we are iterating over is an array (sub-array), the helper
   function is called recursively, otherwise, the element is pushed into flat.
8) Our helper function must receive it's first call after we've created it inside our flatten function.
9) We return flat, the flattened array.
10) flatten([1, 2, [3, 4, [5]]]) breakdown:
    1) helper([1, 2, [3, 4, [5]]]) is called.
    2) Current element: 1. 1 is pushed into flat. flat = [1].
    3) Current element: 2. 2 is pushed into flat. flat = [1, 2].
    4) Current element: [3, 4, [5]]. helper is called recursively. flat still = [1, 2].
    5) Current element: 3. We are now inside the sub-array. 3 is pushed into flat. flat = [1, 2, 3].
    6) Current element: 4. 4 is pushed into flat. flat = [1, 2, 3, 4].
    7) Current element: [5]. helper is called recursively. flat still = [1, 2, 3, 4].
    8) Current element: 5. 5 is pushed into flat. flat = [1, 2, 3, 4, 5].
    9) flat = [1, 2, 3, 4, 5] is returned. 
*/

function searchNestedArrayMS(arr,v) {
  return flatten(arr).includes(v);
}

function flatten(arr) {
  let flat = [];

  function helper(arr) {
    arr.forEach(e => Array.isArray(e) ? helper(e) : flat.push(e));
  }

  helper(arr);
  return flat;
}

/*
Here is the longer version of our forEach flatten function.
*/

function flattenX(arr) {
  let flat = [];

  function helper(arr) {
    for (let i = 0; i < arr.length; i++) {
      e = arr[i];
      if (Array.isArray(e)) {
        helper(e);
      } else {
        flat.push(e);
      }
    }
  }
  
  helper(arr);
  return flat;
}

/*
Here is a very clever one-line solution which doesn't even flatten the array but uses recursion.
1) We call the some method on the array, which will return true if any element passes our test. It is basically the JavaScript version of
   Ruby's any? method.
2) If the element is an array, we recursively call the function, passing in the sub-array and the value as arguments. Otherwise, we use
   the strict equal comparison operator to check if the element is the same value and type as the value we are searching for.
3) If a match is found at any point inside any of the sub-arrays, true is returned, if no matches are found, the some method returns
   false.
*/

function searchNestedArray(arr,v) {
  return arr.some(e => Array.isArray(e) ? searchNestedArray(e, v) : e === v);
}

/*
Here is a solution which uses the Underscore library, which provides over 100 functions.
1) We require the underscore library by doing const _ = require('underscore').
2) We then completely flatten the array using the _.flatten() method.
3) We then call the indexOf method, which works best for finding primitive values and returns the index position of the first match, if
   it doesn't find a match, it returns -1. So if indexOf(v) is not -1, that means the value exists in our multidimensional array and so we
   return true, if not, false is returned. 
*/

function searchNestedArrayX(arr,v) {
  const _ = require('underscore');
  return _.flatten(arr).indexOf(v) != -1;
}