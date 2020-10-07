/*
Codewars. 20/08/20. 'A String of Sorts'. 6kyu. Here we create a function which takes two strings and sorts the first according to the
order of the letters in the second. The second string may contain duplicates, which need to be removed. Any characters in the first string
that are not in the second, must be appended to the end of the sorted string in the order they appeared in the first string. Here is the
solution I developed to solve the challenge.
1) We first see to it that we remove duplicates from our second string, we do so by placing the string inside a set. A set only holds
   unique values so duplicates are automatically deleted but the order of the characters remains the same.
2) Once we have removed the duplicates by putting the string in a set, we convert the set into an array of characters using the spread
   operator, then we join the array into a string and store it in a variable called sortBy. We also could have used Array.from() to
   convert the set into an array.
3) Now we extract the characters in the first string that are not in the second, by calling the replace method on the string and removing
   all the characters that are in the second string, leaving only the ones that are exclusive to the first, in their original order. We
   store this in a variable called exclusive.
4) We then initialize a new string called sorted, where we will store the sorted string.
5) We then create a for loop which will iterate over sortBy. On each iteration, we extract all the characters in the first string, which
   match the current character in sortBy, we do so by calling the replace method and removing all the characters in the first string
   which are not the current character in the second string. We then append these extracted characters to sorted.
6) After our for loop, which adds the extracted characters in the sorted order, we concatenate sorted and exclusive and return them.
*/

function sortStringMS(str, order) {
  let sortBy = [...new Set(order)].join('');
  let exclusive = str.replace(RegExp(`[${sortBy}]`, 'g'), '');
  let sorted = '';
  for (let i = 0; i < sortBy.length; i++) {
    sorted += str.replace(RegExp(`[^${sortBy[i]}]`, 'g'), '');
  }
  return sorted + exclusive;
}

/*
Here is another solution, submitted by a Codewars user, which uses no regular expressions.
1) We first remove all the duplicates from order, by splitting it into an array then calling the filter method on it. Inside our filter
   block, we keep only the first instance of each character by calling the indexOf() method on each character and keeping only the
   characters whose indexOf() return value is the same as i.
2) Now order is a array of unique characters, we map over it and for each character, we call split on the first string and then filter,
   keeping only the letters in the first string which are the same as the current character in the order/the second string. We store this
   in a variable called sorted.
3) Sorted is now an array of arrays, for example [[], [], ['b'], ['u'], ['o', 'o'], ['l'], [], ['i'], ['h']]. We call the reduce method on
   it, passing the accumulator and each sub-array as the callback parameters, an empty array is the starting object of our reduce
   function. We use the concat method to merge each sub-array into the accumulator array. This removes any empty arrays and essentially
   flattens the array of arrays.
4) Now we must add the characters that were exclusive to the first string, so we call the concat method on sorted and inside the concat
   method we split the first string into an array of characters, then call filter, keeping only the characters which are not included in
   the second string. Finally, we join the array into a string.
5) Now we have successfully sorted the string and we return it.
*/

function sortString(str, order) {
  order = order.split('').filter((c,i) => order.indexOf(c) == i);
  let sorted = order.map(c => str.split('').filter(l => l === c));
  sorted = sorted.reduce((acc, subArr) => acc.concat(subArr), []);
  return sorted.concat(str.split('').filter(c => !order.includes(c))).join('');
}