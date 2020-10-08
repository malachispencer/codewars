=begin
Codewars. 21/05/20. "GA-DE-RY-PO-LU-KI cypher vol 3 - Missing key". 6kyu. Here
we create a method that finds the missing key when provided with a string
array of messages and a string array of those messages encrypted in
GADERYPOLUKI encoding. Here is the solution I developed to solve the
challenge.
1) We define our method find_the_key_ms, which takes an array of strings
   featuring messages pre-encoding (messages), and an array of strings
   featuring those same messages post GADERYPOLUKI encoding (secrets).
2) We turn the messages into a string, and we turn the secrets into a string.
3) We initialize an empty array where we will store key pairs.
4) Both strings have the same length and all the messages and secrets are in
   the same index positions, so we iterate the length of them using a for loop.
5) As we iterate the index of both strings, if we encounter 2 different
   characters, we've found a key pair, so we add this pair - inside an array,
   sorted - to k. However, if k already contains this key pair, we don't add
   it, this saves us having to use uniq later to remove duplicates. The pairs
   must be sorted as per the requirement of the kata.
6) Now we have an array of arrays with all our key pairs, we sort this array
   so that they are in alphabetical order based on the first of each pair,
   then we join the array of arrays into a string.
7) We now have our string of key pairs.
=end

def find_the_key_ms(m,s)
  m = m.join ; s = s.join ; k = []
  for i in 0...m.size
    k << [m[i],s[i]].sort if m[i] != s[i] unless k.include?([m[i],s[i]].sort)
  end
  k.sort.join
end