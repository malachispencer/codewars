=begin
Codewars. 16/05/20. "Simple Simple Simple String Expansion". 6kyu. Here we
create a method that takes a string of alphanumeric characters and returns the
expansion of that string. Alphabetic characters should be expanded according to
the numeric value that precedes it e.g. "3d332f2a" should return "dddffaa". If
there are consecutive numeric characters, only the one which precedes a letter
is used. Here is the solution I developed to solve the challenge.
1) We define our method str_expansion_6kyu_ms, which takes a string of
   alphanumeric characters as its argument.
2) We call gsub on our string and using our regex (\d+)(\d) we remove
   consecutive numeric characters which don't precede a letter (CG1) by keeping
   only CG2 = \2.
3) We call gsub again to remove digits at the end of the string \d$.
4) We call gsub for a third time and match for a single numeric (\d) followed
   by 1 or more upper or lower case letters ([a-z]+)/i.
5) In our gsub block, we convert our captured letters to an array of
   characters, then map over them and expand each according to the number that
   preceded it, then we join this array join into a string.
6) Now our string has been successfully expanded, passing over 1000 rigorous
   tests.
=end

def str_expansion_ms(s)
  s.gsub(/(\d+)(\d)/, '\2').gsub(/\d$/, '').gsub(/(\d)([a-z]+)/i) {$2.chars.map {|c| c * $1.to_i}.join}
end

=begin
Here is an even better solution, submitted by a Codewars user.
1) We call gsub on our string and in our regex we match for 0 or more numeric
   characters \d*, followed by a single numeric character (\d), followed by 0
   or more non-digits (\D*) i.e. letters.
2) In our block, we make CG1 (the single digit preceding a letter or letters)
   an integer and store this in a variable n.
3) Then we call gsub on CG2 (our letters) and match each single letter, then
   we create another block and inside this block we multiply each single
   letter by n thereby expanding the string.
4) In this method we match exactly what we want without needing to explicitly
   remove consecutive numerics or trailing digits, consecutives are removed
   because we don't turn them into a capture group.
=end

def str_expansion(s)
  s.gsub(/\d*(\d)(\D*)/) {n = $1.to_i ; $2.gsub(/./) {$& * n}}
end

=begin
Here is an iterative solution, inspired by another Codewars user's solution
that did the same with each_with_object.
1) We initialize a variable m to 1, m will continually be updated as we
   iterate over the characters. However, it starts off at 1 so that when our
   first character in the string is a letter - e.g. "A4g1b4d" - that A is still
   contained in the final string.
2) Also, if our string is all letters - e.g. abcde - m will stay 1 throughout
   the entire traversing of the characters and reproducing the same final
   string, as it should in such cases.
3) We conver the string to an array of characters then map over them. When we
   encounter a digit, we change m to the integer of that digit. If not, we
   expand the character by multiplying it by m. What this means is that every
   time a digit is encountered, m is changed, so if there are 3 digits before
   a letter, m will be the preceding digit once our loop hits that letter.
4) We have an array of expanded strings and also integers, so we reject all
   members of the integer class from our array.
5) We join our array of expanded strings back into one string.
=end

def str_expansion_x(s)
  m = 1 ; s.chars.map {|c| c =~ /\d/ ? m = c.to_i : c * m}.reject {|c| c.class == Integer}.join
end

