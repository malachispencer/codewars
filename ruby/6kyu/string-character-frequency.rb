=begin
Codewars. 11/05/20. 'String character frequency'. 6kyu. Here we create a method 
that determines whether the count of each character in a string can be equal if 
we remove a single character from that string. For exampe, "abba" should return 
false because if we remove any one character the count of the remaining will not 
be equal; "abbba" should return true because removing b can make the count equal; 
"aaa" or similar should also return true. Here is the solution I devloped to solve 
the challenge.
1) We define our method count_equal_ms, which takes a string as its argument.
2) We convert the string to an array of characters then call the combination
   method with 1 less character than the original size of the string passed in
   as its parameter.
3) Now we have an array of arrays with each sub-array holding original ordered
   combinations of the string, minus one character.
4) We then call the any? method. Inside our any? block, we map over each
   sub-array and convert each character into its count inside its sub-array,
   we then call the uniq method to remove duplicates.
5) If the size of any of our sub-arrays is equal to 1, this means deleting one
   character allowed the count of the characters to be equal, and so our method
   returns true, if not, it returns false because we still had distinct counts
   for 2 or more characters.
=end

def count_equal_ms(s)
  s.chars.combination(s.size-1).any? {|g| g.map {|c| g.count(c)}.uniq.size == 1}
end
