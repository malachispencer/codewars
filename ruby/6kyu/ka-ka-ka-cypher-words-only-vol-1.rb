=begin
Codewars. 22/05/20. 'Ka Ka Ka cypher - words only vol 1'. 6kyu. Here we create 
a cypher that places "ka" at the beginning of a word, then places "ka" after 
every set of vowels apart from a vowel at the end of the word. Here is the 
solution I developed to solve the challenge.
1) We define our method kacokadekame_ms, which takes a string word as its
   argument.
2) We call gsub on the string and our regex matches a vowel ([aeiou]) followed
   by any character that is not a vowel ([^aeiou]). This regex ensures that
   "ka" is placed only after 1 or more vowels followed by a non-vowel
   character and never in between consecutive vowels. "ka" is never placed
   after 1 or more vowels at the end of the string.
3) '\1ka\2' places "ka" in between every occurrence of capture group 1 and
   capture group 2.
4) We add "ka" to the start of the string.
5) Our string is now ka encoded.
=end

def kacokadekame_ms(w)
  "ka" + w.gsub(/([aeiou])([^aeiou])/i, '\1ka\2')
end
