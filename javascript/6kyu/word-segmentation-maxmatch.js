/*
Codewars. 21/08/20. 'Word Segmentation: MaxMatch'. 6kyu. We are provided with a set containing 500 valid words and a function input of a
sentence with no spaces. We must create a function which starts at the first character of the string and finds the longest valid word, if
a valid word is found, we remove that word from the sentence and perform the search again, if no valid word is found, the first character
of the sentence in its current form will be considered the valid word. We must return all valid words in an array. Here is the solution I
developed to solve the challenge.
1) First we initialize an empty array called words, where we will store all the valid words found in our sentence string.
2) We then create a while loop which runs as long as sentence is greater than 0 in length. We will run a for loop inside this while loop and
   after every for loop we will delete a certain amount of characters from sentence, until sentence is empty.
3) Inside our while loop and before our for loop, we initialize an empty array called matched, where we will store all the words found on
   the current run of the for loop.
4) Now we create our for loop, which wll traverse sentence.
5) Inside our for loop, we slice sentence from 0 up to and including i and store this in a variable called word. So for example, if our
   initial input is 'start', word on each iteration will be 's', 'st', 'sta', 'star', 'start'.
6) Now using the has() instance method for a set, we check if the current word is included in the VALID_WORDS set, if so, we push it into
   the matched array.
7) Once our for loop finishes, if matched is not empty, we have found 1 or more valid words. Because we need to take the longest word, we 
   take the last element from matched and store this in a variable called maxMatch. The last word in matched will always be the longest
   because on each iteration of the for loop word gets bigger.
8) We then push maxMatch into our words array and then delete maxMatch from sentence using the slice method. A word will always be deleted
   from the front of the string because that is where we always start our search.
9) If matched is empty after our for loop, we push the first character of sentence in its current form into our words array and then
   remove that first character from sentence.
10) Our while loop will trigger the for loop again because sentence is not yet empty, matched will be an empty array again, and this process
    will continue until sentence is empty.
11) Once our while loop finishes, we return our words array.
*/

function maxMatchMS(sentence) {
  let words = [];
  while (sentence.length > 0) {
    let matched = [];
    for (let i = 0; i < sentence.length; i++) {
      let word = sentence.slice(0, i+1);
      if (VALID_WORDS.has(word)) {matched.push(word);}
    }
    if (matched.length > 0) {
      let maxMatch = matched[matched.length - 1];
      words.push(maxMatch);
      sentence = sentence.slice(maxMatch.length);
    } else {
      words.push(sentence[0]);
      sentence = sentence.slice(1);
    }
  }
  return words;
}