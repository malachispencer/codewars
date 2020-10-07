=begin
Codewars. 31/05/20. 'FIRE and FURY'. 6kyu. The President's phone is broken, the only letters still working are upper case EFIRUY. We must 
decipher the president's tweets. FIRE = "You are fired!". FURY = "I am furious". In our tweet, any letters not spelling FIRE or FURY are 
simply ignored. If consecutives of the same word are found, plural rules apply e.g. FIRE x2 = "You and you are fired!", FIRE x3 = "You and 
you and you are fired!", FURY x2 = "I am really furious.", FURY x3 = "I am really really furious." If FIRE or FURY is found, or unexpected 
characters are encountered, it must be a "Fake tweet." Here is the solution I developed to solve the challenge.
1) We define our method fire_and_fury_ms, which takes a tweet in the form of a string as its argument.
2) If the tweet contains any character that is not E, F, I, R, U or Y, we have encountered unexpected characters so we return "Fake tweet."
3) So that we can remove all expected characters which don't form FIRE or FURY, we generate an array of every occurrence - in order of
   appearance in the string - of FIRE and FURY using scan.
4) If our array of FIRE and FURY is empty, we return "Fake tweet."
5) Now we group our array according to same consecutives using chunk_while, then map over the chunks.
6) If the first word in the sub-array is FIRE, we turn this sub-array into our deciphered string. Within this deciphered string we use
   string interpolation and do "and you " multiplied by the size of the sub-array minus 1. So if there's 1 FIRE in the sub-array, "and you "
   * 0 = "" so the chunk becomes "You are fired!". If there's 3 FIRE's, "and you " * 2 = "and you and you " so the chunk becomes
   "You and you and you are fired!".
7) If the first word in the sub-array is not FIRE, it must be fury, so in our false portion of the ternary operator, we do the same for
   " really" but this time we place the space at the start of really, putting no space between "am" and " really". We did the opposite for
   the FIRE cases.
8) Now the tweet is deciphered, we join it back into a string, with each sentence delimited by a space. 
=end

def fire_and_fury_ms(t)
  return "Fake tweet." if t.match(/[^EFIRUY]/)
  t = t.scan(/FIRE|FURY/) ; return "Fake tweet." if t.empty? 
  t.chunk_while(&:==).map {|w|
    w[0] =~ /FIRE/ ? "You #{"and you " * (w.size-1)}are fired!" : 
      "I am#{" really" * (w.size-1)} furious."}.join(" ")
end