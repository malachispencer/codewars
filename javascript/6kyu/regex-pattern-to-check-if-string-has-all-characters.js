/*
Codewars. 03/07/20. 'regex pattern to check if string has all characters'. 6kyu. Here we create a function that takes two strings and checks
whether the second string contains all the characters in the first string, using a regular expression. The original kata had only one
string - the string whose characters will be in our regex - but I have adapted the function to make it more coherent. Here is the solution
I developed to solve the challenge.
1) We define our function strHasAllMS, which takes a string for the regular expression, and a string to check contains all characters in
   the string for the regular expression.
2) We call the split method on strForRegex and convert it into an array of characters, then we map over the array of characters. For each
   character, we make it part of an imitation of a lookahead group, which will end up in our regex. The lookahead group checks for 0 or more 
   characters which are not the character, followed by the character. Now each character from strForRegex is wrapped in this lookahead group, 
   we join the array back into a string.
3) We then create a regular expression object using a constructor and place in strForRegex, with a beginning of string assertion at the
   start of the regex.
4) Now our regex, for each character in strForRegex, will lookahead from the beginning of the string to see whether we have 0 or more not
   characters, followed by that character. Use of lookaheads prevents captures, so for each character we are always checking from the
   beginning of the string. So if strToCheck contains all characters from strForRegex, the test method will return true.
*/

function strHasAllMS(strForRegex,strToCheck) {
  strForRegex = strForRegex.split('').map(c => `(?=[^${c}]*${c})`).join('');
  return new RegExp(`^${strForRegex}`).test(strToCheck);
}

/*
Here is another solution, which uses the replace method instead of split and map.
1) We call the replace() method on strForRegex and match every individual character. For each character, we place it inside an imitation
   of a lookahead group which checks for 0 or more characters followed by the matched character ($&). Using string interpolation, we place
   this inside a regular expression object.
2) We call the test method on this regex object and check strToCheck contains all the characters in strForRegex.
*/

function strHasAll(strForRegex, strToCheck) {
  return new RegExp(`^${strForRegex.replace(/./g, '(?=.*$&)')}`).test(strToCheck);
}