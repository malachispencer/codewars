=begin
Codewars. 02/05/20. 'Count the smiley faces!' 6kyu. Here we create a method that counts 
valid smiley faces in an array of valid and invalid faces. Here is the full list of valid faces: 
[":)",";)",":D",";D",":-D",":~D",":-)",":~)",";~D",";~)",";-D",";-)"]. Here is my favourite regex 
solution, submitted by a Codewars user.
1) We define our method count_smileys, which takes an array of valid and
   invalid smily faces as its argument.
2) We call the grep method on the array, grep does the same as the scan
   method, returning an array of all the elements which match the regex. The
   difference is that grep is an enumerable method, whereas scan is a string
   method.
3) In our regex, ^ defines the start of the string. [:;] matches a single one
   of these characters. [-~]? matches between zero and one of these characters,
   the ? is a 0 or 1 quantifier. [)D] matches for a single one of these
   characters. $ asserts position at the end of the string.
4) Once grep and regex has done its work, we have an array of all the valid
   smiley faces, we simply call size on the array to return the count.
=end

def count_smileys(arr)
  arr.grep(/^[:;][-~]?[)D]$/).size
end

=begin
Here is another solution.
1) We call the count method on the array.
2) In our block, we use the pattern matcher operator =~ to compare each
   element with our regex.
3) In our regex, ^ asserts position at the start of the string. (:|;) is the
   first capture group, which says match a single : or ;. (-|~)? is the second
   capture group, which says match either 0 or 1 of - or ~, ? is the 0 or 1
   quantifier. (\)|D) is the third capture group, it says match for a single
   one of ) or D. $ asserts the position at the end of string.
4) Our method thus returns the count of every valid smily face.
5) This method also could have used the regex /^[:;][-~]?[)D]$/, which is
   exactly identical to its regex just with square brackets and no need for
   or | symbols, because everything inside a square bracket - without adding a
   quantifier - says "match one of these characters".
=end

def count_smileys_x(arr)
  arr.count { |e| e =~ /^(:|;)(-|~)?(\)|D)$/ }
end
