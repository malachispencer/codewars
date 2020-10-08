=begin
Codewars. 04/05/20. "ROT13". 5kyu. ROT13 is a simple substitution cipher that
replaces a letter with the 13th letter after it in the alphabet. ROT13 is a
special case of the Caeser Cipher that was developed in Ancient Rome. Here we
create a ROT13 decryption method i.e. it decrpyts messages that have been
ROT13'd and turns them into intelligible English. Here is the solution I
developed to solve the challenge.
1) We define our method rot13_ms, which takes a ROT13 encrypted string as its
   input.
2) We cal the tr method on the message, the tr method replaces characters in
   the matcher argument with characters in the to argument.
3) "a-zA-Z" in our matcher argument we match characters ranging from a to z
   both lower and upper case.
4) In our to argument we replace characters ranging from a to z with characters
   ranging from "n-za-mN-ZA-M". So for example, all occurrences of "a" will be
   replaced with "n". As z is the last letter in the alphabet, we can
   continue our range by simply placing a next to it then continuing the range
   up to m.
5) Now all characters in our message will be replaced with the 13th character
   after it in the alphabet.
=end

def rot13_ms(msg)
  msg.tr("a-zA-Z","n-za-mN-ZA-M")
end

=begin
Here is another solution, submitted by a Codewars user. It's unnecessarily
long but it utilises a clever methodology.
1) We create a string with all letters of the alphabet both upper and lower
   case, in order, we store it in a variable called a.
2) We create a string parallel to a where every letter is the 13th letter
   after the letter of its same index position in a.
3) We turn the message into an array of characters then map over it. If the
   character is included in a, we convert it to the letter in b which has the
   same index position as it in a. So it's converted to the letter 13 places
   after it. If it's not included in a, it's punctuation or space, and so we
   leave it the same.
4) Now our array of characters has been decrpyted, we join it back into a
   string.
=end

def rot13(msg)
  a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
  b = "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm"
  msg.chars.map {|c| a.include?(c) ? b[a.index(c)] : c}
end

=begin
Here is a final solution, another one which is unnecessarily long but has a
clever technique.
1) We convert the message into an array of characters then map over them.
2) Using a case statement for each character, when c is any letter from a to m,
   lower or upper, we convert it to its ASCII value, add 13, then convert it
   back to a letter. Now it will be the letter 13 places after it in the
   alphabet.
3) When c is any letter from n to z, lower or upper, we convert c to its ASCII
   value, minus 13 then convert it back to a letter. For the last 13 letters of
   the alphabet, adding 13 wouldn't give an ASCII value of a letter, but the
   alphabet loops, so substracting 13 still gives us the letter 13 places
   after it.
4) When c is not any of those cases, it is punctuation or a space, so we leave
   it the same.
5) Our array of characters has now been decrpyted, so we join it back into a
   string.
=end

def rot13_z(msg)
  msg.chars.map do |c|
    case c
    when "a".."m", "A".."M" then (c.ord + 13).chr
    when "n".."z", "N".."Z" then (c.ord - 13).chr
    else c
    end
  end.join
end