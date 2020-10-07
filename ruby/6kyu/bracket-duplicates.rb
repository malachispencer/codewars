=begin
Codewars. 29/04/20. 'Bracket Duplicates'. 6kyu. Here we create a program that 
takes a string as an input and if there are consecutive duplicates of more than 
2 characters in the string, we return the string with all extra characters in 
square brackets. For example, "aaaabbcdefffffffg" should return 
"aa[aa]bbcdeff[fffff]g". Here is the solution I developed to solve the challenge.
1) We define our method bracket_dups_ms, which takes a string as an argument.
2) As requested in the kata, we return a custom error message if the input is
   not a string.
3) If the input is a string, we convert it to an array of characters using the
   chars method.
4) We call the slice_when method and create a new group every time there is a
   different character, thereby creating an array of arrays where duplicates
   are grouped together in sub-arrays.
5) We map over the consecutively grouped array of arrays. If a group contains
   more than 2 characters, we use the insert method to place the front bracket
   in position 2 (after dups 0 and 1) and we use the insert method to place
   the end bracket at position -1 (after the rest of the duplicates). Now our
   duplicates have been bracketed in the format requested of us.
6) We join the array of arrays back into a string.
7) So that the line is not too long I've structured the method in a functional
   programming format.
=end

def bracket_dups_ms(str)
  return "Please enter a valid string" if !str.is_a?(String)
  str.chars.slice_when {|a,b| a != b}.
    map {|g| g.size > 2 ? g.insert(2, "[") && g.insert(-1, "]") : g }.
      join
end

=begin
Here is a better soltuion, which uses a regex.
1) We call the gsub method on the string.
2) In our regex, we pattern match for capture group 1 (.), any character
   except a newline, this also could have been ([a-zA-Z]).
3) Capture group 2 (\1) is 1 more occurrence of capture group 1, so so far
   we've matched for 2 consecutive characters.
4) Capture group 3 (\1{1,}) is exactly 1 or more occurrence of capture group 1,
   so now we've matched for all consecutive characters.
5) Our substitution argument puts capture group 1 (first character) next to
   capture group 2 (second same character) and then places square brackets
   around capture group 3 (the rest of the same characters). The substitution
   argument must be in single quotes '' not doulbe quotes "" in order to work.
6) We use rescue to handle any exceptions which in this case will be an input
   that is not a string.
=end

def bracket_dups(str)
  str.gsub /(.)(\1)(\1{1,})/,'\1\2[\3]' rescue "Please enter a valid string"
end
