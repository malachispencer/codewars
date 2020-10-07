/*
Codewars. 29/06/20. 'Replace Noun Phrases with Pronouns'. 6kyu. A noun phrase is a phrase that can be replaced by a pronoun 
(e.g. he, she, it). 'a girl ate the cookie' can be turned into 'she ate it' because 'a girl' and 'the cookie' are noun phrases. In this 
kata, a noun phrase consists of an auxillary (e.g. the, a), followed by 0 or more adjectives (e.g. big, tall, scary), followed by a noun 
(e.g. girl, cookie). We are given a sentence which in most cases will contain one or more noun phrases - in some cases it will not contain
any noun phrases - and we must replace those noun phrases with the pronouns provided in the pronouns array. There is also a dictionary
object which contains key-value pairs of words and their type i.e. aux, adj or N. Here is the solution I developed to solve the challenge.
1) We define our function replaceNounPhrasesMS, which takes a sentence string, a pronoun array and a dictionary object as its arguments.
2) We first call the replace method on the sentence and match each word in the sentence with our regex. For each word, if it's included in
   our dictionary - meaning the word is either an auxillary, adjective or noun - we tag the word type onto it with a dash before the word
   type. If it's not included in the dictionary, we leave it the same. We store this in a variable composition.
3) We now go about replacing our noun phrases. We call the replace method on composition and inside a capture group - which is actually the
   1st of several capture groups - we match 1 or more word characters followed by auxillary tag and a space, followed by 0 or more of
   1 or more word characters followed by adjective tag and a space, followed by 1 or more word characters followed by noun tag. Everywhere
   such a sequence - in other words a noun phrase - is found, we replace that noun phrase with the first element from pronouns using the
   shift() method. This replaces the noun phrases in order of the pronouns in the pronouns array.
4) For all test types - e.g. single word tests, two word non-noun phrases, three word non-noun phrases and sentences which included noun
   phrases and words which weren't part of a noun phrase - we will now have tags on auxillaries, adjectives and nouns which weren't part of
   a noun phrase, so we must remove them.
5) We call replace on sentence and remove the tags from our sentences.
6) Now we have the final sentence with noun phrases replaced, we return it.
*/

function replaceNounPhrasesMS(sentence, pronouns, dict) {
  let composition = sentence.replace(/\b(\w+)\b/g, w => dict[w] ? `${w}-${dict[w]}` : w);
  sentence = composition.replace(/((\w+-aux )(\w+-adj )*(\w+-N))/g, np => pronouns.shift());
  return sentence.replace(/(\w+)(-\w+)/g, '$1');
}

/*
Here is another solution which builds a regular expression object out of all the auxillaries, adjectives and noun's in the dictionary.
1) Using the Object.entries() method, we create an array of arrays where each sub-array holds the key-value pairs from the dictionary.
   The key becomes the first element in the sub-array and the value becomes the second element in the sub-array. We then call the filter
   method on this array and keep the sub-arrays whose second element is 'aux'. We then map over the sub-arrays and keep only the first
   elements i.e. the auxillary words. We then join the array of auxillary words delimited by a vertical bar. We have essentially built
   a string which can be placed inside a regular expression to say ''a' or 'the' or 'an' or 'those''.
2) We do the same for the adjectives and nouns. Remember, the dictionary contains the auxillary, adjectives and nouns in the given
   sentence, so we can know the sentence composition.
3) We build our regular expression object using a constructor so we can place our aux, adj and noun strings into the regex with string
   interpolation. In our regex, we match an auxillary, followed by a space, followed by 0 or more of an adjective followed by a space,
   followed by a noun. We use the global pattern modifier to match all occurrences instead of just the first.
4) We call the replace method on our sentence, place in our noun phrase regex as our search value and then create a noun phrase block
   variable, and for each noun phrase we replace it with the first element from pronouns using the shift(). The shift() removes the first
   element from the array it's called on and returns that element.
5) Our sentence now has all noun phrases replaced, so we return it.
*/

function replaceNounPhrases(sentence, pronouns, dict) {
  let aux = Object.entries(dict).filter(kv => kv[1] === 'aux').map(kv => kv[0]).join('|');
  let adj = Object.entries(dict).filter(kv => kv[1] === 'adj').map(kv => kv[0]).join('|');
  let noun = Object.entries(dict).filter(kv => kv[1] === 'N').map(kv => kv[0]).join('|');
  let regex = new RegExp(`(${aux}) ((${adj}) )*(${noun})`, 'g');
  return sentence.replace(regex, np => pronouns.shift());
}

