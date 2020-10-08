=begin
Codewars. 22/05/20. 'Proof Read'. 6kyu. Here we create a method that takes a 
string where the "i"s and "e"s in words have been swapped around and random 
letters have been capitalized, our method must correct all spelling mistakes 
and only capitalize the first letter of each sentence. Here is the solution 
I developed to solve the challenge.
1) We define our method proofread_ms, which takes a the dirty string as its
   argument.
2) On the string we call the gsub method, and match for every instance of an
   "i" next to an "e" (i)(e), case insensitive. We swap all of these instances
   around the correct our spelling mistakes.
3) We then call split on s to turn our string into an array of words. All up
   to this point is stored in an updated s variable.
4) We then call map with index on the array of words, if it's the word is the
   first in the string, we capitalize it, if the previous word had a full stop
   in it - which would of course be at the end - we capitalize it. All other
   words are downcased.
5) Now we join our array of words back into a proof read string.
=end

def proofread_ms(s)
  s = s.gsub(/(i)(e)/i) {"#{$2}#{$1}"}.split 
  s.map.with_index {|w,i| w == s[0] ? w.capitalize : s[i-1] =~ /\./ ? w.capitalize : w.downcase}.join(" ")
end

=begin
Here is a shorter solution, submitted by a Codewars user.
1) We downcase the entire string.
2) We call gsub on the string and instead of using a regex as we normally do,
   we use string replacement syntax as if we were using the tr method. This
   corrects all our spelling mistakes.
3) We then call capitalize on the string, which upcases the first letter
   in the string.
4) We then call gsub on the string once again, in our regex we match a full
   stop \., followed by a space, followed by any letter ([a-z]). We call
   upcase on the only capture group, the letter.
5) The string is now proof read.
=end

def proofread(s)
  s.downcase.gsub("ie","ei").capitalize.gsub(/\. ([a-z])/, &:upcase)
end
