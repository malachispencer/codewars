=begin
Codewars. 06/05/20. 'Tongues'. 5kyu. Here we create a method that takes a string 
and replaces every letter in the sequence "aiyeou" with the letter 3 places down 
inside the same sequence, and replaces every letter in the sequence "bkxznhdcwgpvjqtsrlmf"
with the letter 10 places down in the same sequence. Both sequences are
cyclical. Here is the solution I developed to solve the challenge.
1) We define our method tongues_ms, which takes a string as its argument.
2) We create a string with the 2 sequences both lower and upper case and store
   this in a variable called a.
2) We create a string (called b) where the replacement letters are placed in
   the same index position as the letter's from a that they should be replacing.
3) We convert the string to an array of characters then map over them.
4) If the character is included in a - all letters will be - we replace it
   with the letter from b, that's in the same index position as its index
   position in a. If not - it's punctuation, space or a digit - we leave it
   the same.
5) Now our array of characters has been decoded according to the specified
   decryption, we join it back into a string.
=end

def tongues_ms(s)
  a = "aiyeoubkxznhdcwgpvjqtsrlmfAIYEOUBKXZNHDCWGPVJQTSRLMF"
  b = "eouaiypvjqtsrlmfbkxznhdcwgEOUAIYPVJQTSRLMFBKXZNHDCWG"
  s.chars.map {|c| a.include?(c) ? b[a.index(c)] : c}.join
end
