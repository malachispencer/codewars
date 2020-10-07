=begin
Codewars. 15/05/20. 'Vowel recognition'. 6kyu. Here we create an algorithm 
that finds how many vowels there are in all possible substrings of a string. 
For example, "baceb" can be split into ["b", "ba", "bac", "bace", "baceb", 
"a", "ac", "ace", "aceb", "c", "ce", "ceb", "e", "eb", "b"]. This string's 
vowel count is 16. Here is the solution I developed to solve the challenge.
1) We define our method vowel_recognition_ms, which takes a string as its
   argument.
2) We convert the string to an array of characters then we map over them with
   index.
3) Every time we encounter a vowel, we convert it to the size of the string
   minus the index position of the character, multiplied by the index position
   plus one. This is based on a pattern I figured out after 4 hours of working
   on this challenge.
4) Essentially, our equation allows us to find the all possible substring count
   of any character in the string (consonants too), based on the size of the
   full string, the character's index position in the full string and the
   character's ordinal position in the full string. We do this with no need
   whatsoever to break up the string into substrings.
5) The consonants will now be nil values because we performed no action on
   them in our map block, so we use compact to remove the nil values, then we
   sum the elements, which gives us our vowel count for all possible substrings
   of the string.
=end

def vowel_recognition_ms(s)
  s.chars.map.with_index {|c,i| (s.size - i) * (i + 1) if c =~ /[aeiou]/i}.compact.sum
end

=begin
Here is a method that passed 104 tests and failed 0, but timed out due to
inefficiency as it involves breaking the string into all possible substrings.
It is nonetheless useful to have so we can see how to generate substrings
without using permutation or combination, and creating a hash count of all the
characters in all the possible substrings allowed me to figure out the equation
which solved the challenge.
1) We create an empty hash called splits where we will store our substrings,
   we can also make this an empty string.
2) We create a while loop which runs as long as the size of the string is not
   0.
3) We then create a for loop with i as the block variable and we iterate the
   index of the string.
4) We add s[0..i] to splits on each iteration. So for example if our string is
   "aeiou", on the first iteration s[0..i] = s[0..0] = s[0] = "a", on the
   second iteration s[0..1] = "ae", third iteration s[0..2] = "aei". Once i
   becomes the last element of the string, we remove the first character from
   the string using gsub! and the regex (/^\w/, ''). The size of s is not 0, so
   out while loop runs again, making our for loop run again.
5) Essentially, if the size of our string is 5, our loop adds the first 1, 2,
   3, 4, 5, 1, 2, 3, 4, 1, 2, 3, 1, 2, 1 characters to splits, at which point
   gsub has removed all the characters from s, so the loop ends.
6) Now we have an array - or this could have been a string - of all possible
   substrings, we return that array.
7) To generate a count of each character in the subtring, on a string version
   of splits we can call .chars.group_by(&:itself).transform_values(&:size).
   Doing this allowed me to figure out the pattern/equation, which then
   allowed me to develop an algorithm effecient enough to pass the challenge.
8) To generate the vowel count, on a string version of splits we can call
   .gsub(/[^aeiou]/i, '').size. However, this method is not efficient for
   producing a vowel count.
=end

def vr_beta(s)
  splits = []
  while s.size != 0 do
    for i in 0..s.size-1
      splits << s[0..i]
      s.gsub!(/^\w/, '') if i == (s.size-1)
    end
  end
  splits
end

=begin
Here is another solution, adapted from another Codewars user's solution. Here
we iterate the index of the sting (no need for s.size-1 when we have ...) and
check whether each character in the string is a vowel, if so, we use our
equation, if not, we make that value 0. Then we sum.
=end

def vowel_recognition(s)
  (0...s.size).map {|i| s[i] =~ /[aeiou]/i ? (s.size - i) * (i + 1) : 0}.sum
end
