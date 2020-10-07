/*
Codewars. 11/06/20. 'Adjacent repeated words in a string'. 6kyu. Here we create a function that returns the count of adjacent 
(i.e. consecutive) repeated words in a string. Here is the solution I developed to solve the challenge. This is the first 6kyu challenge
I've solved in JavaScript.
1) We define our method countAdjacentRepeatedMS, which takes a string of words as its argument.
2) In JavaScript, the match method is the equivalent of the scan method in Ruby, it's called on a string and takes a regular expression,
   returning an array of all matches when the g pattern modifier is used, or the first match if it is not used.
3) We call the match method on our string. In our regex, capture group 1 \b(\w+)\b is enclosed in word boundaries and matches 1 or more
   word characters; capture group 2 (\s\b\1\b)+ comes immediately after capture group 1 and it matches a space, followed by the same
   word from capture group one. Capture group 2 is matched 1 or more times, which means we generate an array of all consecutive duplicate
   words as string elements.
4) If there are no matches, the match method returns null, so using the ternary operator we check if r (where we stored our matches) is null,
   if so, we return 0, otherwise, we return the length of the array.
*/

function countAdjacentRepeatedMS(s) {
  let r = s.match(/\b(\w+)\b(\s\b\1\b)+/ig);
  return r == null ? 0 : r.length;
 }

 /*
 Here is an even shorter solution which uses my regex. Here we call the match method on the string and generate array of strings of all the
 consecutive duplicates, and we return the length is this array if it contains elements, or the length of an empty array, if our match
 amounts to null.
 */

function countAdjacentPairs(s) {
  return (s.match(/\b(\w+)\b(\s\b\1\b)+/ig)||[]).length
}

/*
Here is a very clever solution that uses a for loop.
1) We first convert the entire string to lower case so we can make our duplicates case insensitive. We then split the string at every
   space into an array of words. We store this in an updated s variable.
2) We then initialize an empty array called uniqDups, where we will store 1 of any set of adjacent duplicates.
3) We create a for loop which will traverse the entire array of words.
4) If we have 2 repeated, and then the word after those 2 repeated is NOT the same as the repeated, we add the repeated word to the
   uniqDups array.
5) This is clever because it means no matter how many consecutive duplicates there are, we will only ever add 1 of that set. For example, 
   if we have ["apple", "apple", "apple", "apple", "orange"], we will add the 3rd apple to uniqDups. If we have ["ruby", "ruby", "ruby",
   "javascript"], we will add the 2nd ruby to uniqDups. If we have ["backend", "backend", "frontend"], we will add the 2nd backend to
    uniqDups.
6) Once we've got all our uniq duplicates in an array, we return the length of this array.
*/

function countAdjacentPairsX(s) {
  s = s.toLowerCase().split(' ');
  let uniqDups = []; 
  for (let i = 0; i < s.length; i++){
    if (s[i] == s[i+1] && s[i+1] != s[i+2]) {
      uniqDups.push(s[i]);
    }
  }
  return uniqDups.length;
}