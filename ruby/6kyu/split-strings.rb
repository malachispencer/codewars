=begin
Codewars. 30/04/20. 'Split Strings'. 6kyu. Here we create an algorithm that 
splits a string into pairs, if the string contains an odd number of characters, 
the last character should have an underscore after it. For example, "abcdef" should
return ["ab", "cd", "ef"] and "abc" should return ["ab", "c_"]. Here is the solution 
I developed to solve the challenge.
1) We define our method split_string_ms, which takes a string as its argument.
2) We convert the string to an array of characters using chars.
3) We call the each_slice method which allows convert the array of characters
   into an array of arrays seperated at every nth character, in our case every
   2nd character. If the array had odd elements the last sub-array will contain
   a single character.
4) We map over the sliced array and if the sub array contains 1 element - the
   final sub-array if there were an odd amount of characters - we use the
   insert method to place an underscore to the right of the sole element. If
   not, we keep everything the same.
5) Now we have an array of arrays of character pairs. We simply map over it
   once again and join those sub-arrays into strings.
=end

def split_string_ms(str)
  str.chars.each_slice(2).map {|s| s.size == 1 ? s.insert(-1, "_") : s}.map(&:join)
end

=begin
Here is the shorest solution, using a regex.
1) We add an underscore to the end of the string.
2) We call the scan method, which takes a regular expression and returns an
   array of every pattern matched.
3) Our regex .. matches for every 2 any characters excpet newlines.
4) If our string contained an odd amount of characters, the array of string
   pairs is returned with the last pair containing an underscore.
5) If our string contained an even amount of characters, we added an underscore
   to it but this will not be included in the array scan generates, because it
   doesn't match our regex, so any odd end characters are not included. Hence
   there is no need for conditionals.
=end

def split_string_bp(str)
  (str + "_").scan /../
end

=begin
Here is a shorter and better variation of my solution. It adds the underscore
to string if its length is odd, before performing any other operations on it.
Now when we call each_slice the string can be easily split into pairs.
=end

def split_string_c(str)
  str << "_" if str.length.odd?
  str.chars.each_slice(2).map(&:join)
end
