=begin
Codewars. 18/05/20. "Break the Caesar!". 5kyu. The Caesar cipher encrypts a
message by shifting each letter a certain number of places in the alphabet. For
example, applying a shift of 5 to "Hello, world!" yields "Mjqqt, btwqi!". Here
we create a method that takes an encrypted message, and then returns the most
likely shift that was used to decode it. The decoding is verified by checking
if all or most of the decoded string's words are in a set called WORDS,
provided in the kata. Here is the solution I developed to solve the challenge,
which occasionally fails 1 or 2 random tests. While my solution may not be
perfect for this kata, it still provides a perfectly good caesar decoder.
1) We define our method break_caesar_ms, which takes an encrypted message as
   its argument.
2) We sanitise the string by removing everything which isn't a letter or a
   space - thereby removing punctuation - and then we downcase the string, as
   all the words in the WORDS set are lower case.
3) We create a for loop from 0 to 25, which covers all the possible shifts.
4) In our for loop, we call gsub on the string and match each letter. If the
   ASCII value of the letter minus i (the shift) falls outside the bounds of
   of letter ASCII values, we subtract i from the ASCII value of the letter,
   then add 26 so that it loops back around to an alphabetical ASCII value.
5) For example, if a letter is "d", and the correct shift is 7, the ASCII value
   of "d" is 100 and 100 - 7 = 93, but 93 is "]". But when we add 26 to 93 we
   get 119 and the corresponding character to that ASCII value is "w", which is
   7 places back from "d" in the alphabet.
6) If the ASCII value minus the shift does not fall below the (lower cased)
   letter ASCII range, we simply do the ASCII minus the shift.
7) We are subtracting because we are decoding the cipher and hence moving
   letters back to their original position. If we were encoding, we'd be
   adding the shift to the ASCII value instead.
8) On each loop the shifted string gets stored in a variable d (for decoded),
   we return i if all the words in an array of words of d, are included in the
   set, or, if the count of d's included words in WORDS is all but one of them.
   We also check with this condition that d doesn't contain only 1 word,
   because this would make one the basic tests "DAM!" fail.
9) If all or all but one of d's words are included in WORDS, we return i
   because we assume we have uncovered the correct shift.
10) This manages to pass all the tests most of the time, but occasionally we
    get 1 random fail, or 2 random fails, probably because there are random
    cases where the decoded string has 2 words which aren't included in WORDS.
=end

def break_caesar_ms(s)
  s.gsub!(/([^a-z|\s])/i, '').downcase!
  for i in 0..25
    d = s.gsub(/([a-z])/) {$1.ord - i < 97 ? (($1.ord - i) + 26).chr : ($1.ord - i).chr}
    return i if d.split.all? {|w| WORDS.include?(w)} ||
      d.split.count {|w| WORDS.include?(w)} == d.split.size - 1 && d.split.size != 1
  end
end

=begin
Here is an improved version of my solution, which doesn't fail any random
tests because it returns the shift which produces a string containing the
highest amount of words in WORDS. This is more precise than returning the shift
which has all or all but one words in WORDS.
=end

def break_caesar(s)
  s.gsub!(/([^a-z|\s])/i, '').downcase!
  (0..25).max_by do |i|
    s.gsub(/([a-z])/) {$1.ord - i < 97 ? (($1.ord - i) + 26).chr : ($1.ord - i).chr}.split.count {|w| WORDS.include?(w)}
  end
end
