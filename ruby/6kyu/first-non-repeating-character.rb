=begin
Codewars. 21/04/20. 'First non-repeating character'. 6kyu. Here we create a 
method that returns the first non-repeated character in a string. For example, 
the input "stress" should return "t". Lower and upper case letters must be 
treated as the same character but the character should be returned in its 
original case, therefore "sTreSS" should return "T". If the string is empty or 
contains all repeating characters we must return an empty string. Here is the 
solution which allowed me to pass the challenge.
1) We define our method first_non_repeating, which takes one argument, s, a
   string.
2) We return an empty string if the input is an empty string or the count of
   all characters in the string - converted to an array of characters - is
   above 1 i.e. all repeating characters.
3) We convert s to an array of characters then use the find method, which
   returns the first true occurrence of the block.
4) In the block we return the first character with a downcase count of 1 or an
   upcase count of 1. Important, we are calling the count method on the string,
   but making the comparison with the array of characters. So although we
   downcase and upcase to treat upper and lower the same, what we retun is ends
   up being the original case.
=end

def first_non_repeating(s)
  return "" if s == "" || s.chars.all? {|c| s.count(c) > 1}
  s.chars.find {|c| s.downcase.count(c) == 1 || s.upcase.count(c) == 1}
end
