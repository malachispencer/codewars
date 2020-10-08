=begin
Codewars. 15/05/20. 'String subpattern recognition I'. 6kyu. Here we create a 
method that returns true or false if a string is a repitition of a shroter 
subpattern or not. Here is the solution I developed to solve the challenge.
1) We define our method has_subpattern_ms?, which takes a string as its
   argument.
2) We use a regex with the case equality operator to see if our string is a
   repetition of a subpattern or not.
3) In our regex, \A asserts the start of the string, (\w+) is CG1, matching 1
   or more letters, numbers or underscores, (\1)+ is a 1 or more instances of
   CG1 and \z asserts the very end of the string, including newlines.
4) Essentially our regex captures whether the entire string is a repetition of
   a subpattern, if so, the case equality operator returns true, if not, it
   returns false.
=end

def has_subpattern_ms?(s)
 /\A(\w+)(\1)+\z/ === s
end

=begin
Here is another solution, it is short but not as efficient as my regex
solution as it involves doubling the string.
1) We add a copy of the string onto the string, so now we have a doubled s.
2) We call the index method on doubled s to find the first occurrence of s
   inside doubled s and we start the search at position 1, otherwise all will
   return 0 because obviously starting at 0 is a perfect fit.
3) If the first occurrence of s inside doubled s is not the length of s, it
   means s is a repitition of a subpattern and so true is returned, if the
   first occurrence of s is at the index position equal to the length of s, the
   string is not a repetition of a subpattern and so false is returned.
4) Here is how the index method is working for (true) subpattern strings:
   "123a123a123a123a123a123a"
       "123a123a123a" - Position 4 we get a perfect fit.
   "abababababababab"
     "abababab" - Position 2 we get a perfect fit.
5) Here is how the index method is working for (false) non-pattern strings:
   "ababababaababababa"
            "ababababa" - Position 9 (s.length) we get a perfect fit.
=end

def has_subpattern?(s)
  (s + s).index(s, 1) != s.length
end

=begin
Here is an iterative approach that was fast enough to pass all the tests
without timing out.
1) We return false if the length of the string is 1.
2) Using the upto iterator, we iterate the index of the string.
3) If the substring up to and including the index, is included in the rest of
   the string (including index), we get the proportion of the rest of the string
   by dividing the full string size by our current proportion and store this in
   a variable rpp. We then take our current proportion size, multiply it by the
   proportion of the rest of the string to make it the length of the original
   string, and if this string is equal to our original string, we return true.
4) If this does not occur on any iteration, we return false.
5) If our input is "123a123a123a", on the first iteration it checks if "1" is
   included in "123a123a123a", it does, 12 / 1 = 12. So "1" * "12" =
   "1111111111". Obviously this is not equal to the original string.
6) By the time i = 3 (4th iteration), s[0..i] = "123a" and
   s[i..-1] = "a123a123a" so it includes that substring. rpp = 12 / 4 = 3.
   "123a" * 3 = "123a123a123a", which is equal to our original string, so our
   method returns true.
7) Our method never actually iterates all the way up to the end of the string's
   index, it stops when the substring is not included in the rest. For example,
   when the string is "ababababa" and i = 5, s[0..i] = "ababab" and this is not
   included in "baba" so at this point our method returns false. In such cases
   the string is definitely not a repitition of a subpattern.
=end

def has_subpattern_x?(s)
  return false if s.size == 1
  0.upto(s.size-1) do |i|
    if s[i..-1].include?(s[0..i])
      rpp = s.size / s[0..i].size
      return true if s[0..i] * rpp == s
    else
      return false
    end
  end
end
