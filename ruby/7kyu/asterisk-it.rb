=begin
Codewars. 23/04/20. 'Asterisk it'. 7kyu. Here we create a method that inserts an 
asterisk between every pair of even digits in the given input and returns this 
in the form of a string. The input may be an integer, a string based number, or 
an array of integers. Here is the solution I used to solve the challenge.
1) We define our method asterisk_it_ms, which takes one argument, inp, which
   can be an input of integers, string based numbers or an array of integers.
2) If inp is an array, we first must join it into a string with all spaces
   stripped, so as to create our initial string sequence of digits.
3) All other inputs are converted to a string using to_s, string inputs are
   unaffected by the to_s method so only integers are affected.
4) We then use the global substitution method to alter our string in all
   occurrences of our pattern match, we pass it a regex.
5) In our regex we create 2 capture groups. The first (?<=[02468]) uses the
   positive lookbehind assertion ?<= which essentially says "match for the
   space immediately after any of the following [02468] and don't consume
   (i.e. delete) any of the characters". The capture group  be in
   parenthesis.
6) The second capture group (?=[02468]) uses the positive lookahead
   assertion ?= which essentially says "match for the space immediately before
   any of the following [02468] and don't consume any of the characters".
7) In our substitution argument,'\1*\2', backslash 1 and backslash 2 represent
   capture groups 1 and 2 respectively, we simply place an asterisk between
   them, reformatting the string with an asterisk placed in between every
   pair of even digits. The argument must be placed in single quotes '' rather
   than double quotes "" in order to work.
=end

def asterisk_it_ms(inp)
  inp = inp.join if inp.is_a?(Array)
  inp.to_s.gsub /(?<=[02468])(?=[02468])/, '\1*\2'
end
