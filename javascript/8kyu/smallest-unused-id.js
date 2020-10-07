/*
Codewars. 10/06/20. "Smallest unsed ID". 8kyu. Here we are given an array of unsorted, possible containing duplicates, array of used IDs, 
and we have to return the smallest unused ID. IDs start at 0. For example, [0,1,2,3,5] should return 4. Here is the solution I developed to
solve the challenge.
1) We define our method smallestUnusedIDMS, which takes an array of IDs as its argument.
2) First we sort the array of IDs (integers) using the sort() method. The built-in sort method sorts alphabetically, so to sort numerically
   we must add another function to the sort method.
3) Our numeric sort can take varying syntax: ids.sort(function(a,b) {return a-b}); or ids.sort((a,b) => a - b);. This sorts in ascending
   order, sorting in descending order requires b - a. We store our sorted array in a reassigned ids array.
4) We then create a for loop which iterates the index of the array.
5) If the first element in the array is not 0, we return 0. The IDs start at 0 so if we don't have a 0 in the array, 0 was the smallest
   unused ID.
6) If the next ID in the array minus the current ID we're iterating over is more than 1, we return the value of the current ID plus 1.
   This is the smallest unused ID because remember we can have duplicates (so difference would be 0) and if the difference is 1, there is
   no unused in between ids[i] and ids[i+1].
7) If we have traversed the array and not returned anything yet, our smallest unused ID is 1 higher than the max ID from the array, so in
   that case we return Math.max(...ids) + 1.
*/

function smallestUnusedIDMS(ids) {
  ids = ids.sort((a,b) => a - b);
  for (let i = 0; i < ids.length - 1; i++) {
    if (ids[0] != 0) {
      return 0;
    }
    if (ids[i+1] - ids[i] > 1) {
      return ids[i] + 1;
    }
  }
  return Math.max(...ids) + 1;
}

/*
Here is a very clever solution which uses a while loop.
1) We initialize a variable n to 0, which will act as a sort of counter variable. 
2) In JavaScript - just like in Ruby - creating a while loop requires that you specify a condition where the loop runs as long as this
   condition is true. In our while loop, we specify that the loop runs as long as the array includes n.
3) While the array includes n, we increment n by 1 (n++).
4) Therefore, if our array starts at 1 but n is 0, the loop won't run. Then below the loop we return n, which in this case will be 0.
5) If our input is [1,2,0,2,3,5], 0 is included so now n = 1, 1 is included so now n = 2, 2 is included so now n = 3, 3 is included so now
   n = 4, 4 is not included so the loop is broken out of. Then n (4) is returned.
6) If our input is [0,1,2,3,4,5,6,7,8,9,10], once we check if 10 is included, n will become 11, then 11 won't be included so the loop is 
   broken out of, then we return n (11).
*/

function smallestUnusedID(ids) {
  let n = 0;
  while (ids.includes(n)) {
    n++;
  }
  return n;
}

/*
Here is one more solution, which uses a for loop and the indexOf() method.
1) The indexOf() method searches an array for a given item and returns its position, if the item is not found, it returns -1.
2) Therefore, if no index position is found for our incrementer i, this is the smallest unused ID so we simply return i.
3) If we traverse the array and do not find a missing ID in it, because the IDs start at 0, the missing ID will simply be the max
   value + 1 or put in another way, the array length + 1.
*/

function smallestUnusedIDX(ids){
  for (i = 0; i < ids.length; i++) { 
    if (ids.indexOf(i) == -1){
      return i;
    }
  }
  return ids.length;
}