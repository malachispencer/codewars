=begin
Codewars. 03/05/20. 'Valid Phone Number'. 6kyu. Here we create a method 
- using a regex - that determines whether the input string is a valid phone 
number in the US/Canada format "(123) 456-7890". Here is the solution I 
developed to solve the challenge.
1) We define our method valid_phone_number_ms?, which takes a string as its
   argument.
2) We use the pattern match operator on our string.
3) In our regex, \A asserts the start of the string and \Z asserts the end of
   the string.
4) (\() is capture group 1, for the open parenthesis. (\d){3} is capture group
   2, for exactly 3 digits. (\)) is capture group 3, for the close parenthesis.
   (\s) is capture group 4, for whitespace. (\d){3} is capture group 5, for
   another 3 digits. (-) is capture group 6, for a dash. (\d){4} is capture
   group 7, for exactly 4 digits.
5) If our string comprises this format, it's a valid phone number and so we
   return true, if not, we return false.
=end

def valid_phone_number_ms?(pn)
  pn =~ /\A(\()(\d){3}(\))(\s)(\d){3}(-)(\d){4}\Z/ ? true : false
end

=begin
Here is another solution submitted by a Codewars user.
1) The regex differs from mine in that we don't use parenthesis to create
   capture groups, in fact, they were not in my solution at all.
2) Here, we simply create the phone number format with the regular expressions
   and we don't even need an \s for whitespace, we can just create a space
   instead.
3) We use the case equality operator === to essentially ask the question "if
   the regex is a set, would it make sense for pn to be a member of that set"
   or put another way "if this regex is a drawer, would it make sense to put
   pn in this drawer". Therefore, strings which match the pattern of the regex
   will return true, and those which don't will return false.
=end

def valid_phone_number?(pn)
  /\A\(\d{3}\) \d{3}-\d{4}\Z/ === pn
end
