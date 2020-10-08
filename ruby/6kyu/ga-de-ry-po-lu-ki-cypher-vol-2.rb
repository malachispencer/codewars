=begin
Codewars. 21/05/20."GA-DE-RY-PO-LU-KI cypher vol 2". 6kyu. The GADERYPOLUKI is
a simple substituion cipher used in scouting to encrypt messages, the
encryption is based on a simple key of paired letters. G-A, g-a, A-G, a-g, D-E,
d-e, E-D, e-d etc. Here we create 2 methods, one which encodes in GADERYPOLUKI
and one which decodes GADERYPOLUKI encoded messages. Here is the solution I
developed to solve the challenge.
1) We define our encode_ms method, which takes 2 strings, one message of that
   needs to be encoded, featuring uppercase letters, lowercase letters and
   spaces, and the key it will be used encoded with, which contains only
   lowercase letters.
2) In the key string, we only have lowercase letters so we add an upcase
   duplicate to the string.
3) The key string has all pairs next to each other, so using scan we generate
   an array of every 2 letters of our lower and uppercase pairs. We then map
   over this array of string pairs and convert each pair into an array of
   characters.
4) Finally, we convert the array of character pairs to a hash and store this in
   an updated key variable. Now we have our key pairs in a hash, with the
   first as the key and the second as the value. We do not generate the same
   the other way around, as this is unnecessary.
5) On our string that needs to be encrypted, we call the gsub method and our
   regex matches anything that is not a space ([^\s]).
6) In our gsub block, we first check if the character is a key in our hash
   k[$1], if so, we change it into the corresponding value of the hash
   (it's pair counterpart).
7) If the letter in the string is not a key in our hash, we check if it's a
   value in our hash using the value? method, if so, we return the
   corresponding key (it's pair counterpart) using the key method.
8) If the letter in the string is neither a key nor a value in our hash, we do
   not need to encode it, so we leave it the same.
9) Our string has now been GADERYPOLUKI encrypted.
10) To decode the string, we can use exactly the same method as we did to
    encode, because the process still involves creating a hash of our key pairs
    and then replacing them in the string. So our decode_ms method simply
    calls our encode_ms method and passes in the messasge and the key string.
=end

def encode_ms(s,k)
  k = (k + k.upcase).scan(/../).map(&:chars).to_h ; s.gsub(/([^\s])/) {k[$1] ? k[$1] : k.value?($1) ? k.key($1) : $1}
end

def decode_ms(s,k)
  encode_ms(s,k)
end

=begin
Here is a great solution which is very concise and uses the tr method.
1) We concatenate an upcase version of the key string, to the key string.
2) In a variable called code, we call gsub on the key string and our regex
   matches every 2 characters (..) i.e. the key pairs, we reverse every pair
   so now A comes before G, E comes before D etc.
3) We then call the tr method on the message and place the key in our "to be
   replaced" argument and the code in our "replace with argument". As the index
   positions of the pairs are reversed in code, this successfully replaces
   the letter in the string with its pair counterpart.
4) Our decode method can use exactly the same method as encode, so using the
   alias keyword, when we call the decode method, we call the encode method.
=end

def encode(s,k)
  k += k.upcase ; code = k.gsub(/(..)/) {$1.reverse} ; s.tr(k, code)
end

alias decode encode