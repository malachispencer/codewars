=begin
Codewars. 02/05/20. 'Backspaces in string'. 6kyu. Assume "#" is like a backspace 
in a string. This means that string "a#bcd##e" is actually "be". Here we create 
a program that processes a string in such a manner. Here is the solution I developed 
to solve the challenge.
1) We define our method clean_string_ms, which takes a string as an argument.
2) In our regex, capture group 1 ([^#]) is any character other the hash
   symbol, capture group 2 ([#]) is the hash symbol. Essentially, we pattern
   match for any character other than "#", followed by a "#" and we remove
   them - within our while loop - so long as such a pattern if found in the
   string.
3) After our regex, we may still have a string with a "#" at the beginning of
   it, so we delete any leading hash symbols from the string.
=end

def clean_string_ms(str)
  while str.gsub! /([^#])([#])/, '' ; end ; str.delete("#")
end

=begin
Here is another solution, submitted by a Codewars user.
1) We convert the string to an array of characters.
2) We call the reduce method with an empty string initialized as its memo.
3) As we iterate over the array of characters, if we encounter a hash symbol,
   we remove the last character in the new string, by doing this we do not
   add any hashes to the new string and we remove any characters which
   preceded the hash.
4) The chop method removes the last character from a string.
5) If the character we encounter is not a hash, we add it to the new string.
=end

def clean_string(str)
  str.chars.reduce("") {|r, c| c == "#" ? r.chop : r << c}
end

=begin
Here is another solution, submitted by Jesus Castello.
1) We convert our string to an array of characters.
2) We call each_with_object and initialize a new array.
3) We iterate over the array of characters and if we encounter a hash symbol,
   we delete the last element from the array using pop, this ensures that the
   character preceding the hash is deleted, and the hash is not added. If hash
   is the first character in the string, nothing is added or deleted.
4) If we don't encounter a hash symbol, we add that character to the array.
5) Once our new array is finalised with no hash symbols or the characters
   preceding them, we join it back into a string.
=end

def clean_string_x(str)
  str.chars.each_with_object([]) {|c, r| c == "#" ? r.pop : r << c}.join
end
