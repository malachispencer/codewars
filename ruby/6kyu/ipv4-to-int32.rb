=begin
Codewars. 13/05/20. "IPv4 to int32". 6kyu. An IPv4 address e.g. 128.32.10.1 has
4 octects where each octet is a single byte (or 8 bits). If we convert each
octect to binary we get: 128.32.10.1 == 10000000.00100000.00001010.00000001.
Because the IP address has 32 bits, we can represent it as a 32 bit number:
2149583361. Here we create a method that takes an IPv4 address and converts it
to a 32 bit number. Here is the solution I developed to solve the challenge.
1) We define our method ipv4_to_int32_ms, which takes an IPv4 address in string
   form as its argument.
2) We call gsub on the IP string and our regex matches each set of 1 or more
   digits (\d+) that follows 0 or 1 dots \.?. We convert them to binary using
   string formatting and specify that the width of our binary string be 8
   characters padded with leading zeros.
3) Now our IP address numbers have been converted to 8 bit binary and all dots
   have been removed e.g. "10000000001000000000101000000001", we simply call
   to_i(2) to convert the 32 bits to an integer.
=end

def ipv4_to_int32_ms(ip)
  ip.gsub(/(\d+)\.?/) {"%08b" % $1}.to_i(2)
end

=begin
Here is another solution, which uses Ruby's built-in IPAddr library.
1) We require the IPAddr library.
2) We turn the IPv4 string into an IPAddr object with IPAddr.new.
3) Then we simply call the to_i method on the IPAddr object, which returns its
   integer representation.
=end

require "ipaddr"

def ipv4_to_int32(ip)
  IPAddr.new(ip).to_i
end
