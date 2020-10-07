=begin
Codewars. 03/05/20. 'Regex Password Validation'. 5kyu. Here we create a regex that 
validates whether a password is at least 6 characters long and contains a lowercase 
letter, an uppercase letter and a number. Here is one password validator.
1) ?= is the pattern is our positive lookaheads. The lookahead is
   non-capturing, so it ensures that the pattern exists, but it doesn't include
   the pattern in the final match.
2) .* in each of the lookahead groups matches any character, and it is
   necessary because it allows all three lookahead groups to match, regardless
   of the order in which they occur.
3) After the presence of an uppercase letter, a lowercase letter and a number
   has been confirmed, the capturing portion of the regex begins.
4) \A matches the start of the string, \Z matches the end of the string, {6,}
   matches 6 or more characters i.e. a minimum of 6. The use of \A and \Z
   allow for the use of multiline passwords.
5) \A[a-zA-Z0-9]{6,}\Z matches any string that is at least 6 characters and
   contains only alphanumeric characters, there is no maximum number of
   characters. The preceding lookahead groups ensure that there is at least 1
   character from each lookahead group, they act as a prerequisite.
6) In our password_extractor method, we input a password and if it's a valid
   password, the match method returns that password as match data. If it's not,
   it returns nil.
7) In our password_valid? method, we use the pattern match operator and if the
   pattern of our password validating regex is found in the string input, we
   return true, if not, we return false.
8) In both methods we call our regex using interpolation, from a constant
   where it is stored in a single quote '' string. It must be stored in single
   quotes, not double quotes, in order to work.
=end

REGEX_PV = '(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])\A[a-zA-Z0-9]{6,}\Z'

def password_extractor(pw)
  pw.match /#{REGEX_PV}/
end

def password_valid?(pw)
  pw =~ /#{REGEX_PV}/ ? true : false
end
