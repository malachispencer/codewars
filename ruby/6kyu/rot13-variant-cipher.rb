=begin
Codewars. 04/05/20. "ROT13 variant cipher". 6kyu. Here we create a method that
takes a string and performs a ROT13 encryption on it, then takes that string
and replaces every letter with its exact opposite in the alphabet e.g. "a"
becomes "z", "b" becomes "y" and so on. All letters in the input will be lower
case. Here is the solution I developed to solve the challenge.
1) We define our method rot13_variant_ms, which takes a string as an argument.
2) We call the tr method and rot13 our string by replacing every letter in the
   string with the letter 13 places after it in the alphabet.
3) Then we convert our rot13'd string to an array of characters and map over
   it.
4) If the character is a letter, we find its position in the alphabet using
   (c.ord - 96), minus 96 for lower case letters, minus 64 for upper case
   letters.
5) Since lowercase letter ASCII values end at 122 (z), I discovered that if we
   subtract a letters position in the alphabet from 123, we get the exact
   opposite character. For example, 123 - 1 (a) = 122 (z);
   123 - 2 (b) = 121 (y); 123 - 13 (m) = 110 (n). Thus we do so and use chr to
   convert the ASCII value to its letter form.
6) If c is not a letter, it is a space, so we leave it the same.
7) Now our characters are fully encrypted, we convert them back to a string.
8) This method also works if a string includes spaces, punctuation and numbers.
   It can also be easily adapted to encrypt upper case letters.
=end

def rot13_variant_ms(str)
  str.tr("a-z", "n-za-m").chars.
    map {|c| c =~ /[a-z]/ ? (123 - (c.ord - 96)).chr : c}.
      join
end