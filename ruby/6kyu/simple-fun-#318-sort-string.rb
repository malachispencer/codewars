=begin
Codewars. 11/05/20. 'Simple Fun #318: Sort String'. 6kyu. Here we create a method 
that sorts a string according to three rules: letters are sorted in alphabetical 
order ignoring case e.g. "Type" should return "epTy"; if upper and lower case of 
the same letter exist in the same string, they are sorted in order of original 
input e.g. "BabA" should return "aABb"; all non-letters should stay in their original 
positions. Here is the solution I developed to solve the challenge.
1) We define our method sort_string_ms, which takes a string as its argument.
2) We call gsub on the string and remove all non-letters i.e. punctuation,
   space and any digits, keeping only lower and upper (i = case insensitive)
   letters. We then convert the letters to an array of characters and sort
   them as if they are all downcase. We store this in a variable called l (for
   letters).
3) We've pretty much taken care of the first two rules, all letters are sorted
   alphabetically but same lower and upper letters keep their original order.
4) We then convert the original string to an array of characters and map over
   it.
5) If the character is a letter, we replace it with the first letter from l, if
   not (i.e. special characters or space), we leave it the same. If we leave
   all non-letters the same and only take from l when it's a letter, we'll end
   up sorting our original string while ignoring special characters and spaces.
6) We join our now sorted array of characters back into a string.
=end

def sort_string_ms(s)
  l = s.gsub(/[^a-z]/i, '').chars.sort_by(&:downcase)
  s.chars.map {|c| c =~ /[a-z]/i ? l.shift : c}.join
end

=begin
Here is a better solution.
1) We call the scan method with the regex /[a-z]/i to extract all letters from
   the string and turn them into an array of characters. With one method here
   we've done the same work as gsub and chars in my solution.
2) We sort the string as if they are all downcase, taking care of the first 2
   rules.
3) We then call gsub with the regex /[a-z]/i then place l.shift in our block,
   we replaces each letter in the string with the first letter from l.
=end

def sort_string(s)
  l = s.scan(/[a-z]/i).sort_by(&:downcase) ; s.gsub(/[a-z]/i) {l.shift}
end
