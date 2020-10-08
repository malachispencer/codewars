=begin
Codewars. 09/05/20. 'String incrementer'. 5kyu. Here we create a method that 
increments a string. If the string ends with a number, the number should be 
incremented by 1. If the string does not end with a number, the number 1 should 
be appended to the string. If the number has leading zeros - e.g. "foobar0042" - 
the output should be foobar0043. Here is the solution I developed to solve the 
challenge.
1) We define our method increment_string_ms, which takes a string as its
   argument.
2) Using the pattern match operator and the regex /\d$/,  we check if the
   string ends with a digit. $ is an anchor that represents the end of the
   string (or line in a multiline pattern). Here we could have also done
   /(d)$/.
3) If the string ends with a number, we call gsub with the regex (\d+)$, which
   matches all digits at the end of a string. We then call the next method on
   CG1 (the numbers at the end of the string), which increments the number by
   1, we also could have used the succ method here. Here \d+ must be placed in
   brackets, while this was not necessary in the previous regex.
4) We could have used the sub method instead of gsub, sub replaces only the
   first instance of a pattern match while gsub replaces all of them. However,
   in our case it doesn't matter which we use because we've specified for the
   digits at the end of the string and the string contains only one word.
5) Incrementing the numbers as a string allows us to do so while keeping
   leading zeros.
6) If the string doesn't end with a number, we simply add 1 to it, using string
   interpolation.
=end

def increment_string_ms(s)
  s =~ /\d$/ ? s.gsub(/(\d+)$/) {$1.next} : "#{s}1"
end

=begin
Here is the top rated solution on Codewars.
1) We call the sub method on the string and match for 0 or more digits at
   the end of the string. * being the 0 or more quantifier.
2) We create a block for sub and block variable n represents the match, the
   digits at the end of the string.
3) If n is empty i.e. there were no digits at the end of the string - this case
   is included in our pattern match - we turn that nothingness into a 1.
4) If n is not empty, we call the succ method on the number.
5) Our string is now incremeneted.
=end

def increment_string(s)
  s.sub(/\d*$/) {|n| n.empty? ? 1 : n.succ}
end
