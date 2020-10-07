=begin
Codewars. 30/04/20. 'Longest alphabetical substring'. 6kyu. Here we create a 
method that finds the longest substring in alphabetical order. For example, 
"asdfaaaabbbbcttavvfffffdf" should return "aaaabbbbctt". Here is the solution 
I developed to solve the challenge.
1) We define our method longest_substring_ms, which takes a string as its
   argument.
2) We convert the string to an array of characters using chars.
3) We call the chunk_while method on the array of characters. The chunk_while
   method is similar to the slice_when method, it takes 2 block parameters
   representing element before and element after and groups elements based on
   the block, in an array of arrays.
4) (&:<=) passed to chunk_while is the same as {|a,b| a <= b} so our
   chunk_while groups equal or ascending consecutive letters together, in other
   words, it groups together substrings that in alphabetical order.
5) Now we have our array of arrays with alphabetical substrings grouped
   together, we call the max_by method with the length method passed in as its
   argument, which returns the array with the longest alphabetical substring.
6) We join the longest alphabetical substring array back into a string.
=end

def longest_substring_ms(str)
  str.chars.chunk_while(&:<=).max_by(&:length).join
end

=begin
Here is another solution, which is virtually identical to mine only it uses the
slice_when method instead of the chunk_while method.
1) Instead of converting to an array of characters using the chars method, we
   use the each_char method to pass each character to the block of our
   slice_when method.
2) (&:>) passed to our slice_when method is the same as {|a,b| a > b} so
   essentially it says "create a new group every time a is higher than b". So
   our groups will contain equal or ascending consecutive letters.
3) In longest_substring_ms, the chunk_while block defines what is inside the
   group, here, the slice_when block defines when a new group is created.
4) Now that we have our array of arrays containing alphabetical substrings,
   we call the max_by method with length passed in to return the longest, then
   we join it back into a string.
=end

def longest_substring_sw(str)
  str.each_char.slice_when(&:>).max_by(&:length).join
end

=begin
Here is a very clever regex solution.
1) In a constant, we create a regex pattern including all letters of the
   alphabet, in order, with repitition qualifiers (*) in between. The qualifier
   matches for 0 or more occurrences.
2) We call the scan method on the string with our regex passed in using string
   interpolation. This produces an array of arrays with all alphabetically
   ordered substrings.
3) We call the max_by method with length passed in as its argument to return
   the longest alphabetical substring.
=end

REGEX = ('a'..'z').to_a.join('*') + '*'

def longest_substring_r(s)
  s.scan(/#{REGEX}/).max_by(&:length)
end
