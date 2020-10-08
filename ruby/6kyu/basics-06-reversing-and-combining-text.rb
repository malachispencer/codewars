=begin
Codewars. 05/05/20. 'Basics 06: Reversing and Combining Text'. 6kyu. Here we 
must create a method that takes a string of words separated by spaces and does 
the following. First, if there is more than one word, we reverse each word in 
the string. Second, we combine the first word with the second, the third with 
the fourth and so on. If there is an odd number of words we leave the last one 
alone, but it must still be reversed. We repeat this process until there's only 
one word in our string (no spaces), then we return that word. Here is the 
solution I developed to solve the challenge.
1) We define our method rev_com_ms, which takes a string of words, separated
   by spaces as its input.
2) We check if the string contains no spaces - and hence is one word - by using
   the match method with a regex, \s is the whitespace character class. If
   there is no space we return s, if not, we call the method recursively.
3) In our recursive method call, we split the string into an array of words,
   then we map over each word and reverse them all.
4) We then call the each_slice method to group the first with the second,
   third with the fourth and so on in an array of arrays. When we have an odd
   number of words, the last will be on its own in its sub-array.
5) We then map over the array of arrays and join each sub-array, thereby
   joining first and second, third and fourth etc. The odd word will be the
   same.
6) We join our array of words back into a string.
7) If the new string has no spaces, we return it, if not, we resursively run
   the reverse and combine process again.
9) The odd element stays on its own continually reversing itself until s
   contains only 2 words, after which it is reversed again and joined with
   the other word.
10) The final string is returned when it's one word with no spaces.
=end

def rev_com_ms(s)
  !s.match(/\s/) ? s : rev_com_ms(s.split.map(&:reverse).each_slice(2).map(&:join).join(" "))
end
