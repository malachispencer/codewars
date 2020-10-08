=begin
Codewars. 12/05/20. 'String array duplicates'. 6kyu. Here we create a method that 
takes an array of strings and removes consecutive duplicate characters from each 
string. Here is the solution I developed to solve the challenge.
1) We define our method remove_con_dups_ms, which takes an array of strings as
   its argument.
2) We map over our array and on each string, we convert it to an array of
   characters, split it into groups where consecutive duplicates are grouped
   together using chunk_while, then flat_map over the groups and call uniq on
   each so that all the duplicates are removed, then we join the array of
   characters back into a string.
=end

def remove_con_dups_ms(arr)
  arr.map {|s| s.chars.chunk_while(&:==).flat_map(&:uniq).join}
end

=begin
Here is the best solution, we simply map over the array of strings and call
squeeze on each string. When called without an argument, the squeeze method
removes consecutive duplicates from a string.
=end

def remove_con_dups(arr)
  arr.map(&:squeeze)
end

=begin
Here is another solution, which uses gsub. In our regex (.) is CG1 which
matches any single character expect newlines. (\1+) is CG2 which matches 1 or
more consecutive characters of CG1. We keep only CG1 in our new string, which
is just the first character that had consecutive duplicates (CG2) after it.
=end

def remove_con_dups_x(arr)
  arr.map {|w| w.gsub(/(.)(\1+)/, '\1')}
end
