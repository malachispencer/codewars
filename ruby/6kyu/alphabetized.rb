=begin
Codewars. 27/04/20. 'Alphabetized'. 6kyu. Here we create a method that sorts a 
string case insensitively while also removing all punctuation and spaces. 
For example, the input "The Holy Bible" should return "BbeehHilloTy". Here is 
the method I developed to solve the challenge.
1) We define our method alphabetized_ms, which takes one argument, s, a string.
2) We call the gsub method on the string and match for all characters other
   than lower and upper case letters, we pass in an empty string as the
   substitution thereby removing all punctuation, spaces and other non-letter
   characters e.g. digits.
3) To remove non-letters we also could have used s.delete("^a-zA-Z") or
   s.tr("^a-zA-Z", "").
4) The string now contains only letters, we convert it to an array of
   characters using chars.
5) We use the sort_by method and pass in downcase as an argument, meaning the
   array of characters are sorted as if they are all downcase, but without
   actually altering their original case.
6) We join the case insensitively sorted array of characters back into a string
   with no spaces.
=end

def alphabetized_ms(s)
  s.gsub(/[^a-zA-Z]/, "").chars.sort_by(&:downcase).join
end

=begin
Here is the top solution on Codewars. Rather than using gsub to remove
non-letters, here we use the scan method to create a new array - of characters
- featuring only letters. The i in the regex makes our a-z matcher case
insensitive. We then sort the array of characters ignoring case and then join
it into a string with no spaces.
=end

def alphabetized(s)
  s.scan(/[a-z]/i).sort_by(&:downcase).join
end
