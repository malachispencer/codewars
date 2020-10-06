/*
Codewars. 28/08/20. 'Array combinations'. 6kyu. Here we create a function which takes an array of arrays and returns how many unique arrays
can be formed by taking exactly one element from each sub-array. For example,  [[1,2],[4,4],[5,6,6]] will return 4 because [1,4,5], 
[1,4,6], [2,4,5] and [2,4,6] can be formed. Here is the solution I developed to solve the challenge.

The Pattern:
On the surface it may seem like we'd need to actually create all the array combinations, and then count how many there are, but instead
there is a pattern which leads to a handy shortcut. Instead, we simply take the length of each sub-array - with unique elements - and then
successively multiply the lengths. This will give us the amount of unique array combinations we can form.

The Code:
1) First we map over the array and for each sub-array, we remove all the duplicates using the filter method.
2) We then call reduce on the array starting from the second element. The intial value of our accumulator is the length of the first
   sub-array, then we multiply the accumulator by the length of all the other sub-arrays.
3) We return the result of reduce.
*/

function combinationsMS(arr) {
  arr = arr.map(sub => sub.filter((e,i) => i === sub.indexOf(e)));
  return arr.slice(1).reduce((sum, sub) => sum * sub.length, arr[0].length);
}

/*
Here is a much shorter and improved version of my solution.
1) We call reduce on the array and set the initial value of the accumulator to 1, so when we multiply the accumulator by the first
   unique sub-array size, the accumulator will become the size of that first unique sub-array.
2) We then multiply the accumulator by the size of the sub-array when it's turned into a set, which removes all the duplicates.
3) Note, in my original solution, I tried to unique the sub-arrays by turning them into a set, then turning them back into an array, but
   when I did this, sub-arrays with 1 element ended up having no elements. Here we don't convert them back to arrays, we just leave them
   as sets and use the set instance method size, which is all we need.
4) We return the result of reduce.
*/

function combinations(arr) {
  return arr.reduce((sum,sa) => sum * new Set(sa).size, 1);
}