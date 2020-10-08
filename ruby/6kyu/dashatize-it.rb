=begin
Codewars. 09/05/20. 'Dashatize it'. 6kyu. Here we create a method that takes an 
integer and returns that number in string form with dashes before and after each 
odd integer. There should be no dashes at the start or end. Here is the solution 
I developed to solve the challenge.
1) We define our method dashatize_ms, which takes an integer as its argument.
2) If the input is nil, we return the string "nil".
3) If the input is an integer, we convert it to a string then call the gsub
   method. In our first regex ([13579]), which matches any one of the these
   odd digit characters, we place a dash before and after in our block.
4) If our number had 2 odd digits in a row, the string will now have 2 dashes
   in a row. For example, 5311 will be "-5--3--1--1-". So we call gsub again
   and this time our regex (\-)(\-) matches for consecutive dashes, we remove
   one of the dashes.
5) Our string may still have leading and trailing dashes, so we call gsub for a
   third time and this time our regex ^(\-)|(\-)$ matches for a dash at the
   start of the string or the end of the string. We remove all leading and
   trailing dashes.
6) Now our number is dashatized and returned in string form.
=end

def dashatize_ms(n)
  n.nil? ? "nil" : n.to_s.gsub(/([13579])/) {"-#{$1}-"}.gsub(/(\-)(\-)/, '\1').gsub(/^(\-)|(\-)$/, '')
end

=begin
Here is the top rated solution on Codewars.
1) We first ask if the input contains a non-nil value, if so, we convert the
   number to a string then call the scan method on it.
2) The regex in our scan method splits the number into an array after
   consecutive even digits or every odd digit.
3) We then join our array back into a string, with dashes in between all
   elements. This places a dash before and after every odd digit, with no
   consecutive, leading or trailing dashes.
4) If the input is nil, we return the string "nil".
=end

def dashatize(n)
  n ? n.to_s.scan(/[02468]+|[13579]/).join("-") : "nil"
end
