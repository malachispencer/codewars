=begin
Codewars. 01/06/20. "Basic DeNico". 5kyu. Here we create a method that takes a key, a string consisting of unique letters, and a string
with an encoded message. We must use the key to decode the message. First we create a numeric key by substituting each letter in the
provided key with its position in that key when sorted alphabetically. For example, crazy sorted alphabetically is acryz so crazy becomes
23154. Here is the string "cseerntiofarmit on" using our "crazy" key:

1 2 3 4 5     2 3 1 5 4  
---------     ---------
c s e e r     s e c r e
n t i o f     t i n f o
a r m i t     r m a t i
  o n         o n

My original solution won't feature here as it passed all tests but sometimes fails 1-4 random tests. 3 other solutions submitted by
other Codewars users also do the same. Here is a solution that doesn't fail any random tests.
1) We define our method de_nico, which takes the key and the encoded message as its arguments.
2) First we create our numeric key by calling gsub on the word key. Each letter in the key is replaced with its index position when 
   the letters are sorted e.g. "crazy" sorted is "acryz" so the key becomes "12043". We then call the scan method and convert this 
   string numeric key into an array of digits, which we map over and convert all string digits to integers.
3) We then call scan on the message and convert it into an array of subtrings from 1 to the size of the key.
4) Now we map over the array of substrings, convert each substring to an array of its characters then call the values_at method.
5) The values_at method returns an array of all the elements at the given indices. We pass in a splat argument kd with our method, which
   means each letter in the substring will be replaced with the letter whose index position is equal to the same-indexed element in kd. For
   example, "c" is replaced with kd[0] = 1, 1 in the substring is "s"; "s" is replaced with kd[1] = 2, 2 in the substring is "e"; "e" is
   replaced with kd[2] = 0, 0 in the substring is "c"; "e" is replaced with kd[3] = 4, 4 in the substring is "r"; "r" in the substring is
   replaced with kd[4] = 3, 3 in the subtring is "e".
6) Now our array of substring character sub-arrays has been decoded. We join the entire array into a string. Then we call rstrip to remove
   trailing whitespace. rstrip = removes trailing, strip = removes leading and trailing.
=end

def de_nico(k,m)
  k = k.gsub(/(.)/) {k.chars.sort.index($1)}.scan(/\d/).map(&:to_i)
  m.scan(/.{1,#{k.size}}/).map {|s| s.chars.values_at(*k)}.join.rstrip
end