/*
Codewars. 19/08/20. 'Reverse FizzBuzz'. 6kyu. Here we create a function which takes a string that will be a valid section of a FizzBuzz 
sequence and returns an array where Fizz, Buzz and FizzBuzz are substituted for the number that should be in their place. If there are no 
numbers in the string, the words should be replaced with the first appearance of those words in the FizzBuzz sequence. Here is the 
solution I developed to solve the challenge.
1) We first split the string at its spaces thereby creating an array of the FizzBuzz sequence.
2) If the length of the array is 1, we check whether it holds Fizz, if so we return [3], if not, we check if the array holds Buzz, if so,
   we return [5], if not, it most hold FizzBuzz so we return [15].
3) Now we check whether the length of the array is 2 and that none of the elements in the array are numbers. If this is the case, we have
   another first appearance sequence. So if the first element in the array is Buzz, we return [5, 6], if not, we return [9, 10].
4) Now that we have handled our first appearance sequences, we move onto our sequences which contain numbers.
5) We first map over the array and if the element is a word, we leave it the same, otherwise, we convert that element to a number data
   type.
6) In a variable called firstNumInd, we store the index position of the first number in the array.
7) In a variable called lowerLen, we store the number of elements which come before the first number in the array, which is the same as
   firstNumInd, for example, if the first number is in the 3rd position of the array, firstNumInd will be 2, and there will be 2 elements
   before that first number. If the first number is in the 1st position of the array, firstNumInd will be 0, and there will be 0
   elements before the first number.
8) In a variable called upperLen, we store the number of elements in the array from the first number to the end of the array.
9) We then initialise a variable called u to 0, we will use this as an incrementer to add numbers to a new array called reversed. We also
   intialize a variable called l to 1, we will use this also as an incrementer, but this time to subtract from the first number so we can
   populate reversed with the numbers that come before the first number in the sequence.
10) Now we create a while loop which runs as long as u is less than upperLen, as long as it is, we push into reversed u + first number, then
    increment u by 1. This populates reversed with all the numbers that come after the first number.
11) Now we create a while loop which runs as long as lowerLen is above 0 - i.e. there are elements before the first number. Using the 
    unshift method, we add to the front of the array first number minus l, then we increment l by 1 and decrement lowerLen by 1.
12) Now reversed is the sequence of numbers before Fizz, Buzz and FizzBuzz were added, we return reversed.
*/

function reverseFizzBuzzMS(s) {
  s = s.split(' ');
  
  if (s.length == 1) {
    return s[0] === 'Fizz' ? [3] : s[0] === 'Buzz' ? [5] : [15];
  } else if (s.length == 2 && s.every(e => (/^[a-z]+$/i).test(e))) {
    return s[0] === 'Buzz' ? [5, 6] : [9, 10];
  }
  
  s = s.map(e => /[a-z]+/i.test(e) ? e : Number(e));
  let firstNumInd = s.findIndex(e => typeof e === 'number');
  let lowerLen = firstNumInd;
  let upperLen = s.slice(firstNumInd).length;
  let u = 0;
  let l = 1;
  let reversed = [];
  
  while (u < upperLen) {
    reversed.push(s[firstNumInd] + u);
    u++;
  }
  
  while (lowerLen > 0) {
    reversed.unshift(s[firstNumInd] - l)
    l++;
    lowerLen--;
  }
  
  return reversed;
}

/*
Here is a much more concise solution, submitted by a Codewars user.
1) We split the string at its spaces into an array and store this in a variable arr.
2) We find the index position of the first number in the array and store this in a variable called fni (first number index).
3) If fni is -1, meaning there were no numbers in the sequence, we must return the words with 'first appearances'. Therefore if the
   original string is Fizz, we return [3], if the string is Buzz, we return [5] and so on.
4) Now we have handled all the first appearance cases. We handle the cases that contain numbers.
5) We map over the array and include the elements and index positions in our callback. If the index position of the current element is less
   than fni, so if the current element is before the first number in the sequence, we make that element equal to the first number minus
   the difference between the first number index and the current index position.
6) For example, if fni = 2 and arr[fni] = 22106. On the first iteration the element is 'Fizz' and i = 0. fni - i = 2 - 0 = 2 then 22106 -
   2 = 22104. On the second iteration, the element is 'Buzz' and i = 1. fni - i = 2 - 1 = 1 then 22106 - 1 = 22105.
7) If i is greater than or equal to fni, we either are on the first number, or we are on a number that comes after it. In this case, we add
   the difference between i and fni to the first number.
8) For example, using our previous example, on the third iteration i is 2 and fni is 2. i - fni = 0 then 22106 + 0 = 22106. On the fourth
   iteration, i is 3 and fni is 2. i - fni = 3 - 2 = 1 then 22106 + 1 = 22107.
9) Once our map block is concluded, we have successfully reversed our FizzBuzz sequence, we return the array.
*/

function reverseFizzBuzz(s) {
  let arr = s.split(' ');
  let fni = arr.findIndex(e => (/^\d+$/).test(e));
  if (fni == -1) {
    if (s === 'Fizz') return [3];
    if (s === 'Buzz') return [5];
    if (s === 'FizzBuzz') return [15];
    if (s === 'Buzz Fizz') return [5, 6];
    if (s === 'Fizz Buzz') return [9, 10];
  }
  return arr.map((e,i) => i < fni ? +arr[fni] - (fni - i) : +arr[fni] + (i - fni));
}

/*
Here is a final solution, also submitted by a Codewars user.
1) In an object called firsts, we store our first appearance properties and values.
2) Inside our function, the first thing we do is check if the string is a property in our object using the in operator. If so, we have
   found a first appearance and so we return the value of that property in firsts.
3) Now we move onto our cases where numbers included in the string, firstly splitting our string at its spaces into an array.
4) We then find the index of the first number in the array using the findIndex method and inside the findIndex method we call the
   isNaN method, which returns true if the value passed in is not a number. However, we place a bang in front of it, which means true
   will be returned if the element is not not-a-number, in other words, it will return true if it is a number.
5) We then map over the array, passing element and index paramters into our callback function. In our map block, we add negative fni to i to
   first number as we traverse the elements.
6) If fni = 2, arr[fni] = 22106 and i = 0. On the first iteration we will have -2 + 0 + 22106 = 22104. On the second iteration, -2 + 1 +
   22106 = 22105. Third, -2 + 2 + 22106 = 22106. Fourth, -2 + 3 + 22106 = 22107 and so on.
*/

const firsts = {Fizz: [3], Buzz: [5], FizzBuzz: [15], 'Fizz Buzz': [9, 10], 'Buzz Fizz': [5, 6]}

function reverseFizzBuzzX(s) {
  if (s in firsts) return firsts[s];
  let arr = s.split(' ');
  let fni = arr.findIndex(e => !isNaN(e));
  return arr.map((e,i) => -fni + i + +arr[fni]);
}