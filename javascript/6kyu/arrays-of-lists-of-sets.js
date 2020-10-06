/*
Codewars. 29/08/20. 'Arrays of Lists of Sets'. 6kyu. Here we create a function which takes an array of strings and returns the sums of the
index positions which have the same characters. For example, ["abc","abbc", "ab", "xyz", "xy", "zzyx"] will return [1, 8]. Here is the
solution I developed to solve the challenge.
1) We fist map over the array and for each string we uniqify the string and sort it.
2) We then initialize an object called freq (for frequency), where we will store the count of each string in the array.
3) We iterate over the array using forEach and populate our freq object, the uniqified string is the property and its count in the array
   is the value.
4) Now we initialize an object called sums, where we will store the sum of index positions for each string in the array.
5) Using forEach again we iterate over the array and populate our sums object, the uniqified string is the property and the value is the sum
   of the index positions.
6) Using a for/in loop and the delete operator, we remove all strings from sums whose frequency is only 1, leaving us with only the strings
   that appeared multiple times.
7) Using the Object.values method we generate an array of the sums and then we sort that array.
8) We return the array of sums.
*/

function sameCharsSumMS(arr) {
  arr = arr.map(s => [...s].filter((c,i,a) => i === a.indexOf(c)).sort().join(''));

  let freq = {};
  arr.forEach(s => freq[s] ? freq[s]++ : freq[s] = 1);

  let sums = {};
  arr.forEach((s,i) => sums[s] ? sums[s] += i : sums[s] = i);

  for (s in sums) {
    if (freq[s] === 1) {delete sums[s];}
  }

  return Object.values(sums).sort((a,b) => a - b);
}

/*
Here is a better solution than mine, inspired by the solution of another Codewars user. This solution doesn't use a frequency count.
1) We initialize an object called indices, where the properties will be the uniqified strings and the values will be an array of their
   index positions in the input array.
2) We create a for loop which traverses the array.
3) Inside our for loop we create a variable called uniq, which stores the uniqified string, this time we uniqify our string by turning it
   into a set and making an array out the elements in that set. We sort the string also, uniqing and sorting mean that all strings with
   the same characters will now be the same.
4) Now we populate our indices object. The property is the uniqified string and the value is an array of its index positions in the
   array.
5) In a variable called res, we generate an array of the values of indices, and remove all the sub-arrays whose length is only 1.
6) We then map over res and for each sub-array we sum the values inside it, then we sort res.
7) We return our array of index sums.
*/

function sameCharsSum(arr) {
  let indices = {};

  for (let i = 0; i < arr.length; i++) {
    let uniq = Array(...new Set(arr[i])).sort().join('');
    indices[uniq] ? indices[uniq].push(i) : indices[uniq] = [i];
  }
  
  let res = Object.values(indices).filter(sa => sa.length > 1);
  return res.map(sa => sa.reduce((s,v) => s + v, 0)).sort((a,b) => a - b);
 }