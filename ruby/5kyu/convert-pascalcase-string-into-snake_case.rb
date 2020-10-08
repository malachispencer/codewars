=begin
Codewars. 03/06/20. "Convert PascalCase string into snake_case". 5kyu. Here we create a method that converts a string from PascalCase to 
snake_case. If the input is an integer, convert it to a string. Here is a refined version of the solution I used to solve the challenge.
1) We define our method to_snake_case_ms, which takes an integer or a PascalCase string as its input.
2) We convert the input to a string, which turns any integer inputs into a string.
3) We call gsub on the string - which is going to change the Pascal inputs but not the integer inputs - and in our regex we match any
   character (?<=.) followed by a capital letter (?=[A-Z]). Our use of lookbehinds and lookaheads ensures that we match the space
   in between a character followed by a capital letter.
4) We place an underscore before capture group 2 '_\2', so before every capital letter which is precede by a character. This ensures that
   an underscore is not placed at the start of the string if it starts with a capital letter.
5) We then downcase the entire string.
6) Our string is now in snake_case and any integer passed in is now a string number.
=end

def to_snake_case_ms(s)
  s.to_s.gsub(/(?<=.)(?=[A-Z])/, '_\2').downcase
end

=begin
Here is another solution.
1) We convert the input to a string thereby any integer inputs are now a string number.
2) We split the string into an array at every space before a capital letter. Integer inputs will be in a one element array.
3) We join the array delimited by underscores.
4) We downcase the entire string.
5) Our string is now snake_case.
=end

def to_snake_case(s)
  s.to_s.split(/(?=[A-Z])/).join("_").downcase
end