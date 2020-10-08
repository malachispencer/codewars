=begin
Codewars. 19/05/20. 'Caesar Cipher Helper'. 5kyu. Here we create a class that, 
when given a string, will return an uppercase string with each letter shifted 
however many spaces the cipher was initialized to. Here is the solution I 
developed to solve the challenge.
1) In our initialize method, we store the shift in the instance variable @s.
   When we create a new instance of our class it will be e.g.
   c = CaesarCipher_ms(13) and @s will be 13.
2) In our encode_ms method, which takes a string as its argument, we upcase
   the string, then call gsub on it, matching every upper case letter.
3) For each letter, if it's ASCII value plus the shift amounts to above 90, we
   add them then subtract 26, so that the product loops back into the range of
   uppercase letter ASCII values. If not, the ASCII value of the character and
   the shift are simply added.
4) The resulting ASCII values are then turned into their word characters. This
   performs the caesar encryption.
5) In the decode_ms method, we upcase the string, just in case it wasn't upper
   to begin with, then we call gsub and again match each uppercase letter.
6) In the gsub block, if the ASCII value of the letter minus the shift is less
   than 65, we subtract them, then add 26 so the resulting ASCII value is the
   letter shift-places behind in the alphabet. If not, we just subtract the
   shift. We convert all resulting ASCII's to their word character and this
   decodes the string.
7) When encoding, we are shifting the letter's forward, so we add. When
   decoding, we are shifting letter's back in the alphabet, so we subtract.
   90(z) is the upper bound of uppercase letter ASCII values and 65(a) is the
   lower bound.
=end

class CaesarCipher_ms
  def initialize(shift)
    @s = shift
  end

  def encode_ms(str)
    str.upcase.gsub(/([A-Z])/) {$1.ord + @s > 90 ? (($1.ord + @s) - 26).chr : ($1.ord + @s).chr}
  end

  def decode_ms(str)
    str.upcase.gsub(/([A-Z])/) {$1.ord - @s < 65 ? (($1.ord - @s) + 26).chr : ($1.ord - @s).chr}
  end
end

=begin
Here is another solution, submitted by a Codewars user.
1) In our initialize method, the class takes a shift, then we create an
   instance variable called @rotate, which is an array of the uppercase
   alphabet, rotated with the shift passed in, then joined into a string.
2) In our encode method, we upcase the string, then call the tr method and pass
   in the uppercase alphabet from A-Z in the "to be replaced" portion of its
   arguments.
3) In the "replace with" portion, we pass @rotate, the alphabet rotated the
   number of times of the shift. This replaces each letter in the string with
   the letter in the same index position of the rotated alphabet thus
   performing the encryption.
4) In the decode method, we upcase the string just in case it wasn't uppercase
   to begin with, then we call the tr method and pass in @rotate to "to be
   replaced", then pass in the normal positioned alphabet to "replace with".
   This performs the decryption.
5) For this decode method, we obviously have to be provided with the shift,
   which we are.
=end

class CaesarCipher
  def initialize(shift)
    @rotate = Array("A".."Z").rotate(shift).join
  end

  def encode(str)
    str.upcase.tr "A-Z", @rotate
  end

  def decode(str)
    str.upcase.tr @rotate, "A-Z"
  end
end
