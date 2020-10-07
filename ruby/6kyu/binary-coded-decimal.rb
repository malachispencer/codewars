=begin
Codewars. 13/05/20. 'Binary Coded Decimal'. 6kyu. Binary coded decimal is a 
type of binary representation for decimal values where each digit is represented 
by a fixed number of binary bits, usually four. For example, 1 in BCD is 0001, 
8 is 1000, 9 is 1001 and 189 is 0001 1000 1001. Here we create a method that 
converts an integer to binary coded decimal. Here is the solution I developed 
to solve the challenge.
1) We define our method to_bcd_ms, which takes a positive or negative integer
   as its argument.
2) In case the integer is negative, we convert it to its absolute value, then
   convert it to a string, then call the gsub method. Our regex captures each
   single digit (\d) and we convert every digit to its 4 bit binary
   representation {"%04b" % $1}, padded with zeros if necessary.
3) We then call gsub again and our regex captures every 4 digits (\d{4}) that
   that precedes a digit (?=\d). We place a space after every 4 digits apart
   from the last 4 digits in the string (which don't precede a digit).
4) Now our integer is in binary coded decimal, if it was originally a negative
   integer, we add a minus symbol to the start of the string, if not, we return
   the bcd string.
=end

def to_bcd_ms(n)
  b = n.abs.to_s.gsub(/(\d)/) {"%04b" % $1}.gsub(/(\d{4})(?=\d)/, '\1 ') ; n < 0 ? "-#{b}" : b
end

=begin
Here is an even shorter solution, which does almost everything with one gsub
block.
1) We convert the integer to a string, then call gsub.
2) We match for each single digit, then create a block with a block variable
   as opposed to the $1 capture group syntax used in my solution.
3) We convert each digit to its 4-bit binary representation, with a space after
   each 4-bit binary.
4) We use the strip method to remove the trailing whitespace.
5) The conversion to binary in this solution works with the block variable but
   not with the $1 syntax.
6) Negative integers still have their - at the start of the bcd string.
=end

def to_bcd(n)
  n.to_s.gsub(/\d/) {|d| "%04b " % d}.strip
end
