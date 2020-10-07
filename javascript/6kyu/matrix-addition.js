/*
Codewars. 15/06/20. 'Matrix Addition'. 6kyu. We are given two NxN two dimensional arrays and we must add each element add the elements in
corresponding index positions together. For example, [[1,2],[3,4]] and [[5,6],[4,3]] should return [[6,8],[7,7]]. Here is the solution I
developed to solve the challenge.
1) First we map over the first array, which array we map over doesn't matter. Because all array elements are arrays, we will be mapping
   over the sub-arrays (rows), ri represents the row index.
2) For each row, we map over its columns, ci represents column index.
3) Inside each row of a, we add the element to the element in the same row and column index of b.
4) We return the new array where the matrices of a and b have been added together.
*/

function matrixAdditionMS(a,b) {
  return a.map((row,ri) => row.map((col,ci) => col + b[ri][ci]))
 }

 /*
 Here is another solution, which uses a nested for loop instead of map.
 1) We initialize an empty array, where we will store the new matrix, we store it in a variable ma.
 2) We create our first for loop, which will iterate the rows of the matrices.
 3) Inside our for row for loop, we initialize an empty array, which for each row in a, will become a sub-array in the new matrix.
 4) Now we create our second for loop, which will give us access to the columns inside each row. 
 5) Then we assign each column inside the new array as the corresponding row columns from a and b added together.
 6) Of course, each time i accesses a new row in a, this process repeats.
 7) We return our new added matrix.
 */

function matrixAddition(a,b) {
  let ma = [];
  for (let i = 0; i < a.length; i++) {
    ma[i] = [];
    for(let j = 0; j < a[i].length; j++) {
      ma[i][j] = a[i][j] + b[i][j];
    }
  }
  return ma;
}