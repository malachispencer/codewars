=begin
Codewars. 13/05/20. 'Count IP Addresses'. 5kyu. Here we create a method that 
takes 2 IPv4 addresses and returns how many IP addresses are between them, the 
second will always be greater than the first. Here is the solution I developed 
to solve the challenge.
1) We define our method ips_between_ms, which takes two IPv4 addresses in
   string form as its arguments.
2) We call our second method, ip_to_int on both a and b.
3) In ip_to_int, we convert an IPv4 address to its integer representation by
   converting each of the four numbers in the IP to their 8-bit binary
   representations and simultaneously removing the dots, which leaves us with a
   32 bit IP address. We then convert this 32 bit IP address to its integer
   representation.
4) In our ips_between_ms method, we simply subtract a-integer from b-integer
   and this gives us how many IP addresses there are in between the two.
=end

def ips_between_ms(a,b)
  ip_to_int(b) - ip_to_int(a)
end

def ip_to_int(ip)
  ip.gsub(/(\d+)\.?/) {"%08b" % $1}.to_i(2)
end

=begin
Here is another solution, which uses the IPAddr library.
1) We require the IPAddr library.
2) We turn both our strings into IP objects, then convert both to their integer
   representations and simply subtract the difference.
=end

require "ipaddr"

def ips_between(a,b)
  IPAddr.new(b).to_i - IAddr.new(a).to_i
end
