=begin
Codewars. 21/04/20. 'Break camelCase'. 6kyu. Here we create a method that breaks 
up camel casing - e.g. camelCasing - using a space between words. Here is the 
solution that allowed me to pass the challenge.
1) We define our method break_camel_case_ms, which takes one argument, a
   camel cased string.
2) We call the split method on the string and pass in a regular expression.
3) In our regex we match for before any capital letter using the positive
   lookahead ?= and its assertion [A-Z]. The capital letters are not included
   in the match so the characters are not consumed, as is normally the case
   with the split method delimiter. The whole pattern (?=[A-Z]) must be in
   brackets to work.
4) Essentially here, we've split the string into an array of words e.g.
   ["camel", "Case", "Breaking"].
5) We then use the join method to convert the array back into a string, with
   each element separated by a space.
=end

def break_camel_case_ms(str)
  str.split(/(?=[A-Z])/).join(" ")
end

=begin
Here is another solution, the second most popular on Codewars. It uses the
same regex as break_camel_case_ms with the lookahead assertion but utilises
the gsub method, which replaces every before-capital position with a space,
without eating any characters.
=end

def break_camel_case(str)
  str.gsub /(?=[A-Z])/, " "
end

=begin
22/04/20. From the 6kyu "CamelCase Method" Codewars challenge, here is a custom
method added to the string class that allows you to camel case any string, even
if it contains punctuation.
=end

class String
  def camelcase
    self.split.map(&:capitalize).join
  end
end

=begin
24/04/20. From the 6kyu "Convert string to camel case" Codewars kata, here is
a method that takes a string delimited by dashes ("The-Stealth-Warrior") or
underscores ("the_stealth_warrior") and converts it to camel case. The first
word in the string should be capitalized only if the original word was
capitalized. Here is the highest best practice and clever rated solution on
Codewars.
1) In our regular expression the pattern we match for is any character apart
   from newlines (.) after a dash or underscore [_-]. Instead of (.) we also
   could have used ([a-zA-Z]). (.) is our capture group, capture groups must
   always be in parenthesis.
2) $1 refers to our first and only capture group, we replace the dashes or
   underscores and every character after a dash or underscore, with an upcased
   version of that character.
=end

def to_camel_case(str)
  str.gsub(/[_-](.)/) {$1.upcase}
end
