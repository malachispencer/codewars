=begin
Codewars. 12/05/20. 'Binary to Text (ASCII) Conversion'. 6kyu. Here we create 
a method that takes a binary string and returns the equivalent decoded text, 
the text is ASCII encoded. Each 8 bits in the binary string represent one 
character on the ASCII table. Here is the solution I developed to solve the challenge.
1) We define our method binary_to_text_ms, which takes a binary string as its
   argument.
2) We call the gsub method on our binary string. In our regex ([01]{8}) we
   match exactly 8 0s or 1s, essentially grabbing each binary value.
3) We convert each binary value (8 bits) to its ASCII value using to_i(2) then
   we convert the ASCII value to its character on the ASCII table using chr.
4) Our string has now been decoded.
=end

def binary_to_text_ms(b)
  b.gsub(/([01]{8})/) {$1.to_i(2).chr}
end

=begin
Here is another solution, submitted by a Codewars user.
1) We place the binary string into an array so that we can call the pack
   method, which is an array method.
2) The pack method has many uses based on the directive it receives, in our
   case it takes the string directive "B*" which converts all of the array
   elements (*) to their ASCII value's character. The array is one element i.e.
   one string.
=end

def binary_to_text(b)
  [b].pack("B*")
end
