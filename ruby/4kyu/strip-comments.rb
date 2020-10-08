=begin
Codewars. 20/05/20. 'Strip Comments'. 4kyu. Here we create a method that strips 
all text that follows any comment markers passed in, any whitespace at the end of 
the line should also be stripped out. Here is an example input and output:
apples, pears # and bananas    apples, pears
grapes                         grapes
bananas !apples                bananas
In code the input will look like ("apples, pears # and bananas\ngrapes\nbananas
!apples", ["#", "!"]) and the output should be "apples, pears\ngrapes\nbananas".
Here is the solution I used to solve the challenge after seeing a solution on Github.
1) We define our method strip_comments, which takes a string which includes
   newlines and an array containing comment markers.
2) We call gsub on the string.
3) In our regex, we match 1 or more spaces \s+, followed by any one of our
   comment markers [#{m.join}], followed by one or more of any character
   except newlines .+. We remove all of these.
4) This ensures that the space, the comment marker and all the text or space
   that follows it, up to a newline, is stripped from the string.
=end

def strip_comments(s,m)
  s.gsub(/\s+[#{m.join}].+/, '')
end
