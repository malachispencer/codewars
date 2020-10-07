/*
Codewars. 13/06/20. "Single Word Pig Latin". 6kyu. Pig Latin is an English language game where the goal is to hide the meaning of the word
from people not aware of the rules. If the word starts with a vowel, return the original word + 'way'. If the word starts with a consonant,
move all the consonants at the beginning of the word (up to the first vowel) to the end of the word, then add 'ay'. If the word contains
any non alphabetical characters, return null. Here is the solution I developed to solve the challenge.
1) We define our function pigLatinMS, which takes a single word string as its argument.
2) Because the new string must be all lower case, we first convert the original string to lower case.
3) We first handle the case of non-alphabetical characters being in our string. We call the test method on a regex which checks for any
   non-alphabetical characters in the string, if it returns true, we return null.
4) In a seperate if block, we call the test method on a regex which checks if the string starts with a vowel, if so, using string
   interpolation - which requires the use of backtick quotes - we return the original string plus 'way'.
5) Inside our else block, which will basically capture words that start with a consonant, we store the consonants at the beginning of the
   word in a variable called cons, which we extract using the exec method.
6) The exec method is very similar to the test method, it is called on a RegExp object and tests for a match in a string. The difference is
   that is returns the first match, whereas the test method returns true or false if a match is found. The match returned from exec is 
   packaged in an array.
7) In a variable called afterCons, we store the rest of the word after the consonants at the beginning, we use the replace method to
   remove the consonants at the beginning.
8) We then return afterCons + cons + 'ay'. For some reason even though cons is in an array, it still forms part of the string when we
   prepend afterCons and append 'ay'.
*/

function pigLatinMS(s) {
  s = s.toLowerCase();
  if (/[^a-z]/.test(s)) {
    return null;
  }
  if (/^[aeiou].*/.test(s)) {
    return `${s}way`;
  } else {
    let cons = /^[^aeiou]+/.exec(s);
    let afterCons = s.replace(/^[^aeiou]+/, '');
    return afterCons + cons + 'ay';
  }
}

/*
Here is another method, which uses shorter syntax and the search method.
1) We convert the word to lower case.
2) The search method is called on a string and it takes a regular expression, it returns the index position of the first occurrence of the
   specified search value (the regex) and returns -1 if no match is found.
3) Using the search method, first we check for strings which contain non-alphabetical characters, if so, the search method will not
   return -1, so in such cases we return null.
4) We again use the search method, this time to check for the first vowel, if it returns 0 - which means the word starts with a vowel -
   using string interpolation we return the original string + way.
5) Our only remaining case is words which start with a consonant, we simply use the replace method and in our first capture we match one
   or more consonants at the start of the string, then in capture group 2 we match the rest of the string. We simply place capture group
   2 before capture 1 then add 'ay' to the end.
*/

function pigLatin(s) {
  s = s.toLowerCase();
  if (s.search(/[^a-z]/) != -1) return null;
  if (s.search(/[aeiou]/) == 0) return `${s}way`;
  return s.replace(/^([^aeiou]+)(.*)$/, '$2$1ay');
}