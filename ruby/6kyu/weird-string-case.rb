=begin
Codewars. 01/05/20. 'WeIrD StRiNg CaSe'. 6kyu. Here we create a method that 
takes a string and converts it to weird string case i.e. every letter in an 
even index should be upcased and every letter in an odd index should be downcased. 
Here is a refined version of the solution that I developed to pass the challenge.
1) We define our method weird_case_ms, which takes a string as its argument.
   The string may have one or it may be a setence seperated by spaces.
2) We call the split method on our string with the space as a delimiter. If the
   string is a sentence this turns each word into an array element, if the
   string is one word, that one word is an array element.
3) We map over the array and convert each element to an array of characters.
   Now we have an array of arrays where one word is a sub-array consisting of
   its characters as seperate elements.
4) We map over the array of arrays, then we also map over each sub-array (word)
   with index. If the index of the character in the word is even, we upcase it,
   if not, we downcase it. Nowe have an array of arrays where each word (sub-
   array) has been weird cased.
5) We join each sub-array (word) back into a string. Now we have an array of
   strings (or one string if only one word).
6) We join the array back into a string, delimited by a space, so if the array
   has several words, the words are seperated by a space, if the array has one
   word, it just becomes a word.
7) Our string is now weird cased.
=end

def weird_case_ms(str)
  str.split(" ").map(&:chars).
    map {|w| w.map.with_index {|c,i| i.even? ? c.upcase : c.downcase}.join}.
      join(" ")
end

=begin
Here is the shorter solution using gsub with a regex.
1) Our capture group (\w{1,2}) matches for groups of 2 letters next to each
   other.
2) $1 represents capture group 1, our only capture group. We call capitalize
   on this capture group, which capitalizes the first character and
   downcase's the rest (the second character).
3) When using our block and $1, we must place brackets around our entire
   pattern match regex.
=end

def weird_case(str)
  str.gsub(/(\w{1,2})/) {$1.capitalize}
end

=begin
Here is the same regex solution but using different syntax. If we don't want to
put brackets around our regex we can use a comma to seperate the substituion
argument then call &:capitalize.
=end

def weird_case_x(str)
  str.gsub /(\w{1,2})/, &:capitalize
end
