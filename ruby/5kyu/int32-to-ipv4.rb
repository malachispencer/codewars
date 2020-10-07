=begin
Codewars. 13/05/20. "int32 to IPv4". 5kyu. Here we create a method that takes a
32 bit number and returns a string representation of its IPv4address. Here is
the solution I developed to solve the challenge.
1) We define our method int32_to_ip_ms, which takes a 32 bit number (integer)
   as its argument.
2) We convert the integer to a 32 bit binary string using string formatting, we
   ensure the binary string is padded with zeros. Using "%032b" % i32 instead
   of to_s(2)
3) We then call gsub so we can add in our dots. In our regex we match every 8
   0s or 1s ([01]{8}) that is not followed by a space (?=[^\s]) and then we
   place a dot after each.
4) We then call gsub again, matching for consecutive digits (\d+) and we
   convert each set of consecutive digits (8 bits) to their integer
   representation using $1.to_i(2).
5) Now our 32 bit number is a IPv4 address.
=end

def int32_to_ip_ms(i32)
  ("%032b" % i32).gsub(/([01]{8})(?=[^\s])/, '\1.').gsub(/(\d+)/) {$1.to_i(2)}
end

=begin
Here is another solution, which uses the IPAddr library.
1) If we hadn't already, we'd have to require the ipaddr library.
2) We create a new IP address object this time from a packed in address value
   - our 32 bit representation of an IP - and an address family AF_INET.
3) Now we've turned our 32 bit number into an IPv4 address, we convert it from
   an IP object to a string.
=end

require "ipaddr"

def int32_to_ip(i32)
  IPAddr.new(i32, Socket::AF_INET).to_s
end