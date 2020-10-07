=begin
Codewars. 29/04/20. 'Character with longest consecutive repetition'. 6kyu. 
Here we create a method that takes a string and returns the character with 
the longest consecutive repitition along with the length of the repitition in 
the form [c,l]. If the string is empty we return ["", 0]. Here is the solution 
I developed to solve the challenge.
1) We define our method longest_repetition_ms, which takes a string as an
   argument.
2) If the string is empty, we return ["", 0].
3) If not, we convert the string into an array of characters then we group the
   consecutives together using chunk(&:itself).
4) We map over the chunks array of arrays and transform it into an array of
   arrays where each sub-array contains the character (c) and the amount of
   terms (t) or consecutive repititions that character had, which is the size
   of the chunks sub-array 2nd element (the sub-sub-array).
5) Now we call the max_by method with (&:last) passed in as its argument, which
   returns the sub-array which has the most consecutive repititions.
=end

def longest_repetition_ms(str)
 str.empty? ? ["", 0] : str.chars.
   chunk(&:itself).map {|c,t| [c, t.size]}.max_by(&:last)
end
