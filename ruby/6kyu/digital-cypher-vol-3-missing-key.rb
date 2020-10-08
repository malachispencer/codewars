=begin
Codewars. 20/05/20. 'Digital cypher vol 3 - missing key'. 6kyu. The digital 
cypher assigns a unique number to each letter in the alphabet e.g. a = 1, b = 2, 
z = 26 etc. In the encypted word we write the corresponding numbers instead of 
the letter e.g. "scout" becomes [19 3 15 21 20]. Then we add to each number a 
digit from a key (repeated if necessary), for example if the key is 1931, our 
example becomes [20 12 18 30 21], this was made from 1 + 19, 9 + 3, 3 + 15, 
9 + 21, 1 + 20. Here we create a method that takes a string message, and a code 
(that string's encryption), we must figure out the key that was used to encode 
the string and return the shortest possible key. Here is the solution I developed 
to solve the challenge.
1) We define our method find_the_key_ms, which takes a string, the original
   message, and an array of integers featuring a code, what the original string
   has been encoded to.
2) In a variable called k (for key), we convert the message to an array of
   bytes, then we map over these with index.
3) For each of the string character's ASCII value, we subtract it by 96 to turn
   it into the letter's unique number i.e. position in the alphabet. We then
   subtract the letter's alphabet position from each element at the same index
   position in code.
4) For example, if "scout" is our string and our code is [20,12,18,30,21],
   the alphabet positions of the string letters are [19, 3, 15, 21, 20]. So
   we're doing c[0] = 20 - 19 = 1 on the first iteration, c[1] = 12 - 3 = 9 on
   the second, 18 - 15 = 3 on the third, 30 - 21 = 9, and 21 - 20 = 1.
5) Now we have our potential key, 19391, but we have to find the shortest
   possible key that can encode the string. For example, with "nomoretears" as
   the string and [15,17,14,17,19,7,21,7,2,20,20] as the code, k = [1,2,1,2,1,
   2,1,2,1,2,1], but we can clearly see that [1,2] could encode the string.
6) We iterate the index of k, and inside this loop, we once again convert
   the original string to an array of its character's ASCII values, then we
   map over this string with index.
7) In this nested loop, we attempt to turn the string's alphabet positions
   into the original code input, with the shorest key possible. So on the first
   iteration we use only k[0], second k[0..1], third k[0..2] and so on.
   Essentially, here we are finding the shortest possible key that can encode
   the string into the code we were provided with.
8) In this nested map block, we rotate k according to the index of the
   string, because our key won't be the same length as our string. As soon we
   have a portion of k that can successfully turn the key + the alphabet
   position into the code, we join that portion, convert it to an integer and
   return it.
9) For input "scout" and k = 19391, using just 1 to encode produces [20,4,16,
   22,21]; using 19 produces [20,12,16,30,21]; using 193 produces [20,12,18,22,
   29]; using 1939 produces [20,12,18,30,21], which matches code, so we return
   1939.
10) For input "nomoretears" and k = 12121212121, using just 1 produces
    [15,16,14,16,19,6,21,6,2,19,20]; using 12 produces [15,17,14,17,19,7,21,7,
    2,20,20], which is the same as code, so we return 12.
=end

def find_the_key_ms(m, c)
  k = m.bytes.map.with_index {|b,i| c[i] - (b - 96)}
  0.upto(k.size-1) do |i|
    return Integer(k[0..i].join) if m.bytes.map.with_index {|b,mi| k[0..i].rotate(mi)[0] + (b - 96)} == c
  end
end

=begin
Here is another solution, submitted by another Codewars user.
1) First we call the zip method on code, and pass in the message as an array
   of characters. This returns an array of arrays where each sub-array is
   holds the same-indexed elements from both the code and the msg arrays.
2) We then map over this array of arrays and inside each sub-array, we
   subtract the ASCII value of the character from the code number, then add 96.
3) This gives us the exact same results as first subtracting 96 from the
   ASCII value, then subtracting this value from the code value, as I did in
   my method.
4) We then join this array of our key and store it in a variable k.
5) Now we must find the shorest possible key that can encode the message.
6) Inside a variable call l for length, we iterate from 1 up to and including
   the length of code, then call the find method to return the first number
   which returns true for our block.
7) In our block, we take each portion of the key from 0 up to but not including
   i, then multiply this by the length of code, if the portion of this from
   0 up to but not including the length of code is equal to the key, we have
   found our shorest possible substring and so i returns true and is stored in
   l.
8) We then return k up to but not including l, converted to an integer.
=end

def find_the_key(msg, code)
  k = code.zip(msg.chars).map {|c,m| c - m.ord + 96}.join
  l = (1..code.size).detect {|i| (k[0, i] * code.size)[0, code.size] == k}
  Integer(k[0, l])
end
