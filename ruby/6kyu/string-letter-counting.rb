=begin
Codewars. 05/05/20. "String Letter Counting". 6kyu. Here we create a method
that takes a string, counts the occurrence of each character and returns a
string with the count of that character followed by the character itself. For
example "The quick brown fox jumps over the lazy dog." returns
"1a1b1c1d3e1f1g2h1i1j1k1l1m1n4o1p1q2r1s2t2u1v1w1x1y1z". Upper and lower case
letters should be treated as the same, special characters, numbers and spaces
should be ignored. Here is the solution I developed that allowed me to pass the
challenge.
1) We define our method string_letter_count_ms, which takes a string as its
   argument.
2) We downcase the string then call the gsub method to remove everything other
   than word letters from the string. We convert it to an array of characters
   then sort it - because our final string will be sorted - then store this in
   an updated s variable.
3) We call the group_by method, which returns a hash where the values are
   array elements. We group_by the character itself, which produces a hash
   where the character is the key, and each occurence of that character
   populates an array (the value).
4) We call the transform_values method with size as its argument, so the value
   becomes the size of the array (and hence the character count).
5) We then map over the hash and convert it into an array of arrays where each
   sub-array holds the value (count) and the key (character). Here we
   essentially swap the keys and values of our hash.
6) We then join it into our final string letter count.
=end

def string_letter_count_ms(s)
  s = s.downcase.gsub(/[^a-z]/, '').chars.sort
  s.group_by(&:itself).transform_values(&:size).map {|k,v| [v,k]}.join
end

=begin
Here is a variation of my original method, which is slightly shorter.
1) Once again we downcase the entire string then remove all non-letters, then
   we convert it to an array of characters and store this in an updated s
   variable.
2) We sort the string, call uniq to remove duplicates then we map over it.
3) In our map block, we turn the array of characters into an array of arrays
   where each sub-array holds the count of the character in updated s (before
   we called uniq) and the character itself.
4) We join our array of arrays into a string letter count.
=end

def string_letter_count_ms_x(s)
  s = s.downcase.gsub(/[^a-z]/, '').chars
  s.sort.uniq.map {|c| [s.count(c), c]}.join
end