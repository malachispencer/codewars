=begin
Codewars. 27/04/20. 'Replace With Alphabet Position'. 6kyu. Here we create a 
method that replaces every letter in a string with its position in the alphabet. 
Here is the solution I used to solve the challenge.
1) We define our method alphabet_position_ms, with takes one argument, a
   sentence in a string.
2) First we create an index hash, where every key is a letter in the alphabet
   and each value is its position in the alphabet.
3) We do this by creating a range from "a" to "z" then mapping over it - with
   index - and turning it into an array of arrays where each contained array
   holds a letter and its index position + 1, which in reality is the letter
   and its position in the alphabet e.g. ["a", 1]... ["z", 26]. We use to_h to
   convert this to a hash.
4) We use delete(" ") to remove all spaces between words in our string.
5) We downcase our string so that each letter can match the hash letters.
6) We use chars to convert our string to an array of characters.
7) Then we map over our array of characters and convert each letter to its
   value inside the hash i.e. its alphabet position.
8) At this point we'll have an array of alphabet positions, but also nil values
   where punctuation marks were, so we use the compact method to remove all nil
   values.
9) We then call the join method with a space to convert the array into a string
   of alphabet positions separated by spaces.
10) If the input was a string with no letters, our method returns an empty
    string.
=end

def alphabet_position_ms(text)
  index = ("a".."z").map.with_index {|l,i| [l,i+1]}.to_h
  text.delete(" ").downcase.chars.map {|c| index[c]}.compact.join(" ")
end

=begin
Here is a slightly short solution.
1) We downcase the entire string.
2) We call the gsub method and in our regex match for everything that isn't a
   letter from a-z. The ^ character essentially says "Not". Everything that is 
   not a letter is deleted, as well as punctuation and digits, this includes
   whitespace.
3) We now have a string of characters with no spaces, and we use the chars
   method to turn this into an array of characters.
4) We map over the array of characters and convert each letter to its ASCII
   value and subract this by 96 to reduce that to its alphabet position. Lower
   case letter ASCII values start at a = 97, b = 98... z = 122.
5) We convert the array of alphabet positions into a string of alphabet
   positions separated by a space, using join.
=end

def alphabet_position_lc(text)
  text.downcase.gsub(/[^a-z]/, "").chars.map{|l| l.ord - 96}.join(" ")
end

=begin
Here is another solution, using upper case ASCII values instead of lower case
ASCII values.
1) We upcase the entire string this time, because we are going to convert the
   letters to their alphabet positions using the ASCII values of upper case
   letters.
2) We use the (string) tr method - which is similar to gsub but takes a string
   matcher argument instead of a regex - in order to delete everything that
   isn't an upper case letter from the string.
3) Again, we convert the string to an array of charcters and then map over it,
   converting every letter to its ASCII value and because upper case ASCII
   values start at A = 65, B = 66... Z = 90, we take away 64 to reduce each to
   its alphabet position.
4) We join it into a string of alphabet positions separated by a space.
=end

def alphabet_position_uc(text)
  text.upcase.tr("^A-Z", "").chars.map {|l| l.ord - 64}.join(" ")
end

=begin
Here is a final method, one I made where we use the bytes method. Once we've
removed all spaces and characters that aren't lower cased letters, instead of
using chars, we simply use bytes to convert the string to an array of every
letter's ASCII value. Then we map over the array and minus each value by 96 to
get the alphabet positions.
=end

def alphabet_position_bytes(text)
  text.downcase.delete("^a-z").bytes.map {|l| l - 96}.join(" ")
end
