/*
Codewars. 18/08/20. 'Missing Alphabet'. 6kyu. Here we create a function that takes a lowercase string and after each first occurrence of a
letter in that string, inserts all the letters of the alphabet which come after that letter and are not included in the original string.
Here is the solution I developed to solve the challenge.
1) First we create a constant called alpha for alphabet, where we store all letters of the alphabet, lowercased.
2) We then define our function insertMissingLettersMS, which takes a lowercase string as its argument.
3) We create a variable called res, where we will store our result, or new string.
4) We create a for loop which will iterate over each character in our input string.
5) Inside our for loop, we create an if conditional where we essentially isolate each first occurrence of a letter by checking if i is
   equal to the indexOf the current character, the indexOf method returns the first occurrence of the given character.
6) Thus if the current character is the first occurrence of that character in the string, we create a variable called missing, which holds
   all letters in alpha that come after the current character.
7) Using the replace method, we remove all letters from missing which are included in the original string.
8) We then add the current character + missing uppercased, to res.
9) If the current character in the for loop is not the first occurrence of that character, we simply add only that character to res.
9) We return res.
*/

const alpha = "abcdefghijklmnopqrstuvwxyz"

function insertMissingLettersMS(str) {
  let res = '';
  for (let i = 0; i < str.length; i++) {
    if (i === str.indexOf(str[i])) {
      let missing = alpha.slice(alpha.indexOf(str[i]) + 1);
      missing = missing.replace(RegExp(`[${str}]`, 'g'), '');
      res += str[i] + missing.toUpperCase();
    } else {
      res += str[i];
    }
  }
  return res;
}

/*
Here is another solution, submitted by a Codewars user.
1) Here we also use the alpha constant.
2) First we split the string into an array of characters, then map over it and include each character and each index position in our
   callback function.
3) If the current character in the array of characters is not the first occurrence of that character, we simply leave it the same.
4) Otherwise, we turn the alphabet string into an array of characters then call the filter method on it, we keep only the letters
   which are not included in the string and who come after the current character in the alphabet, we do the letter by checking if the
   ASCII value of the alphabet letter is greater than the ASCII value of the current character.
5) After we have got all our missing letters according to our rule criteria, we join the array of characters back into a string,
   uppercase the string and then concatenate this string to the end of the current character.
6) After our mapping has completed, we join the array of characters back into a string and return this string.
*/

function insertMissingLetters(str) {
  return [...str].map((c,i) => {
    return i != str.indexOf(c) ? c : 
      c + [...alpha].filter(l => !str.includes(l) && l.charCodeAt(0) > c.charCodeAt(0)).join('').toUpperCase();
  }).join('');
}

