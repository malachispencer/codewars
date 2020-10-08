=begin
Codewars. 02/06/20. "Recover a secret string from random triplets". 4kyu. We are given a collection of random triplets from which we must
recover a secret string. In each random triplet, we are given a (not necessarily consecutive) order of appearance of letters in the secret 
string. No letter occurs more than once in the secret string. After seeing Owen Patrick F. Falculan's Python solution in his YouTube
tutorial, here is the adaptation I built to solve the challenge.
1) We define our method recover_secret_ms, which takes an array of arrays where each sub-array contains not necessarily consecutive but
   ordered random triplets from the secret string.
2) We intialize an empty string, where we will store our secret string.
3) We then iterate over each sub-array, making a block variable for each triplet, x (the 1st), y (the 2nd) and z (the 3rd).
4) In our block, if x is not included in the secret string s, we concatenate it to the front of s using prepend. Likewise, if y is not 
   included in s, we concatenate it to the front of s.
5) We then get to our first sorting part. If y is included in s but its index position is less than that of x, we remove y from s, then
   reinsert it into the string 1 position after x. Remember, a y always comes after an x in the secret string.
6) Now we get to z, if this is not included in s, we concatenate it to the front of the string using prepend. Then if the index position of
   z in s is less than the index position of y in s, we remove z from s then reinsert 1 position after y.
7) This process is performed as we iterate each triplet, because our triplets always have x, y and z in order of appearance in the secret
   string, once we've iterated all triplets we'll have a correctly sorted secret string. Our use of the index method with s is fine because
   no letter occurs more than once in the secret string.
8) [['t','u','p'],['w','h','i'],['t','s','u'],['a','t','s'],['h','a','p'],['t','i','s'],['w','h','s']] returns "whatisup" but let's take
   a look at how our algorithm on it to see how it works.
9) 1) t", s = "t"; "u", s = "ut"; index position of "u" is less than "t", so we slice then reinsert and s = "tu"; "p", s = "ptu"; index
      position of "p" is less than that of "u" so we slice and reinsert then s = "tup". 
   2) "w", s = "wtup"; "h", s = "hwtup"; index position of "h" is less than that of "w", so we slice and reinsert and then s = "whtup"; 
      "i", s = "iwhtup"; index position of "i" is less than that of "h" so we slice and reinsert then s = "whitup". 
   3) "t" is already included so no need to add it; "s", s = "swhitup"; index position of "s" is lower than that of "t", so we slice and 
      reinsert then s = "whitsup"; "u" is already in s so no need to add it; index position of "u" is not lower than "s" so no sorting 
      needed. 
   4) "a", s = "awhitsup"; "t" is already included so no need to add it; index position of "t" is not less than that of "a" so no need for 
      sorting; "s" already included; index position of "s" is not lower than that of "t" so no need for sorting. 
   5) "h" already included; "a" already included; index position of "a" lower than "h", slice and reinsert then s = "whaitsup"; "p" is 
      already included; index position of "p" not lower than "a". 
   6) "t" already included; "i" already included; index position of "i" less than "t", slice and reinsert then s = "whatisup"; "s" is 
      already included; "s" index not lower than "i" index. 
   7) "w" already included; "h" already included; "h" index not lower than "w" index; "s" already included; "s" index not lower than "h" 
      index.
=end

def recover_secret_ms(t)
  s = ""
  t.each do |x,y,z|
    if s !~ /#{x}/ ; s.prepend(x) ; end
    if s !~ /#{y}/ ; s.prepend(y) ; end
    if s =~ /#{y}/ && s.index(y) < s.index(x) ; s.slice!(s.index(y)) ; s.insert((s.index(x)+1), y) ; end
    if s !~ /#{z}/ ; s.prepend(z) ; end
    if s =~ /#{z}/ && s.index(z) < s.index(y) ; s.slice!(s.index(z)) ; s.insert(s.index(y)+1, z) ; end
  end
  s
end
