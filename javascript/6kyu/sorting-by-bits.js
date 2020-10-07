/*
Codewars. 01/07/20. 'Sorting by bits'. 6kyu. Here we are given an array of integers and we are to sort the array - in-place, in ascending 
order - according to the amount of 1 bits each integer has, if two numbers both have the same amount of 1 bits, the numbers are sorted 
according to their original (i.e. decimal) values. Here is the solution I developed to solve the challenge.
1) We define our function sortByBitsMS, which takes an array of integers as its argument.
2) We call the sort method on the array and pass in a and b as the elements of sort's compareFunction.
3) For a and b, we create variables a1s and b1s which store the amount of 1s in the binary form of a integer and b integer.
4) In our compareFunction, if a has more 1 bits than b, we return 1. A number greater than 0 means a change needs to be made i.e. b needs
   to be placed before a.
5) Otherwise, if a has less 1 bits than b, we return -1. A number lower than 0 means no change needs to be made i.e. a is already correctly
   before b.
6) Otherwise, if a and b have the same amount of 1 bits, we return a - b, which will sort these two numbers according to their
   number/decimal value instead of the amount of 1 bits they have.
7) JavaScript's built in sort() method sorts an array in-place, so it changes the original array. We return the sorted array.
*/

function sortByBitsMS(arr) {
  return arr.sort((a,b) => {
    let a1s = a.toString(2).replace(/0/g, '').length;
    let b1s = b.toString(2).replace(/0/g, '').length;
    if (a1s > b1s) {return 1;} 
    else if (a1s < b1s) {return -1;} 
    else if (a1s == b1s) {return a - b;}
  });
}


/*
Here is the shorter version of my solution.
1) Again we call the sort() method on the array and once again we use a compareFunction.
2) This time we simply subtract the amount of b 1 bits from the amount of a 1 bits. If the result is greater than 0, a change needs to be
   made because a is bigger than b but a is before b - remember we are attempting to sort in ascending order.
3) If the result is less than 0, no change needs to be made because b is bigger than a and b is correctly positioned after a.
4) If the result is 0, we use the or operator and sort based on the numbers themselves.
*/

function sortByBit(arr) {
  return arr.sort((a,b) => a.toString(2).replace(/0/g, '').length - b.toString(2).replace(/0/g, '').length || a - b);
}

// Ruby Solution: arr.sort_by! {|n| [n.to_s(2).gsub(/0/, '').size, n]}