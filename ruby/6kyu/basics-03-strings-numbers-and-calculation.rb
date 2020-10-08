=begin
Codewars. 10/05/20. 'Basics 03: Strings, Numbers and Calculation'. 6kyu. Here we 
create a method that takes a "dirty string" and returns the calculation of the 
"clean string". The clean string is a positive number, followed by an operator 
(/*+-), followed by another positive number. The dirty string contains excess 
characters like letters and punctuation. Here is the solution I developed to 
solve the challenge.
1) We define our method calculate_string_ms, which takes a dirty string as its
   argument.
2) We clean the string by calling using the gsub method to delete everything
   that is not a digit, decimal point or mathematical operator. Now we have a
   string of our first number, operator and second number.
3) We split the string into an array and we split it before and after every
   operator using a regex with the positive lookahead, or operator and
   positive lookbehind (?=[\/\*\+\-])|(?<=[\/\*\+\-]).
4) We use the send method to perform our calculation on the first number and
   second number, which are both converted to integers. We then convert the
   result back to a string.
=end

def calculate_string_ms(s)
  s = s.gsub(/([^\d\.\/\*\+\-])/, '').split(/(?=[\/\*\+\-])|(?<=[\/\*\+\-])/) ; (s[0].to_i).send(s[1],s[-1].to_i).to_s
end

=begin
Here is a much shorter, refined version of my original solution. Here we simply
use the eval method on the clean string. The eval method allows us to calculate
a string as if its elements were numeric objects and mathematical operators.
We round the result to the nearest whole number - because eval performed a
float calculation - then we convert the number to a string.
=end

def calculate_string(s)
  eval(s.gsub /([^\d\.\/\*\+\-])/, '').round.to_s
end
