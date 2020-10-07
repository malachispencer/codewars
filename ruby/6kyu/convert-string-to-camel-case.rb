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
