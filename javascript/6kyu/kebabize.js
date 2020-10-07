/*
Codewars. 12/06/20. 'Kebabize'. 6kyu. Here we create a function that converts a string from camelCase into kebab case. For example,
'camelsHave3Humps' should return 'camels-have-humps'. Here is the solution I developed to solve the challenge.
1) We define our function kebabizeMS, which takes a camelCase string as its argument. This string can contain numbers and sometimes even a
   capital letter at the front.
2) We call the replace method on the string and in our regex we pattern match the space before a capital letter (?=[A-Z]) and we make our 
   match global using the g modifier. We place a dash before each capital letter in the string. Notice here we don't use -\1 like we would
   have in Ruby.
3) We call the place method again, this time matching all digits in the string /\d/g and removing them.
4) We call the replace method one more time, removing any dash at the start of the string /^-/.
5) Finally, we convert the entire string to lower case.
6) We return our kebab cased string.
*/

function kebabizeMS(s) {
  return s.replace(/(?=[A-Z])/g, "-").replace(/\d/g, "").replace(/^-/, "").toLowerCase();
}

/*
Here is another solution, inspired by that of another Codewars user.
1) We first use the replace method to remove all the digits from the string.
2) As we can see, the split method in JavaScript can also take a regex, just as it can in Ruby. So we call the split method to convert the 
   string into an array, delimited at the space before every capital letter.
3) We then join the array back into a string, delimited with a dash, this avoids placing a dash at the start of the string if the first
   letter is capital.
4) We convert the the entire string to lower case.
5) We return the newly kebab cased string.
*/

function kebabize(s) {
  return s.replace(/\d/g, '').split(/(?=[A-Z])/).join('-').toLowerCase();
}

/*
Here is one more solution.
1) We use the replace method to remove all digits.
2) We call the replace method again to place in our dashes. This time, in our regex we match any character, which precedes a capital letter
   and we place the dash after that character. This avoids placing a dash at the front of the string if the first letter is capital.
3) In Ruby, we would do an in-quote substitution with \1 representing capture group 1, but in JavaScript we do in-quote substitutions with
   $1.
4) We don't need to call replace again, but to see another form of syntax, we match all capital letters in the string. Then in our
   substitution argument we create a "block variable" and convert each c (for matched character) to lower case.
5) We return our kebab cased string.
*/

function kebabize(s) {
  return s.replace(/\d/g, '').replace(/(.)(?=[A-Z])/g, '$1-').replace(/[A-Z]/g, c => c.toLowerCase());
}