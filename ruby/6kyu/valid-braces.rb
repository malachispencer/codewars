=begin
Codewars. 03/06/20. "Valid Braces". 6kyu. This kata is virtually the same as the "Valid Parentheses" kata but it introduces square brackets 
and curly braces. Once again, we must return if all braces in the string are valid. All strings will be non-empty and will consist only 
consist of either parentheses (), square brackets [] or curly braces {}. Here is the solution I developed to solve the challenge.
1) We define our method valid_braces_ms, which takes a string of braces as its argument.
2) We create a while loop and remove all valid braces in an iterative fashion.
3) If the string is now empty, the string contained all valid braces so true is returned, if not, it didn't include all valid braces so
   false is returned.
=end

def valid_braces_ms(b)
  while b.gsub!(/\(\)|\{\}|\[\]/, '') ; end ; b.empty?
end