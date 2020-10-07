=begin
Codewars. 13/05/20. 'Regexp Basics - is it IPv4 address?' 6kyu. Here we create 
a String class method that checks if an IP address is a valid IPv4 address. An 
IPv4 address contains 4 numbers (0-255) seperated by dots. Here is the solution 
I developed to solve the challenge.
1) We open up the array class to do some metaprogramming.
2) We define our new string class method ipv4_address_ms?.
3) In a variable n, we store the number capture group for our IPv4 regex, which
   we'll simply duplicate three times in our regex to capture the four 0-255
   numbers.
4) In the number capture group, we capture a 1 digit number 0 to 9 [0-9], or a
   2 digit number 10 to 99 [1-9][0-9], or a 3 digit number 100 to 199
   1[0-9][0-9], or 200 to 249 2[0-4][0-9], or 250 to 255 25[0-5].
5) In our regex, \A asserts the start of the string, then we place our number
   capture group, (\.) represents one literal dot, then we place a second
   number capture group, then a second dot, then a third number capture group,
   then a third dot, then a fourth and final number capture group. We didn't
   need to put our dots in brackets, we could have just done \. but I prefer
   brackets.
6) \z asserts the end of the string, just like \Z does, but importantly, \Z
   didn't allow us to pass all the tests because it returns for example
   "255.0.0.127\n" as true when it should be false, \z correctly returns
   it as false. This is because \Z matches the position before a line break
   whereas \z will match after a line break and go to the absolute very end of
   a string. Thus since there should be no newline in an IPv4 address, \z makes
   our regex correctly return false.
7) We use the case equality operator on the string to see if the string fits
   our regex pattern.
=end

class String
  def ipv4_address_ms?
    n = '([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])'
    /\A#{n}(\.)#{n}(\.)#{n}(\.)#{n}\z/ === self
  end
end

=begin
Here is another solution, very similar to mine. In the number capture group we
simply place in \d for digit instead of [0-9] and in our method we use the
pattern match operator placing a double bang !! so our pattern match returns
true or false.
=end

class String
  def ipv4_address?
    n = '(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])'
    !!(self =~ /\A#{n}(\.)#{n}(\.)#{n}(\.)#{n}\z/)
  end
end

=begin
Here is another solution, which uses Ruby's built-in IPAddr library, which
supports IPv4 and IPv6.
1) We require the IPAddr library.
2) In our method we create a new ip address using IPAddr.new(self) then we call
   the library's built in ipv4? method which returns true if it's a valid IPv4
   address. The method returns an error if it's not a valid IP address so we
   rescue false to return false if we get an error.
=end

require "ipaddr"

class String
  def ipv4_address_x?
    IPAddr.new(self).ipv4? rescue false
  end
end
