/*
Codewars. 23/08/20. 'Countdown - Longest Word'. 6kyu. Countdown is a British game show with number and word puzzles. The letters round
consists of the contestants picking 9 shuffled letters either picking from the consonant pile or the vowel pile. The contestants are given
30 seconds to come up with the longest word they can think of with the available letters. Letters cannot be used more than once in the
word they form unless there is another of the same character in the letters they chose. Given an uppercase 9 letter string called letters,
our function must find the longest word that can be formed with some or all of the letters. We are also given a preloaded array of words
called words, from which we take the longest word. If there are more than one longest word, we return all of them in alphabetical order. If
no words can be formed from the letters, we return null. Here is the solution I developed to solve the challenge.
1) We call the filter method on the preloaded words array.
2) For each word in the words, we split it into an array of characters using the spread operator, then we call the every method.
3) For each character in each word, we create a variable called lcount, which gives us how many times that character appears in the letters
   string. We also create a variable called wcount, which gives us how many times that character appears in the word.
4) For each character we return whether the count of the character in letters is greater than or equal to the count of the character in
   the word. In other words, our every method checks whether every character in the word is included in letters and also makes sure that
   the count of the character in word is not higher than the count of the character in letters.
5) Now, in an array called matches, we have all the words which can be formed with some or all of the characters in letters.
6) If there are no words in matches, no words could be formed, so we return null.
7) Now we must keep only the longest words, so we sort matches according to the length of the strings in descending order and then take the
   length of the first element. We store this in the variable maxLen.
8) We then call the filter method for a final time and keep all the words in matches whose length is equal to that of maxLen, then we sort
   the array in alphabetical order and return it.
*/

function longestWordMS(letters) {
  let matches = words.filter(word => {
    return [...word].every(c => {
      let lcount = letters.replace(RegExp(`[^${c}]`, 'g'), '').length;
      let wcount = word.replace(RegExp(`[^${c}]`, 'g'), '').length;
      return lcount >= wcount;
    });
  });

  if (!matches.length) {return null;}
  let maxLen = matches.sort((a,b) => b.length - a.length)[0].length;
  
  return matches.filter(word => word.length === maxLen).sort();
}

