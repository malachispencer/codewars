=begin
Codewars. 29/04/20. 'Case Reversal of Consecutive Duplicates'. 6kyu. Here we 
create a method that reverses the case of consecutive duplicates in a string. 
Consecutive duplicates are one after the other and identical. For example, 
"puzzles" will return "puZZles". Here is the solution I developed to solve the 
challenge.
1) We define our method dup_case_reverse_ms, which takes a string as an
   argument.
2) We call the chars method on the string to convert it into an array of
   characters.
3) We call the slice_when method and make a new group every time there is a
   different element, thereby creating an array of arrays where consecutive
   duplicates are grouped together in a sub-array.
4) We map over the array of arrays and if the size of the sub-array is more
   than 1 - it contains consecutive duplicates - we map over it and swapcase
   every element. The swapcase method converts lower case letters to upper and
   upper case letters to lower.
5) If the size of the sub-array is not more than 1, we keep its elements the
   same. When we map over an array, we must perform an action on each element
   otherwise that element will become nil, this is why we use the ternary
   operator with the false condition returning the same element.
6) We join our array of arrays back into a string, with its consecutive
   duplicates case reversed.
=end

def dup_case_reverse_ms(str)
  str.chars.slice_when {|a,b| a != b}.
    map {|g| g.size > 1 ? g.map(&:swapcase) : g}.
      join
end

=begin
Here is the shortest and smartest way to solve the challenge.
1) We call the gsub method on the string.
2) In our regex matcher we make the capture group ([a-zA-Z]) which is
   essentially any lower or upper case letter.
3) We pass into the regex \1+ which matches for the same character as capture
   group 1, 1 or more times. \1 on its own would match only for instances of
   2 characters in a row but adding in the + allows us to match for any number
   of consecutive characters.
4) When gsub finds consecutive characters, it calls the swapcase method to
   convert lower case letters to upper case and upper case letters to lower
   case.
=end

def dup_case_reverse(str)
  str.gsub /([a-zA-Z])\1+/, &:swapcase
end
