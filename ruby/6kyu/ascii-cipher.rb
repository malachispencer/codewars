=begin
Codewars. 08/05/20. 'ASCII Cipher'. 6kyu. Here we create an ASCII cipher to send 
encrypted messages. Our method takes a string message that needs to be encrypted 
and an integer. Our encryption involves finding the largest prime factor of the
integer, then adding that prime to the ASCII value of each character in the
string. We will also have negative integers as input. Here is the solution I
developed to solve the challenge.
1) We require the prime library.
2) We define our method ascii_cipher_ms, which takes a string and an integer as
   its arguments.
3) We create an array of the ASCII table by creating a range from 0 to 127
   then mapping over it and converting each ASCII value to its character.
4) In a variable called p we store the largest prime factor of k using the
   prime_division method, then taking the max of the primes. However, if k is
   -1, we make its largest prime factor 1.
5) If k is a negative integer and is not our special -1 case, we add a minus
   symbol to its max prime factor calculated by prime_division.
6) We convert the string to an array of characters, then map over them. We
   convert each character to the value we get when we rotate the array by p
   places and grab the character in the same index position as c, in the
   original ascii array.
7) Now our array of characters is encrpyted. We join it back into a string.
=end

require "prime"

def ascii_cipher_ms(msg, k)
  ascii = (0..127).map(&:chr)
  p = k == -1 ? 1 : k.prime_division.map(&:first).max
  p = ("-" + p.to_s).to_i if k.negative? && k != -1
  msg.chars.map {|c| ascii.rotate(p)[ascii.index(c)]}.join
end

=begin
Here is a refined version of another Codewars user's solution.
1) We find the largest prime factor of k and store this in a variable p.
2) If k is a negative integer, we add a minus symbol to p by doing p = -p. When
   k was -1 and it's largest prime factor has -1, doing --1 converts -1 into 1,
   so our special case is handled much easier than in my solution.
3) We convert the string into an array of each characters ASCII value using the
   bytes method, then we map over the array of bytes.
4) For each character, we add the prime to its ASCII value, then do modulo 128,
   and convert the product to its character. This ensures that if ASCII + prime
   is more than 127, we loop the remainder back in our range of ASCII values.
   We find the encryption value much quicker than in my solution this way.
5) Now our array of characters is encrpyted, we join it back into a string.
=end

def ascii_cipher(msg, k)
  p = k.prime_division.map(&:first).max
  p = -p if k < 0 ; msg.bytes.map {|b| ((b + p) % 128).chr}.join
end
