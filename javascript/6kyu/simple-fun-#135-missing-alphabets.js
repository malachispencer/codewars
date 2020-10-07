/*
Codewars. 01/09/20. 'Simple Fun #135: Missing Alphabets'. 6kyu. We are given a string containing only 1 or more (possibly incomplete) 
alphabets and our function must return all the missing letters. For example, 'abcdefghijklmnopqrstuvwxy' should return 'z' and
'abbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxy' should return 'ayzz'. Here is the solution I developed to solve the challenge.
1) We create a constant string which stores all letters of the alphabet.
2) The first thing we do inside our function is initialize an object called count where we will store the count of each letter in the
   alphabet of our string.
3) We use the spread operator to convert our alphabet constant into an array of characters then call forEach on it. We set the value of
   our count object equal to the count of that character in the input string. We find the count by calling replace on s, removing all
   characters apart from the current character and then taking the length of the remaining characters.
4) To build our count object we also could have used the reduce method.
5) Now we find the maxCount by calling Math.max and passing in the values of count.
6) We initialize a variable called missing, where we will store the missing letters.
7) We iterate over the object properties using a for-in loop and for each letter, we concatenate that letter to missing the difference
   between maxCount and its count in the string amount of times. So for example, if maxCount is 2 and the count of 'z' in the string is 0,
   'zz' will be added to missing. If maxCount is 3 and the count of 'a' in the string is 3, nothing will be added to missing.
8) We return missing.
*/

const alpha = 'abcdefghijklmnopqrstuvwxyz'

function missingLettersMS(s) {
  let count = {};
  [...alpha].forEach(l => count[l] = s.replace(RegExp(`[^${l}]`, 'g'), '').length);
  let maxCount = Math.max(...Object.values(count));
  let missing = '';
  
  for (l in count) {
    missing += l.repeat(maxCount - count[l]);
  }
  return missing;
}