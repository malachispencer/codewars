/*
Codewars. 12/06/20. 'uniq (UNIX style)'. 6kyu. Here we create a function that mimics what would be the squeeze method in Ruby, on an array
in JavaScript. It takes an array and reduces consecutive duplicates down to one. Here is the solution I developed to solve the challenge.
1) We define our method uniqArrayMS, which takes an an array of elements 0 or more elements.
2) If the array only has 1 element, we return that same array.
3) We then initialize an empty array using the 'new Array()' syntax, this is where we will store our uniq values.
4) We create a for loop which will traverse the array.
5) Inside our for loop, if the last element in uniq is not the current element in the array, we add that element to uniq.
6) Because undefined is not automatically added to uniq under our condition, we add in the condition of the current element also being
   added if it is undefined.
7) If our input is ['a','a','b','b','c','a','b','c','c']. On the first iteration, 'a', will not be included in uniq because uniq is
   empty, so 'a' is added to uniq. On the second iteration, 'a' is the last element in uniq so it's not added. On the third iteration, 'b'
   is not the last element in uniq so uniq = ['a','b']. On the fourth iteration, 'b' is the last element in uniq so it's not added. On the
   fifth iteration, 'c' is not the last element in uniq so uniq = ['a','b','c']. And so on...
8) We return our uniq array.
*/

function uniqArrayMS(arr) {
  if (arr.length == 1) {
    return arr
  }
  let uniq = new Array();
  for (let i = 0; i < arr.length - 1; i++) {
    if (uniq[uniq.length - 1] != arr[i] || arr[i] == undefined) {
      uniq.push(arr[i]);
    }
  }
  return uniq;
}

/*
Here is a shorter solution, which uses the filter method.
1) We call the filter method on our array, and pass in element and index as our parameters.
2) We add to a new array the element if it's index is 0, or if that element is not equal to the previous element in the array.
3) Input: ['a','a','b','b','c','a','b','c','c']
  1) Current element: 'a'. This will be selected because it's index is 0. new = ['a'].
  2) Current element: 'a'. Previous element is the same so it's not selected.
  3) Current element: 'b'. Previous element not the same so it's selected. new = ['a','b'].
  4) Current element: 'b'. Previous element the same so it's not selected.
  5) Current element: 'c'. Previous element not the same so it's selected. new = ['a','b','c'].
  6) Current element: 'a'. Previous element not the same so it's selected. new = ['a','b','c','a'].
  7) Current element: 'b'. Previous element not the same so it's selected. new = ['a','b','c','a','b'].
  8) Current element: 'c'. Previous element not the same so it's seleceted. new = ['a','b','c','a','b','c'].
  9) Current element: 'c'. Previous element the same so it's not selected.
  10) new array = ['a','b','c','a','b','c'].
*/

function uniqArray(arr) {
  return arr.filter((e,i) => i == 0 || e != arr[i-1]);
}
