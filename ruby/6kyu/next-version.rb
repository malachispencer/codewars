=begin
Codewars. 22/05/20. 'Next Version'. 6kyu. Here we create a method that takes a 
string of a software version and returns the next version e.g. "0.9.9" = "1.0.0", 
"9999.9" = "10000.0". Here is the solution I developed to solve the challenge.
1) We define our method next_version_ms, which takes a string of a software
   version.
2) In a variable called d, we store all the dots from the string by removing
   all the digits from v using gsub.
3) In a variable called n, we remove all the dots from v using gsub and then
   convert the number to its next version using the succ method.
4) We now want to add the dots to n but because we may have cases where there
   is an extra digit at the front of the string - e.g. 99 becomes 100 - we need
   to reverse n and add the digits starting from the back.
5) We then call gsub on n and in our regex, we match for a digit (\d) followed
   by another digit (?=\d), but the positive lookahead will match the space
   before that second digit.
6) With the number reversed, we add a dot between each 2 digits, taking the
   dots from d using slice!, until d is empty, this ensures we have the
   amount of dots that we had in the string to begin with.
7) We reverse n to put it back in the correct order, it is now the next
   version.
=end

def next_version_ms(v)
  d = v.gsub(/\d/, '') ; n = v.gsub(/(\.)/, '').succ ; n.reverse!.gsub!(/(\d)(?=\d)/) {"#{$1}#{d.slice!(0)}#{$2}"} ; n.reverse
end

=begin
Here is another solution, we could have just used the succ method, which
would have given us the next version.
=end

def next_version(v)
  v.succ
end
