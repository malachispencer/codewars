/*
Codewars. 30/06/20. 'Compound Nouns, Common Nouns, and Adjectives Test'. 6kyu. We are given a word as a parameter of our function, an array
of adjectives and an array of nouns. Our function must return what type of word the given word is. The three types we are checking for are
compound nouns, common nouns and adjectives. A compound noun is comprised of a noun + a noun or an adjective + a noun. A common noun is
simply included in the nouns array, likewise, an adjective is simply included in the adjectives array. If the word is neither a noun nor an
adjective, we return neither. Here is the solution I developed to solve the challenge.
1) We define our function wordTypesMS, which takes a word as its argument.
2) Because we are going to use a regular expression, we join all the nouns delimited by a vertical bar/pipe, we store this in a variable
   called noun. We do the same with all the adjectives and store this in a variable adj.
3) We create a regex object called compoundRegex, which will match compound nouns. In the regex, which we build with a constructor so we
   can use string interpolation, we match 2 nouns which run from the start to the end of the string. We place in a or operator, and we match
   an adjective + a noun, which run from the start to the end of the string.
4) We create a regex object to match common nouns, and we create a regex object to match adjectives.
5) Using the test method, which returns true if a regex produces a match with our word, we return 'compound' if the string returns true
   with our compound regex.
6) We then check if the word produces a match with our common noun regex, returning 'common' if so.
7) We then check if the word produces a match with our adjective regex, returning 'adjective' is so.
8) If word hasn't passed any of these tests, we return 'neither'.
*/

const adjectives = ['quirky', 'funny', 'fast', 'low', 'blue', 'super', 'brown', 'maroon', 'lucky', 'green', 'purple', 
                    'cute', 'pretty', 'dark', 'quick', 'red', 'chocolate', 'fiery', 'bright', 'useful'];

const nouns = ['house', 'hose', 'fire', 'tooth', 'sand', 'brow', 'eye', 'optics', 'fiber', 'room', 
               'tub', 'mush', 'cat', 'man', 'girl', 'woman', 'wonder', 'boy', 'hood', 'neighbor'];             

function wordTypeMS(word) {
  let noun = nouns.join('|');
  let adj = adjectives.join('|');
  let compoundRegex = new RegExp(`^(${noun})(${noun})$|^(${adj})(${noun})$`);
  let commonRegex = new RegExp(`^(${noun})$`);
  let adjectiveRegex = new RegExp(`^(${adj})$`);
  if (compoundRegex.test(word)) {return 'compound';}
  if (commonRegex.test(word)) {return 'common';}
  if (adjectiveRegex.test(word)) {return 'adjective';}
  return 'neither';
}

/*
Here is a non-regex solution.
1) We first create an empty object called compoundDict, which will act as a dictionary of all the possible compound words.
2) We iterate over nouns, then for each noun, we iterate over nouns again and iterate over adjectives, then we build the dictionary of
   compound words by concatenating noun + noun and adjective + noun as keys and making their values 'compound'.
3) Inside our function, we check if the nouns array includes the word, if so, we return 'common'.
4) We then check if the word is included in our adjectives array, if so, we return 'adjective'.
5) Now all we have are compound words and 'neither' cases, so we return the value of the word's key in the dictionary, if that word
   exists in the dictionary, if it doesn't exist in the dictionary it will return undefined, so we use an or operator to handle that case,
   in which we'll return 'neither'.
*/

const compoundDict = {};
nouns.forEach(n => {
  nouns.forEach(n2 => dict[n + n2] = 'compound');
  adjectives.forEach(a => dict[a + n] = 'compound');
});

function wordType(word) {
  if (nouns.includes(word)) {return 'common';}
  if (adjectives.includes(word)) {return 'adjective';}
  return compoundDict[word] || 'neither';
}