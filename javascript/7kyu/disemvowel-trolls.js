/*
Codewars. 09/06/20. 'Disemvowel Trolls'. 7kyu. Here we create a function that removes every vowel from a string. Here is the solution I
developed to solve the challenge.
1) In JavaScript, we define a function with the function keyword, followed by the function name, followed by a bracket with or without
   arguments, followed by an opening curly brace. A closing curly brace asserts the end of the function.
2) Inside our function, we call the replace method on the string. The replace method can take a string argument or it can take a regular
   expression. It returns a new string with the "to be replaced" argument converted to the "replace to" argument. It is similar to the
   sub and gsub method's in Ruby.
3) We pass a regular expression into our 'to be replaced' argument and match every vowel in the string. Using the i pattern modifier we
   make our match case-insensitive, using the g pattern modifier we make our match global meaning we match all instances of lower or upper
   case vowels. Without the g pattern modifer, replace would only subtitute the first vowel.
4) Our 'replace to' argument is an empty string '', which means every vowel will essentially be deleted from the string.
5) In JavaScript, it is not necessary, but it is convention - and so important - to end every line with a semi-colon.
6) One way - the key way for VS Code - to print to the console is to use console.log(), the parentheses are necessary.
*/

function disemvowel(s) {
  return s.replace(/[aeiou]/ig, '');
}