/*
Here is a clever iterative solution which uses no regular expressions.
1) We create a variable called lastAux, which will keep track of the last auxillary in the sentence, we initialize it to -1.
2) We split the sentence at its spaces into an array of words and store this in an updated sentence variable called sent.
3) We create a for loop which runs the length of the sentence i.e. array of words.
4) If the current word is not in the dictionary, it is not part of a noun phrase, for example it could be a verb, so we reset lastAux to
   -1 regardless of its value prior.
5) Otherwsie, if the current word is an auxillary, we set lastAux to the index position of that auxillary.
6) Otherwise, if the current word is a noun - a noun phrase always ends with a single noun - and lastAux is not -1, we have found a noun
   phrase. This is because from lastAux to the noun, there have only been adjectives in between.
7) At this point, we convert the noun to the first pronoun in the pronouns array using shift().
8) We then remove all elements from lastAux up to but not including the current word using splice, which is now a pronoun. The first
   paramater in splice is where we start removing objects, the second is how many objects we wish to remove.
9) Because now the length of sent has been changed by splice, we now have to recalibrate the value of i, we set it equal to the index
   position of lastAux.
10) We reset lastAux to -1 and the traversing of the sentence continues from after the word that has just been changed to a pronoun.
11) Once we've iterated the sentence and replaced all noun phrases with pronouns, we join the array of words back into a string seperated
    by spaces.
*/

/*
Example 1: 'a big tall scary girl ate the big cookie' // 'she ate it'
1) sentence array = ['a', 'big', 'tall', 'scary', 'girl', 'ate', 'the', 'big', 'cookie'].
2) i = 0. Current word = 'a'. lastAux = 0.
3) i = 1. Current word = 'big'. dict[sent[i]] !== undefined. lastAux = 0.
4) i = 2. Current word = 'tall'. lastAux = 0.
5) i = 3. Current word = 'scary'. lastAux = 0.
6) i = 4. Current word = 'girl'. It's a noun and lastAux is not - 1. sent[i] = 'she'. sent.splice(0, 4 - 0). sent = ['she', 'ate', 'the',
   'big', 'cookie']. i = 0 = 'she'. lastAux = -1.
7) i = 1. Current word = 'ate'. dict[sent[i]] is equal to undefined. lastAux = -1.
8) i = 2. Current word = 'the'. lastAux = 2.
9) i = 3. Current word = 'big'. lastAux = 2.
10) i = 4. Current word = 'cookie'. It's a noun and lastAux is not -1. sent[i] = 'it'. sent.splice(2, 4 - 2). sent = ['she', 'ate', 'it']
    because 'the' (2) and 'big' (3) are deleted. i = 2 = 'it'. lastAux = -1.
11) i is no longer less than the length of sent (which is 3) so loop finishes. sent is joined returning 'she ate it'.
*/

/*
Example 2: 'the angry elephant trampled an unhappy girl' // 'she trampled her'
1) sentence array = ['the', 'angry', 'elephant', 'trampled', 'an', 'unhappy', 'girl'].
2) i = 0. Current word = 'the'. lastAux = 0.
3) i = 1. Current word = 'angry'. It's an adjective. lastAux = 0.
4) i = 2. Current word = 'elephant'. It's a noun and lastAux is not -1. sent[i] = 'she'. sent.splice(0, 2 - 0). sent = ['she', 'trampled',
   'an', 'unhappy', 'girl'] because 'the' (0) and 'angry' (1) are deleted. i = 0 = 'she'. lastAux = -1.
5) i = 1. Current word = 'trampled'. It's a verb, it's undefined in the dictionary. lastAux = -1.
6) i = 2. Current word = 'an'. lastAux = 2.
7) i = 3. Current word = 'unhappy'. It's an adjective. lastAux = 2.
8) i = 4. Current word = 'girl'. It's a noun and lastAux is not -1. sent[i] = her. sent.splice(2, 4 - 2). sent = ['she', 'trampled', 'her']
   because 'an' (2) and 'unhappy' (3) are deleted. i = 2 = 'her'. lastAux = -1.
9) i is no longer less than the length of sent (which is 3) so the for loop finishes. sent is joined returning 'she trampled her'.
*/

function replaceNounPhrasesX(sent, pronouns, dict) {
  let lastAux = -1;
  sent = sent.split(' ');
  for (let i = 0; i < sent.length; i++) {
    if (dict[sent[i]] === undefined) {
      lastAux = -1;
    } else if (dict[sent[i]] === 'aux') {
      lastAux = i;
    } else if (dict[sent[i]] === 'N' && lastAux !== -1) {
      sent[i] = pronouns.shift();
      sent.splice(lastAux, i - lastAux);
      i = lastAux;
      lastAux = -1;
    }
  }
  return sent.join(' ');
}