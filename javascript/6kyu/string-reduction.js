/*
Codewars. 01/09/20. 'String reduction'. 6kyu. Here we create a function which takes two strings and returns how many characters we'd need
to remove from the first in order to turn it into the second. For example, 'aabcdefg' and 'fbd' will return 5. Here is the solution I
developed to solve the challenge.
1) We create a counter object for a - which stores the count of every character in a - using the reduce method and do the same for b. We
   store them in variables aCount and bCount respectively.
2) We then generate an array of the unique characters of a, by placing the a string inside a set, then converting that set to an array of
   characters using the spread operator. To get this array we also could have used Object.keys(aCount).
3) We map over the unique a-characters array and for each character we subtract its count in b (or 0 if the character doesn't exist in b)
   from its count in a. We store this in a variable diff (for difference).
4) If any value in diff is a negative number, this means the count of a character in b is higher than it is in a, therefore solely
   removing characters from a will not allow us to form b, thus in this case we return 0.
5) Now, what we have left are strings where there are characters in a that are not in b e.g. 'abcdexyz' and 'yxz', and strings where
   both strings contained exactly the same characters in the same amounts e.g. 'xyz' and 'yzx' (diff will be all 0s). So we sum the 
   difference for each character using reduce and return the result, which is how many characters we need to remove from a to form b.
*/

function strReductionMS(a, b) {
  let aCount = [...a].reduce((obj, c) => {
    obj[c] ? obj[c]++ : obj[c] = 1;
    return obj;
  }, {});
  
  let bCount = [...b].reduce((obj, c) => {
    obj[c] ? obj[c]++ : obj[c] = 1;
    return obj;
  }, {});
  
  let diff = [...new Set(a)].map(c => aCount[c] - (bCount[c] || 0));
  if (diff.some(n => n < 0)) {return 0;}
  return diff.reduce((acc,n) => acc + n, 0);
}

/*
Here is a shorter solution, similar to something I first attempted when trying to solve the challenge.
1) We turn the first string into an array of characters then call the reduce method on it.
2) The initial value of the accumulator is set to the second string.
3) As we iterate over a, we remove each character from b using the replace method, if that character exists in b.
4) If the return value of our reduce method is an empty string, that means every character in b is present in a in equal or greater
   amounts, therefore we simply have to subtract the length of b from the length of a to figure out how many characters we need to delete
   from a to form b. For example, 'abcdddee', 'de' will become '' and so 8 (a.length) - 2 (b.length) = 6 gives us our answer.
5) If the return value of our reduce method is not an empty string, this means there are 1 or more characters in b that are not present in
   a. If the count of any character in b is higher than it is in a, we cannot form b from a because that would require us to not only
   remove characters from a but to also add 1 or more characters to a. For example, for 'abdegfg','ffdb' there is 1 f in a but 2 fs in b,
   so we cannot form b by only deleting characters from a.
6) Therefore, if the return value of our reduce method is not an empty string, we return 0, otherwise, we return a.length - b.length. 
*/

function strReduction(a, b) {
  return [...a].reduce((acc, v)=> acc.replace(v, ''), b) ? 0 : a.length - b.length;
}