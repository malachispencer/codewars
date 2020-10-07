/*
Codewars. 29/08/20. 'Next smaller number with the same digits'. 4kyu. Here we create a function that takes a positive integer and returns
the next smaller integer that can be formed with the same digits. For example, 2071 will return 2017 and 1234567908 will return
1234567890. If a smaller number cannot be formed with the same digits, or the next smaller number would require the leading digit be a zero,
return -1. For example, 135 cannot be turned into a smaller number and 1027 would result in 0721, so -1 is returned. Here is the solution
I developed to solve the challenge.

The Algorithm 
1) Starting from the right, find the first number that has at least one smaller number to its right. For example, in 3928555 this will be
   8. Let's call this x. 
2) Then we find the largest digit that is to the right of x, that is smaller than x. If we have multiple digits that fit this criteria, we
   always take the digit closest to x. For example, in 3928555, this will the 5 immediately after 8, i.e. index position 4. We call this y.
3) We swap x and y, which makes the number smaller. For 3928555 we get 3925855.
4) We then sort all digits to the right of y - which is now in the position where x was - in descending order. This makes the number as big
   as possible, without making it bigger than the original. For 3928555, which is 3925855 after step 3, remains the same because the digits
   are already in descending order.

The Code
1) The first thing we do is convert our number to a string, turn it into an array of characters and then reverse it. We store this in a
   variable called arr.
2) We work with the number in reverse so that we don't need to use for loops to iterate backwards.
3) Because we are working with the number in reverse, we find the index position of the first number that has a smaller number to the left
   of it. We store this in x.
4) If we traversed the entire number and no number had a number to the left of it that was smaller, this number cannot be turned into a
   smaller number with the same digits, so we return -1.
5) Now we are going to look for y. Looking at all the numbers to the left of x, by slicing up to and not including x. We initialize y to
   the first number in the slice which is smaller than arr[x]. We find this first smallest to make our checking easier when we look for the 
   smallest.
6) Now, using forEach to iterate over all the numbers to the left of arr[x], we check on each iteration whether the current digit is less
   than arr[x] and whether it is greater than or equal to the current arr[y], if so, y becomes the index position of the current digit.
   Using this method, if there are multiple smallest digits before x, y ends up being the one closest to x.
7) Now we swap x and y.
8) Now arr[y] is in the position where arr[x] used to be, so we take a slice of all the numbers to the left of x's original position 
   (y's new position) and sort them in ascending order - because remember the number is still reversed - and we concatenate this with the 
   rest of the array from x's original position (y's new position).
9) Now forming the smaller number is complete, we reverse the array of string numbers back and join it into a string. We update this as the
   value of n.
10) If our next smaller number - a string currently - starts with a 0, we return -1.  If not, we return the integer form of the number.
*/

function nextSmallerMS(n) {
  let arr = [...String(n)].reverse();
  let x = arr.findIndex((d,i,a) => i > 0 && a[i-1] < d);
  if (x === -1) {return -1;}
  let y = arr.slice(0,x).findIndex(d => d < arr[x]);
  arr.slice(0,x).forEach((d,i) => {
    if (d < arr[x] && d >= arr[y]) {y = i;}
  });
  [arr[x], arr[y]] = [arr[y], arr[x]];
  n = arr.slice(0, x).sort((a,b) => a - b).concat(arr.slice(x)).reverse().join('');
  return n.startsWith('0') ? -1 : +n; 
}

/*
Here is another solution I developed which doesn't reverse the number and instead follows the algorithm more accurately.
1) We first turn the number into an array of string digits, using string interpolation and the spread operator. We store this in a variable
   called arr.
2) We initialize a variable called pivot to -1. The pivot is the first number - starting from the right - which has a number to its right
   that is smaller.
3) We create a for loop which will start at the penultimate element and then iterate backwards. It will always check the current and the
   next element, so the loop must continue while i = 0 but will finish after that.
4) Inside our for loop, if the current element is larger than the next - i.e. has a smaller number to its right - we set the pivot equal
   to its index position and break out of the for loop.
5) If pivot is still -1 that means we traversed the entire number and there was no digit which had a smaller digit to its right, thus a 
   smaller number cannot be formed with the same digits so we return -1.
6) We initialize a variable called afterPiv, which will be the largest digit to the right of the pivot that is smaller than the pivot.
7) We create another for loop, which will start at the last digit of the number, iterate backwards and stop when it gets to the index 
   pivot.
8) Inside this for loop, if the current element is smaller than the pivot and the current element is greater than or equal to the current
   afterPiv, or afterPiv is undefined, afterPiv becomes the index position of the current element. 
9) Essentially, as soon as the first digit less than the pivot is found, that digit's index position will become the value of afterPiv. Then 
   after that, if a digit that is greater than or equal to the digit of afterPiv - and less than the pivot - is found, that digit's index 
   position will become afterPiv, this ensures that if we have multiple afterPiv's e.g. the 5s in 3928555, the closest 5 will end up being 
   the settled afterPiv.
10) We then swap the pivot and afterPiv.
11) All the digits to the right of afterPiv's new index position (pivot's original position) get sorted in descending order and merged
    with the digits up to and including afterPiv, then we join the array into a string.
12) Our next smallest number is formed into a string, but if it starts with a 0, we return -1, otherwise, we return the integer form of our
    next smallest number.
*/

function nextSmallerMSX(n) {
  let arr = [...`${n}`];
  let pivot = -1;
  
  for (let i = arr.length - 2; i >= 0; i--) {
    if (arr[i] > arr[i+1]) {
      pivot = i;
      break;
    } 
  }
  
  if (pivot === -1) {return -1;}
  let afterPiv;
  
  for (let i = arr.length - 1; i > pivot; i--) {
    if (arr[i] < arr[pivot] && (arr[i] >= arr[afterPiv] || !afterPiv)) {afterPiv = i;}
  }
  
  [arr[pivot], arr[afterPiv]] = [arr[afterPiv], arr[pivot]]
  n = arr.slice(0, pivot + 1).concat(arr.slice(pivot + 1).sort((a,b) => b - a)).join('');
  return n.startsWith('0') ? -1 : Number(n);
}