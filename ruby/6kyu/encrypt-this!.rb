=begin
Codewars. 03/05/20. "Encrypt this!". 6kyu. Here we create a method that takes 
a string of words and encrypts them by replacing each first letter in a word 
with its ASCII value, then swapping the position of the second word and the 
last word. Here is the solution I developed to solve the challenge.
1) We define our method encrypt_this_ms, which takes a string of words or one
   word as its argument.
2) We split the string into an array of words, or one word.
3) We map over the the array of words/strings. If the string contains only 1
   letter, we simply turn it into its ASCII value using ord. If the string
   contains 2 letters, we turn its first letter to ASCII then leave the
   second the same. If the string has more than 2 letters, we turn the first
   to ASCII, place the last as the second, make the second the last, then
   leave everything in between second and last the same. We achieve all of this
   using string slicing and interpolation.
4) Now we have an array of strings where every first letter is its ASCII value
   and the second and last letters in each word have swapped positions. We
   simply join the array back into a string with each word separated by spaces.
=end

def encrypt_this_ms(s)
  s.split.map {|w|
    w.length == 1 ? "#{w[0].ord}" :
      w.length == 2 ? "#{w[0].ord}#{w[1]}" :
        "#{w[0].ord}#{(w[-1])}#{w[2..-2]}#{w[1]}"}.
          join(" ")
end

=begin
Here is the best solution, which uses gsub and a regex.
1) We call the gsub method on our string.
2) In our regex, \b defines a word boundary. (\w) is capture group 1, matching
   for any word character. (\w)? is capture group 2, matching for any word
   character 0 or 1 times, ? being the quantifier. (\w+?)? is capture group 3,
   +? matches between 0 and unlimited times, ? between 0 and 1 times, here we
   essentially create the group of our words between the 2nd and last letter.
   (\w)? is capture group 4, matching for any word character 0 or 1 times. \b
   defines the word boundary.
3) Now we have capture groups which encapsulate the first letter (1), the
   second letter (2), the last letter (4) and the letters in between second and
   last (3). Using string a block for gsub and string interpolation, we place
   our capture groups - $1, $2, $3, $4 - in the required places.
4) We convert the first letter into its ASCII value, all our other capture
   groups can be matched 0 times, which means if the word has only 1 character,
   that word is solely an ASCII value.
5) If only 2 characters exist in the word, capture group 3 and 4 will not be
   matched and thus capture group 2 will be to the right of capture group 1.
6) If only 3 characters exist, the third character will be capture group 3 and
   so that will be placed after 1 and before 2.
7) If more than 3 exist, the last character $4 is swapped with the second $2
   and $3 is the 0 to unlimited characters between them.
=end

def encrypt_this(s)
  s.gsub(/\b(\w)(\w)?(\w+?)?(\w)?\b/) {"#{$1.ord}#{$4}#{$3}#{$2}"}
end

=begin
Here is an alternative regex which does the same thing.
1) \b asserts position at word boundary, we do not put one at the end of this
    regex otherwise it won't work.
2) (\w) is capture group 1, matching any single word character, this matches
   the first character.
3) ((\w)(\w*)(\w))? is capture group 3, matched 0 or 1 times (allowing for
    words which have only 1 character). It matches 0 and 1 times the
    encapsulated capture groups.
4) (\w) is capture group 3, the second character in a word.
5) (\w*) is capture group 4, any character matched between 0 and unlimited
   times with the * quantifier.
6) (\w) is capture group 4, the last character in the word.
7) In the gsub block, the first character $1 is converted to its ASCII value,
   and then the component capture groups of capture group 2 are used to swap
   the second and last character.
=end

def encrypt_this_x(s)
  s.gsub(/\b(\w)((\w)(\w*)(\w))?/) {"#{$1.ord}#{$5}#{$4}#{$3}"}
end

=begin
Here is a final solution, which uses no regular expressions.
1) We split our string into an array of words/strings then we map over them.
2) Inside our map block, we swap the second and last characters of the word, if
   the size of the word is above 2 letters.
3) For every word in the array, we convert its first letter to its ASCII value
   then turn this into a string, otherwise we get a "no implicit conversion of
   integer into string" error.
4) We then return every word, with the alterations we've just made to them.
5) Now we have an array of encrypted strings, we join it back into a string
   with each word separated by a space.
=end

def encrypt_this_z(s)
  s.split.map {|w|
    w[1], w[-1] = w[-1], w[1] if w.length > 2
      w[0] = w[0].ord.to_s
        w}.join(" ")
end
