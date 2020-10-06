/*
Codewars. 25/08/20. 'Rotate Array (JS)'. 6kyu. In Ruby there is a built-in rotate method, however, no such built-in method exists in
JavaScript. Here we create a function which rotates elements to the right if n is positive and rotates elements to the left if negative, if
n is greater than the array length the function must still work. Here is the solution I developed to solve the challenge.
1) We call the reduce method on the arr and set an empty array as the initial value of the accumulator. We are going to build our rotated
   array with the reduce method.
2) In order to calculate the new index position, we add n to the current index number, then take the remainder of that when divided by the
   length of the array, this makes our indices wrap around the array. We store this in a variable called rotatedIndex.
3) As a positive n example, if i = 1 and n = 2, 1 + 2 = 3 % 5 (arr.length) = 3. So the element in index position 1 can be moved 2 places to 
   the right. As a negative example, if i = 1 and n = -2, 1 + -2 = -1 % 5 (arr.length) = -1. So the element in position 1 will now end up
   as the last element. However, if rotatedIndex is a negative number, we will need to do a further operation on it before we use it to
   change the index position of the element.
4) Hence we change rotatedIndex if it is a negative number, converting the negative index into its positive equivalent. We do so by
   subtracting the absolute value of rotatedIndex from the array length. If the array length is 5 and rotatedIndex is -1, this will be
   5 - 1 = 4. Index position 4 is the last index position in the array, just like -1.
5) We then use the splice method to place the current element into the accumulator array, at rotatedIndex. In the splice method, the first
   parameter is the index position where we want to start adding or removing elements, the second parameter is how many elements we want to 
   remove, and from the third paramter onwards are the elements we want to add. 
6) We also could have used bracket notation indexing to place the current element in the array, by doing rotated[rotatedIndex] = v.
7) We return rotated, our accumulator array and then our function returns rotated.
*/

function rotateMS(arr,n) {
  return arr.reduce((rotated,v,i) => {
    let rotatedIndex = (i + n) % arr.length;
    if (rotatedIndex < 0) {rotatedIndex = arr.length - -rotatedIndex;}
    rotated.splice(rotatedIndex, 0, v);
    return rotated;
  }, []);
}

/*
Here is a much shorter solution, submitted by a Codewars user.
1) We first bring n down into the range of the array index by turning it into the remainder of it when divided by the array length. So for
   example if n = 11 and arr.length = 5, n will become 1. When n is negative, the result of this will be the same absolute value, but
   negative, for example when n = -11 and arr.length = 5, n will become -1.
2) Now when n is positive, the left side of the rotated array will be the first n elements starting from the end of the array. So we grab
   this portion by slicing from -n until the end of the array. For example, if arr = [1,2,3,4,5] and n = 2, the left side of rotated is
   [4,5]. When n is positive the right side of the rotated array, is 0 up to but not including -n.
3) When n is negative, the left side of the rotated array will be from index position positive n to the end of the array. For example,
   if arr = [1,2,3,4,5] and n = -2, the left side of rotated is [3,4,5]. When n is negative the right side is 0 up to and not including
   positive n.
4) We return the rotated array, formed from using slice and concat.
*/

function rotate(arr,n) {
  n %= arr.length;
  return arr.slice(-n).concat(arr.slice(0,-n));
}