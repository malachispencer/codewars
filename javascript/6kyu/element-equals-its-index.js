/*
Codewars. 19/06/20. 'Element equals its index'. 6kyu. Given a sorted array of discrete integers, we must create a function which returns the
lowest index for which array[index] == index. If no such index exists in the array, return -1. Our algorithm must be effecient. Here is the 
solution I developed to solve the challenge, which involves a slight variation of the binary search algorithm.
1) We define our method indexEqualsValueMS, which takes a sorted array of discrete (no duplicates) integers as its argument.
2) We create a variable called start, which will initially be the index of the first element in the array.
3) We create a variable called end, which will initially be the index of the last element in the array.
4) We also create a variable called match, which we initialize to -1, match will be changed if an element == index is found in the array,
   but if not, it will stay as -1. This is convenient because we need to return -1 if no element == index is found in the array.
5) We create a while loop which runs as long start is not greater than end.
6) Inside our while loop, we create a variable called mid, which is start plus end, divided by two, then rounded down using the double tilde
   operator. Within our loop, this will continually give us the mid point between our start and end, the portion of the array we are
   searching in for an element == index.
7) If the middle element in the array is equal to the middle index, we make match equal to mid. In a normal binary search, we would return
   this middle element if it matched the value we were searching for (value would be an extra argument passed into the function).
   However, here we are looking for the smallest index which is the same as its element. Therefore, once we get a match here, we are still
   going to keep looking (in the lower half of the array).
8) In a seperate if block, if the middle element of the array is equal to or greater than mid, we now search in the lower half of the array
   by making end equal to mid - 1.
9) Because our array is sorted - in ascending order - if it's the case that the middle element is greater than the middle index, 
   we know for sure that element == index is not located in the higher half of the array. There is no way the index can catch up to the
   elements at this point, because the array is sorted in ascending order. Therefore, at this point we know for sure, if an element == index 
   does exist in the array, it can only exist in the lower half of the array.
10) If the middle element of the array is smaller than mid (the middle index), if element == index exists in the array, it must be in the
    higher half of the array, so we move the start point to mid + 1.
11) In our iterations, as long as we have found a match, we keep cutting the array in half and searching for another match, until start
    is greater than end, which means the array cannot be halved anymore. This continual cutting in half also occurs when no 
    element == index exists, but which portion is searched in depends entirely on arr[mid] >= mid || arr[mid] < mid.
12) Once our loop finishes, we return match. If we match was changed in the loop, it will return the most recent - i.e. lowest - mid. If
    if wasn't changed, it will return -1.
*/

/*
Example 1: indexEqualsValueMS([-3,0,1,3,4,10])
1) Iteration 1: start = 0, end = 5. mid = (5 + 0) / 2 = 2.5 = 2. arr[2] = 1. arr[mid] is less than mid, so now we are going to search in
   the higher half of the array, so start = 2 + 1 = 3.
2) Iteration 2: start = 3, end = 5. mid = (5 + 3) / 2 = 4. We are searching in [3,4,10]. arr[4] = 4. arr[mid] is the same as mid, 
   so match = 4 and we continue searching, this time in the lower half of the array, so end = 4 - 1 = 3.
3) Iteration 3: start = 3, end = 3, mid = (3 + 3) / 2 = 3. We are searching in [3]. arr[3] = 3. arr[mid] is the same as mid, so match = 3 
   now and we continue searching, again in the lower half of the array, so end = 3 - 1 = 2.
4) At this point, start is 3 and end is 2, start is no longer less than or equal to end, it is now greater than end, which makes no
   logical sense, and triggers the breaking of our loop.
5) The value of match is 3, so 3 is returned, which is correct as the lowest array[index] == index.
*/

/*
Example 2: indexEqualsValueMS([9,10,11,12,13,14])
1) Iteration 1: start = 0. stop = 5. mid = (5 + 0) / 2 = 2.5 = 2. arr[2] = 11, mid = 2. arr[mid] is greater than mid, so there's no way
   element == index can exist in the higher half of the array, because the array is sorted in ascending order, thus we will now search in
   the lower half from our mid-point, so end = 2 - 1.
2) Iteraion 2: start 0. end = 1. mid  = (1 + 0) / 2 = 0.5 = 0. arr[0] = 9, mid = 0. arr[mid] is greater than mid, so once again we must
   search in the lower half of this portion, so end = mid (0) - 1 = -1.
3) At this point, start is 0 and end is -1, start is no longer less than or equal to end, it is now greater than end, which makes no logical
   sense, and triggers the breaking of our loop. Remember, once start is greater than end, it means we cannot cut the portion in half
   anymore.
4) No element == index was found in this array, so we return -1. 
*/

/*
Key Takeaways:
1) In our second example, we were able to determine that no element == index exists in the array of 6 items, with only 2 iterations. In our
   first example, we found our lowest index where element == index, in only 3 iterations for an array of 6 items.
2) In the kata, the random test arrays contained 200,000 elements. We were able to extract the smallest index or discover that no 
   element == index exists with only 17 iterations in some cases and 18 iterations in some cases. Much more effecient than traversing all
   200,000 elements.
*/


function indexEqualsValueMS(arr) {

  let start = 0;
  let end = arr.length - 1;
  let match = -1;

  while (start <= end) {
    let mid = ~~((end + start) / 2);

    if (arr[mid] == mid) {
      match = mid;
    }

    if (arr[mid] >= mid) {
      end = mid - 1;
    } else {
      start = mid + 1;
    }

  }

  return match;
}
