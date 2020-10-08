=begin
Codewars. 02/05/20. 'Pairs of Bears'. 6kyu. In a string, we are looking for 
suitable mating pairs of bears. Bears are either "B" (male) or "8" (female). 
Our method must return - in an array - a string of all discrete mating pairs 
and true if the number of pairs is greater than x, false if not. E.g. input 
(7, "8j8mBliB8gimjB8B8jlB") should return ["B8B8B8", false]. Here is the 
solution I developed to solve the challenge.
1) We define our method pairs_of_bears_ms.
2) We create an array of all suitable mating pairs in the string using the
   scan method and a regex.
3) In our regex, we match for a B followed by an 8, or an 8 followed by a B.
   The | symbol represents or.
4) We join the array of pairs into a string.
5) In an array, we return pairs and whether the number of pairs (which is the
   length of the string divided by 2) is more than or equal to x.
=end

def pairs_of_bears_ms(x,s)
   pairs = s.scan(/([B][8]|[8][B])/).join
   [pairs, (pairs.length / 2) >= x]
end

=begin
Here is a shorter and better version of my solution. As we can see, there we
could have made the regex much shorter, there was no need for square brackets.
Here the boolean evaluates the size of the pairs array rather than the size of
the string divided by 2.
=end

def pairs_of_bears(x,s)
  pairs = s.scan(/(B8|8B)/)
  [pairs.join, pairs.size >= x]
end
