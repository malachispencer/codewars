/*
Codewars. 03/09/20. 'Longest palindrome'. 6kyu. Here we create a function which takes a string and returns the longest possible palindrome
that could be formed from any substring of the string. For example, 'aabbcc_yYx_' should return 9 because the longest possible palindrome
would be 'abcyxycba'. Only alphanumeric characters will contain in a valid palindrome and strings should be treated case-insensitive. Here
is the solution I developed to solve the challenge.
1) We first downcase the string using the toLowerCase() method, then we remove all punctuation using the replace method and convert the
   string to an array of characters using the spread operator.
2) We then call the reduce method on the array of characters and create a counter object for the characters in the string. We store this in
   counts.
3) Now we create an array of the character counts using the Object.values() method and store this in countArr.
4) To find the length of the longest palindrome, we need to extract as many pairs as possible from each count, then if any any characters
   are remaining after this - they will all be 1 or 0 - we add the max remaining value.
5) That being said, we call reduce on countArr and if the current count is an even number, we increment the accumulator by the count and
   decrement its value in countArr by itself, basically making it 0. In our callback we decrement countArr[i] first then increment the
   accumulator, this is fine because changes are not actually made to the array until after the iteration.
6) If the current count is an even number, we increment the counter by its value - 1 and decrement its value in countArr by v - 1. For
   example, if v is 5, we can take 2 pairs from this which is 4 characters, so we increment acc by 4 and then subtract 4 from countArr[i],
   which makes it 1. If v is 1, acc will be incremented by 0 and likewise countArr[i] will be decremented by o and this is what we want
   because we will handle potentially adding a 1 after.
7) We store the result of reduce in len.
8) If our string had all even counts, countArr will now be all 0s. If our string had odd numbers, it will have 1s and 0s if it also had
   evens. Thus we add the max of the remaining counts to len and this is the length of the longest possible palindrome.
*/

function longestPalindromeMS(str) {
  let counts = [...str.toLowerCase().replace(/[^a-z0-9]/g, '')].reduce((obj,c) => {
    obj[c] ? obj[c]++ : obj[c] = 1;
    return obj;
  }, {});
  
  let countArr = Object.values(counts);
  let len = countArr.reduce((acc,v,i) => {
    if (v % 2 == 0) {
      countArr[i] -= v;
      return acc + v;
    } else {
      countArr[i] -= v - 1;
      return acc + v - 1;
    }
  }, 0);
  
  return len + Math.max(...countArr);
}

/*
Here is another solution I developed, inspired by the solution of another Codewars user.
1) We convert our string to lower case, remove all punctuation, convert it to an array of characters, sort it, and then join it back into
   a string. We store this in an updated str variable.
2) Using the match method, we then generate a string array of all the pairs (i.e. adjacent duplicates) in our sanitized and sorted string.
   We store this in variable called pairs.
3) Now we want to find out how many characters there are in the string when we remove all the pairs, so we call reduce on a pairs array
   of characters. The initial value of our accumulator is the string, then for each character in pairs, we remove that character from the
   accumulator/string using replace. We then take the length of the result and store this in strMinusPairs.
4) If there are any characters left it the string after all pairs have been removed, we add 1 to pairs.length, if the string is empty
   after all pairs have been removed, we add 0 to pairs.length. This gives us the longest possible palindrome.
*/

function longestPalindrome(str) {
  str = [...str.toLowerCase().replace(/[^a-z0-9]/g, '')].sort().join('');
  let pairs = (str.match(/(.)\1/g) || []).join('');
  let strMinusPairs = [...pairs].reduce((acc,v) => acc.replace(v, ''), str).length;
  return pairs.length + (strMinusPairs ? 1 : 0);
}