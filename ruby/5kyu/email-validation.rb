=begin
Codewars. 03/05/20. "Email Validation". 5kyu. Here we create a method that
takes a string and returns whether it's a valid email address or not. After
hours of bug tweaking, here is the most flexible - within reason - regex I
could develop for email validation.
1) In our our regex, we have 11 capture groups. \A asserts the start of the
   string, \Z asserts the end of the string.
2) (\w+) = CG1. The email must start with a letter or number.
2) (\.|\-)? = CG2. Allows for a single, optional . or - before the @ symbol. ?
   is the 0 or 1 quantifier.
3) (\w+) = CG3. 1 or more letters or numbers. \w also encapsulates underscores.
4) (\.|\-)? = CG4. We allow for another optional dot or dash. So in total my
   regex allows an email address to have up to 2 dots or dashes before the @
   symbol.
5) (\w+) = CG5. There must be a letter or number before the @ symbol.
6) (@) = CG6. There must be 1 @ symbol in the email address.
7) (\w+) = CG7. There must be letters or numbers after the @ symbol.
8) (\.|\-){1} = CG8. Exactly 1 dot or dash.
9) ([a-zA-Z]+) = CG9. More letters, no numbers in the top level domain.
10) (\.)? = CG10. Another optional dot.
11) ([a-zA-Z]){2,} = CG11. There must be at least 2 characters in the last
    portion of the top level domain of an email address.
12) In our valid_email_ms? method, we use our regex and the case equality
    operator to check "if our regex were a drawer, would it be appropriate to
    put this string in the drawer". If so, the method returns true, if not, it
    returns false.
13) In our email_matcher_ms method, we use the match method to return the
    portion of a string which matches our regex and it is broken down into
    which parts match which capture group of the regex.
=end

REGEX_EV_MS = /\A(\w+)(\.|\-)?(\w+)(\.|\-)?(\w+)(@)(\w+)(\.|\-){1}([a-zA-Z]+)(\.)?([a-zA-Z]){2,}\Z/

def valid_email_ms?(email)
  REGEX_EV_MS === email
end

def email_matcher_ms(email)
  email.match "#{REGEX_EV_MS}"
end

=begin
Edutechional. 09/02/20. Here is Jordan Hudgens from Edutechional's email regex.
=end

REGEX_EV_JH = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

def valid_email_jh?(email)
  email =~ REGEX_EV_JH ? true : false
end