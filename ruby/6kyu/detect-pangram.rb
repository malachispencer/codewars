=begin
Codewars. 29/02/20. 'Detect Pangram'. 6kyu. Here we create a program that detects 
a pangram, a pangram is a sentence that contains every letter of the alphabet. 
This solution was submitted by a Codewars user.
1) We define our method pangram?. Because it is returning a true or false value,
   we put a ? at the end of it. We set one argument, the string.
2) We downcase the string to make the search easier.
3) We call the scan method and use the regex [a-z] to find any character in this
   range. Scan also converts the string into an array.
4) We use the uniq method, which removes all the duplicates.
5) We then call the size method, which tells us how many unique elements there
   are. Because we've searched for the alphabet and removed all the duplicates,
   if the size is 26, we have a pangram.
6) We end our method.
=end

def pangram?(str)
  str.downcase.scan(/[a-z]/).uniq.size == 26
end

=begin
Here is another solution, by another Codewars user.
1) We use the range method ("a..z") and call the all? method on it to check if
   every word in the alphabet is in whatever item we are going to pass into
   the block.
2) Placeholder in the block is l for letter, each letter in the a-z range, we
   iterate through the alphabet and see whether the downcased string
   includes each and all the letters in the alphabet.
3) We end our method.
=end

def pangram2?(str)
  ('a'..'z').all? {|l| str.downcase.include?(l)}
end