/*
Codewars. 15/06/20. "Multiplication Table". 6kyu. Here we create a function that generates a multiplication table up to any given size.
For example, given the size 3, our table should look like [[1,2,3],[2,4,6],[3,6,9]]. Here is the solution I developed to solve the
challenge.
1) We define our function multiplicationTableMS, which takes an integer size as its argument. This size will define the amount of rows
   (sub-arrays) and columns (sub-array elements) in our array.
2) We initialize an empty array called table.
3) We create a for loop which will define our sub-arrays/rows.
4) Each row will in table is initialized as an empty array.
5) We then create a for loop which will generate our columns.
6) Inside table, each row's (sub-array) column will be the row plus one multipied by the column plus one.
7) If the size is 3 for example, row will be 0 on the first iteration, and then while row is 0, col will be 0, then 1, then 2. But for the
   calculations we add 1, so we get 1 * 1, 1 * 2, 1 * 3. When row is 1, we get 2 * 1, 2 * 2, 2 * 3. When row is 2, we get 3 * 1, 3 * 2,
   3 * 3.
*/

function multiplicationTableMS(size) {
  let table = [];
  for (let row = 0; row < size; row++) {
    table[row] = [];
    for (let col = 0; col < size; col++) {
      table[row][col] = (row + 1) * (col + 1)
    }
  }
  return table;
}

/*
Here is another solution, which uses the Array.from() method.
1) The Array.from() method creates a new, shallow copied Array instance from an array-like or iterable object. As an optional argument,
   it can take a map function and it can also take an optional this argument, which is a value to use as this when executing the map
   function.
2) Here we use the Array.from() and pass in {length:size} as the argument, which generates an array containing how ever many values size
   is equal to, these values will all be undefined.
3) We then place in the optional map function and use an arrow function as the map function. Since the elements are all undefined we place
   an underscore as that block variable because we won't be using it, i represents the index.
4) Each undefined element in the array then becomes an array with size amount of elements, by once again using the Array.from() sequence
   generator. This again requires a map function where we can create our multiplication table.
5) i represents the row (sub-array) index's, j represents the column indexes (of each row/sub-array). For each i, j will iterate size amount 
   of times. If our size is 3, on the first iteration of i (when it's 0), we'll get 1 * 1, 1 * 2, 1 * 3; when it's 1 we'll get 2 * 1, 2 * 2, 
   2 * 3; when it's 2 we'll get 3 * 1, 3 * 2, 3 * 3.
*/

function multiplicationTable(size) {
  return Array.from({length:size}, (_,i) => Array.from({length:size}, (_,j) => (i + 1) * (j + 1)))
}