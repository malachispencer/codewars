=begin
Codewars. 06/05/20. 'Mexican Wave'. 6kyu. Here we create a method that takes a 
string and returns a mexican wave. For example, " gap " should return 
[" Gap ", " gAp ", " gaP "]. Any spaces should be passed over as if they are 
an empty seat. Here is the top clever voted solution on Codewars.
1) We require the english library., which allows us to access global variables
   using less cryptic names. For example, our entire scan block could be
   { a << $` + $&.upcase + $' } but this is harder to read. With the english
   library we can make this block { a << $PREMATCH + $MATCH + $POSTMATCH }.
2) Global variables are variables that can referred to from anywhere in the
   program. They should be used sparingly because they can be altered from
   anywhere and thus overuse of them can make isolating bugs difficult. However,
   in this method we call special, Ruby built-in global variables.
3) In our method we create an empty array then call the tap method, tap returns
   the object it's called on but allows us to make multiple changes to that
   object beforehand in a sometimes neater looking block.
4) In our tap block, a is the block variable for our empty array.
5) We call the scan method on the string with a single word \w as the regex,
   this by itself, with no block and outside the tap block would return an
   array of each word character in the string.
6) Our scan block iterates over each character it matches and places into the
   array the prematch, which is everything before the current character,
   the match upcased, and the postmatch, which is all the characters after the
   match. It does so in string form. We'll end up with an array the size of
   the amount of characters in the string. Spaces are not matched and hence
   ignored.
7) The glboal variables referenced are special, built-in global variables that
   refer to parts of the last regular expression match.
8) Finally, tap returns the new array of strings Mexican waved.
=end

require "english"

def mexican_wave(s)
  [].tap { |a| s.scan(/\w/) { a << $PREMATCH + $MATCH.upcase + $POSTMATCH } }
end

=begin
Here is the highest best practice rated solution on Codewars.
1) We create an empty array called wave, where we will store our Mexican wave.
2) We create a variable called chars, where we store the string as an array
   of characters.
3) We iterate over chars with index and skip the iteration if it's a space.
4) When we encounter a character, we into wave a string consisting of the
   string up to but not including the current character, the current character
   upcased, and the rest of the character.
5) If the current character is the first character in the string, remember that
   str[0...i] doesn't include it and nor does str[i+1..-1], so only c.upcase
   will be added. The length of wave will be equal to the amount of characters
   in the string.
6) Spaces are still included in wave strings because we are adding to wave from
   the original string, only the upcased character is being added from chars.
7) We return wave.
=end

def mexican_wave_x(str)
  wave = []
  chars = str.chars
  chars.each_with_index do |c, i|
    next if c =~ /\s/
    wave << str[0...i] + c.upcase + str[i+1..-1]
  end
  wave
end
