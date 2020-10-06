/*
Codewars. 20/06/20. 'Two Sum'. 6kyu. Here we create a function that takes an array of integers and a target number, and searches in the array
for two numbers that when added together equal the target number. The function must return the index positions of the number. Here is the
solution I developed to solve the challenge.
1) We define our function twoSumMS, which takes an array of integers and a target number as its arguments.
2) We create a for loop which will iterate the array of numbers.
3) Inside our for loop, we create a variable called otherNum, which is the target number minis the current number we are iterating over.
4) For whatever number in nums we are currently on, if otherNum is not the same number and nums includes otherNum, we return - inside 
   an array - i and the index of otherNum, by using the findIndex method.
*/

function twoSumMS(nums, t) {
  for (let i = 0; i < nums.length; i++) {
    let otherNum = t - nums[i];
    if (nums.indexOf(otherNum) != i && nums.includes(otherNum)) {
      return [i, nums.findIndex((n,j) => j != i && n == otherNum)]
    }
  }
}

/*
Here is a better solution, submitted by a Codewars user.
1) We create an empty object called obj.
2) We iterate over nums using a forEach() loop and add key-value pairs to obj. The keys will be the integer and the values will be the index
   position. If there are duplicate integers in the array, the value will end up being the last index position of that integer, which
   suits our purposes perfectly.
3) We then create a for loop which will iterate nums again.
4) Inside our for loop we create the variable otherNum, which is the target minus the current number in the iteration.
5) If otherNum is included in our hash and its value is not the same as the current index position we are on, we return the current index
   position we are on, and the value of the otherNum key (which is its index position).
6) If our input is twoSum([2,2,3], 4). obj[2] will be equal to 1 because that is the index position of the last 2. So when we are inside
   our for loop and i = 0, otherNum will be 4 - 2 = 2. obj[otherNum] will not be undefined and it will not be equal to 0 either because
   it's 1. So we'll return 0 (i) and 1 (obj[otherNum]).
*/

function twoSum(nums, t) {
  let obj = {};
  nums.forEach((n,i) => obj[n] = i);

  for (let i = 0; i < nums.length; i++) {
    let otherNum = t - nums[i];
    if (obj[otherNum] != undefined && obj[otherNum] != i) {
      return [i, obj[otherNum]];
    }
  }
}

/*
Here is a solution which is a slightly better variation of my original solution.
1) We create a for loop to traverse nums.
2) We create a variable oNum (other number), which is equal to the target minus the current number we are iterating over.
3) We create a variable called oInd (other index) where we find the index of oNum using the indexOf() method. In the second (optional)
   argument of the indexOf() method we can specify where to start our search, so we specify to start from i + 1, so we do not get the index
   of the same number if for example target is 4, num[i] is 2 and oNum is 2.
4) If oInd is not equal to -1, that means oNum exists in nums and its not num[i], so we return i and oInd.
*/

function twoSumX(nums, t) {
  for (let i = 0; i < nums.length; i++) {
    let oNum = t - nums[i];
    let oInd = nums.indexOf(oNum, i + 1);
    if (oInd != -1) {
      return [i, oInd]
    }
  }
}