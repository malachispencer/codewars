/*
Codewars. 04/07/20. 'Normalizing Out of Range Array Indexes'. 6kyu. Here we create a function that normalizes an out of range index. For
example, arr.length will return the first element, arr.length + 1 will return the second element, arr.length * 2 will return the first
element and so on. Negative index values will start indexing from the end of the string. Here is the solution I developed to solve the
challenge.
1) We define our function normIndexMS, which takes an array and an index position as its argument.
2) Whether the index/value given is positive or negative, we can normalize the index to fit into our array by doing i modulo arr.length.
3) In our case, we use the slice method to return all of the array from our normalized index position, then we use bracket notation to take
   the first element of our slice.
*/

function normIndexMS(arr,i) {
  return arr.slice(i % arr.length)[0];
}