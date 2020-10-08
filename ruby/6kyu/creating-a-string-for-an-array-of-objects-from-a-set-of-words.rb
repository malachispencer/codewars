=begin
Codewars. 29/05/20. "Creating a string for an array of objects from a set of words". 6kyu. We are given a string of one or more not space 
characters, followed by a space, followed by one or more not space characters. This sequence appears multiple times and each sequence is
separated by a space. Our method must parse the string and create a string that looks like an array of objects. For example, 
"red 1 yellow 2 black 3 white 4" should return "[{name : 'red', id : '1'}, {name : 'yellow', id : '2'}, {name : 'black', id : '3'}, 
{name : 'white', id : '4'}]". Another example, "#@&fhds 123F3f 2vn2# 2%y6D @%fd3 @!#4fs W@R^g WE56h%" should return
"[{name : '#@&fhds', id : '123F3f'}, {name : '2vn2#', id : '2%y6D'}, {name : '@%fd3', id : '@!#4fs'}, {name : 'W@R^g', id : 'WE56h%'}]".
Here is a minimally refined version of the solution I developed to solve the challenge.
1) We define our method words_to_object_ms, which takes a string of not spaces-space-not spaces as its argument.
2) We call gsub on the string and in our regex we one or more not spaces (\S+), followed by a space \s, followed by one or more not spaces
   (\S+). In my original solution, I used ([^\s]+) instead of (\S+) to match not spaces.
3) In our block, we format every occurrence of our pattern match in the required format. The first set of not space characters - capture
   group 1 - are the name, and the second set of not space characters - capture group 2 - are the id, single quote marks must be placed 
   around both. We place a comma at the end of each sequence.
4) Because we placed a comma at the end of every sequence, we'll also have one at the end of the string, so we call gsub and remove the
   comma at the end of the string \,$.
5) Our string is not formatted with everything other than the array brackets at the front and the end, so we concatenate these.
=end

def words_to_object_ms(s)
  "[" + s.gsub(/(\S+)\s(\S+)/) {"{name : '#{$1}', id : '#{$2}'},"}.gsub(/\,$/, '') + "]"
end

