=begin
Codewars. 01/06/20. 'Reversing a Process'. 6kyu. We are provided with an encoding process for a string comprising a number and a set of 
letters. For example, encode("mer", 6015) is the input and the encoding process is m = 12, e = 5, r = 17; 12 * 6015 % 26 = 4; 
5 * 6015 % 26 = 10; 17 * 6015 % 26 = 23; 4 = e, 10 = k, 23 = x. We can see that the letter values are their alphabet positions minus 1, 
or their index positions if they were placed in an array. We must create a method that takes a string consisting of the right or wrong 
encoding number, and the encoded letters, we must return the decoded letter or "Impossible to decode" if the wrong number was given. Here is 
the solution I developed to solve the challenge.
1) We define our method decode_ms, which takes a string consisting of a number used to encode and a set of encoded letters.
2) First we slice out the number and convert it to an intger, then we also slice out the letters and store them in an updated s variable,
   we also initialize an empty array d (for decoded), where we will store our decoded letters.
3) We iterate over the letters using each_char and inside our each_char block, we create another loop where we iterate from 1 to 26, the
   positions of the alphabet. So for each letter, we will iterate 1 to 26 and if that i (alphabet position) multiplied by our number,
   modulo 26 is equal to the alphabet position of the encoded letter, we know that this alphabet position is where the original letter
   lies so we add this alphabet position to d.
4) We essentially go through 1 to 26 performing the encoding process to see if any match the encoded letter.
5) In cases where the number provided was correct, the size of our alphabet position array and our letters is equal, so when the number is
   incorrect they are not equal, so in such cases we return "Impossible to decode".
6) When the number provided is correct, we map over the array of alphabet positions, add 97 to convert them to lower case letter ASCII
   values, however if the sum exceeds 122, we need ASCII to loop back into alphabet range so we subtract 26. Once we have corresponding
   ASCII values we call chr to convert them to their letter form.
7) We then join the decoded letters back into a string, which is returned.
=end

def decode_ms(s)
  n = s[/\d+/].to_i ;  s = s[/\D+/] ; d = []
  s.each_char {|c| 1.upto(26) {|i| d << i if (i * n) % 26 == c.ord - 97}}
  return "Impossible to decode" if d.size != s.size
  d.map {|i| i + 97 > 122 ? (i + 97 - 26).chr : (i + 97).chr}.join
end

=begin
Here is an improved version of my original solution. Because our letters were encoded with index positions (0-25) rather than alphabet
positions (1-26), we save ourselves work by simply iterating index positions instead of alphabet positions. As we can see, doing so allows
us to convert the index positions to their letter form without subtracting 26 to loop back into alphabet ASCII range.
=end

def decode_ms_x(s)
  n = s[/\d+/].to_i ; s = s[/\D+/] ; d = []
  s.each_char {|c| 0.upto(25) {|i| d << i if (i * n) % 26 == c.ord - 97}}
  d.size != s.size ? "Impossible to decode" : d.map {|i| (i + 97).chr}.join
end