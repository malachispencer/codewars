=begin
Codewars. 19/05/20. 'Cryptography #1 - Viva Cesare'. 6kyu. Here we create a 
method that encodes a string of text based on the Caesar cipher. The inputs are 
a string of text and an integer (theshift). The shift can be positive or negative. 
Only letters should be encoded, punctuation and spaces between text should stay the 
same. Encryption can change the case of the letter. Any leading or trailing 
whitespace must be removed. Here is the solution I developed to solve the challenge.
1) We define our method caesar_crypto_encode_ms, which takes t (for text), a
   string, and s (for shift), as its arguments.
2) First we handle our error checking, if the input is a nil value or empty, we
   return an empty string.
3) If t is not nil, we use the strip method to remove leading and trailing
   whitespace, then we call the tr method.
4) In our "to be replaced" portion of the tr method's arguments, we place the
   range of the alphabet in lower case and upper case.
5) In the "replace with" portion of the tr method's arguments, we place an
   array of the alphabet in lower and upper case then merge them. Then we call
   the rotate method on this array and pass in the shift, then we join the
   array back into a string.
6) What this does is rotate the alphabet according to the shift, then replaces
   the single alphabetical letter in t, with the letter at the same index in
   the rotated alphabet, thereby performing any caesar encryption based on
   the shift we provide it. Positive shift will move the letter forward in the
   alphabet, negative shift will move the letter back in the alphabet.
=end

def caesar_crypto_encode_ms(t, s)
  t.nil? ? "" : t.strip.tr("a-zA-Z", (Array("a".."z") + Array("A".."Z")).rotate(s).join)
end

=begin
Here is another solution, submitted by a Codewars user.
1) We convert any input to a string, this turns nil inputs into empty strings
   thereby implicitly handling our error checking.
2) We remove trailing and leading whitespace from the string.
3) We call the tr method and replace each alphabetical character with a
   character in the same index position of the rotated (by shift) alphabet.
4) However, as opposed to my method, here we create the array using a
   different syntax, utilising splat operators on the ranges, inside array
   brackets.
=end

def caesar_crypto_encode(t, s)
  t.to_s.strip.tr("a-zA-Z", [*"a".."z", *"A".."Z"].rotate(s).join)
end
