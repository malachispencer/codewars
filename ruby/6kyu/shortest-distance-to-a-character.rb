=begin
Codewars. 25/05/20. 'Shortest Distance to a Character'. 6kyu. Here we create a method that takes a string and a character, and returns an 
array of the shorest distance between the current character in s to the character c in s. All letters will be lower case. If the string is 
empty or the character is not present in s, return an empty array. Here is the solution I developed to solve the challenge.
1) We define our method shortest_to_char_ms, which takes a string and a character that should be in the string as its argument.
2) We return an empty array if c is an empty string or if c cannot be found in s.
3) We convert s to an array of characters, map over it with index and then convert the string into an array of arrays where each sub-array
   holds the letter in s and its index position. This is the new s variable.
4) We then extract the index positions of c by calling reject on s and deleting all sub-arrays which do not contain c as the first element,
   we then keep only the last element in each sub-array, the index positions of all the occurrences of c inside s. We store this in cs.
5) Now we map over s and remove the letters, keeping only their index positions. Then we map again over these index positions.
6) Inside our block, we map over cs (the index positions of c) and for each we convert it to the index position of each c minus the index
   position of the current character in s, we convert this to absolute value and then the index position in s becomes the minimum value.
7) For example, if our string is "lovecodewars" and the character is "e". We have "e" in index positions 3 and 7. When we are at the index
   position of "s" in our map block, in cs we will do [3 - 11 = -7, 7 - 11 = -4], these converted to absolute values are 7 and 4, so we
   keep the minimum which is 4, and this is correct because "e" at position 7 is 4 places away from "s" in position 11.
8) Once our mapping of s in finished, an array of the shorest distances is returned.
=end

def shortest_to_char_ms(s,c)
  return [] if c.empty? || !s.match(/#{c}/)
  s = s.chars.map.with_index {|l,i| [l,i]}
  cs = s.reject {|l,i| l != c}.map(&:last)
  s.map(&:last).map {|i| cs.map {|ci| (ci - i).abs}.min}
end

=begin
Here is another solution, submitted by a Codewars user.
1) First we iterate the index positions of s then grab then select the index positions of c, we store this in a variable ci.
2) If ci is empty, we return an empty array.
3) Now we map over the index positions of s and for each index position, we subtract ci.min_by and in our min_by block we subtract the
   index position of the current s, from each index position of c (j), convert the results to absolute values then we keep the ci (j) that 
   produces a smaller value. This ci (j) is then subtracted from the current i, and we convert the result to absolute value.
4) In this method we do both ci - si to absolute and si - ci to absolute, they both give the same answer. For example, 3 - 0 = 3 (already
   abs) and 0 - 3 = -3 (abs = 3). Another example, 7 - 11 = -4 (abs = 4), 3 - 11 = -8 (abs = 8), 7 produces the smaller product, so for "s",
   11 - 7 is done, to produce 4.
=end

def shortest_to_char(s, c)
  ci = (0...s.size).select {|i| s[i] == c}
  return [] if ci.empty?
  (0...s.size).map {|i| (i - ci.min_by {|j| (j-i).abs}).abs}
end