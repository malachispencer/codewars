=begin
Codewars. 06/05/20. "Decipher This!". 6kyu. This kata is the opposite of the
kata "Encrypt This!". Here we create a method that takes a string encrypted in
the form of every first letter of each word being replaced with its ASCII
value, and the second letter of each word being swapped with the last. Our
method must decrypt the string. Here is the solution I developed to solve the
challenge.
1) We define our method decipher_this_ms, which takes an encrypted string as
   its argument.
2) We call the gsub method on the string and convert every sequence of 1 or
   more digits to an integer, then call the chr method which converts it from
   ASCII to its character. We update the s variable so now it only contains
   words, no numbers.
3) We call split on the string to convert it into an array, then we map over
   each word, if the length of the word is above 2, we swap the positions of
   the second and the last letter using string slicing and interpolation. If
   the length is 2 or less, we leave it the same.
4) Now our words are decrypted, we join the array back into a string separated
   by spaces.
=end

def decipher_this_ms(s)
  s = s.gsub(/(\d+)/) {$1.to_i.chr} ; s.split.map {|w| w.length > 2 ? "#{w[0]}#{w[-1]}#{w[2..-2]}#{w[1]}" : w}.join (" ")
end

=begin
Here is a solution which uses a regex to solve the entire problem.
1) In our regex, (\d+) is GC1, it captures 1 or more digits.
2) (\w)? is CG2, it captures a single word character, 0 or 1 times because for
   example a word in the string could be "65" (matching 0). If it matches 1,
   this will be the first letter in the word e.g. "e" in "84eh".
3) (\w*?) is CG3, matching 0 or more words, expanding as needed, this will be
   the letters in between the first and the last letter if the word is
   more than 2 letters e.g. "ok" in "115eokp" or "r" in "109ero". If it's 2
   letters long e.g. "84eh", this will be the last character in the word.
4) (\w)? is CG4, matching any word character 0 or 1 times, this will be last
   character in the word, if it's more than 3 characters long e.g. "e" in
   "104dare".
5) \b asserts position at a word boundary, this is needed for this regex to
    work.
6) In our block, we convert CG1 (the number) to an integer then call chr to
   convert it from ASCII to its character. Then we place CG4, CG3 and CG2 in
   that order.
=end

def decipher_this(s)
  s.gsub(/(\d+)(\w)?(\w*?)(\w)?\b/) {"#{$1.to_i.chr}#{$4}#{$3}#{$2}"}
end
