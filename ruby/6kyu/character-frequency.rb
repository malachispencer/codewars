=begin
Codewars. 10/05/20. "Character frequency". 6kyu. Here create a method that
takes a string and returns a letter frequency count. For example,
"aaAabb dddDD hhcc" will return [["d",5], ["a",4], ["b",2], ["c",2], ["h",2]].
Upper case letts should be treated as lower case letters, all space, numbers
and punctuation should be ignored, letters with the same count should be sorted
alphabetically. Here is the solution I developed to solve the challenge.
1) We define our method letter_frequency_ms, which takes a string as an
   argument.
2) We downcase the string and remove everything that isn't a lower case letter
   using gsub, then we update the s variable.
3) We turn the string into an array of characters then call the group_by
   method to group incarnations of the same character together in a hash.
4) We then map over the hash and convert it into an array of arrays where each
   sub-array contains the chaaracter as its first element and the count of
   that character in string as its second element.
5) We then sort by the last element (the count), then call reverse so the
   count is in descending order.
6) Now we have the array of arrays with character and count, all we have to do
   is sort characters with the same count alphabetically, so we call the
   chunk_while method and group together characters with the same count.
7) Now we have an array of arrays of arrays. Each first sub-array is a chunk
   or group (g), so we flat_map over the groups and sort them by their
   character to sort the same count group alphabetically and remove the chunk
   array that was grouping them.
8) Now we have our array of arrays exactly in the format that was required,
   sorted from highest count and same count characters sorted alphabetically.
=end

def letter_frequency_ms(s)
  s = s.downcase.gsub(/[^a-z]/, '')
    s.chars.group_by(&:itself).map {|k,v| [k,v.size]}.sort_by(&:last).reverse.
      chunk_while {|a,b| a.last == b.last}.flat_map {|g| g.sort_by(&:first)}
end

=begin
Here is a shorter and better solution, submitted by Jesus Castello.
1) We downcase our string then call the scan method with the regex [a-z]
   passed in, which returns an array of all the letters in the string. With the
   scan method we did the work of gsub and chars in my solution, in one go.
2) We call the group_by method and group same incarnations of a character
   together in a hash.
3) Then we call transform_values with size passed in to convert the values
   (arrays holding the character incarnations) into their size i.e. the
   character count. Now we have a hash with character as key and count as value.
4) Finally, we call the sort_by and sort the hash into an array of sub-arrays
   according to two parameters. -v sorts by the counts as if they are negative
   values, so the highest count will end up being first as in reality the
   highest number negative becomes the lowest number and sort always sorts in
   ascending order. k sorts the letters alphabetically.
5) Now we have our array of arrays with character frequency in the correct
   format.
=end

def letter_frequency(s)
  s.downcase.scan(/[a-z]/).group_by(&:itself).
    transform_values(&:size).sort_by {|k,v| [-v, k]}
end

=begin
Here is a final solution. One that uses the more traditional counter hash.
1) We downcase the string, convert it to an array of characters then call
   each_with_object and initialize a counter hash.
2) We make the character the hash key then increment its count by 1 if it is
   not any character other than a lower case letter i.e. if it's a lower case
   letter. We do this using the "not" pattern match operator !~.
3) In this method we don't even remove numbers, spaces and punctuation from the
   string, we just ignore them when creating our counter hash.
4) Now that we have a counter hash, we sort it as if the counts are negative
   integers and the characters are sorted alphabetically.
5) Now we have our array of arrays in correct format.
=end

def letter_frequency_x(s)
  s.downcase.chars.
    each_with_object(Hash.new(0)) {|c,h| h[c] += 1 if c !~ /[^a-z]/}.
      sort_by {|k,v| [-v,k]}
end
