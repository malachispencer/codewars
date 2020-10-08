=begin
Codewars. 20/05/20. 'Numericals of a String'. 6kyu. Here we create a method that 
takes a string and returns a string with the incremented count of each character. 
For example, "Hello, World!" should return "1112111121311" and "aaaaaaaaaaaa" should 
return "123456789101112". Here is the solution I developed to solve the challenge.
1) We define our method str_numericals_ms, which takes a string as its
   argument.
2) We initialize a counter hash.
3) We call gsub on the string and match every character except newlines.
4) In our gsub block we replace each character with its current count in the
   counter hash.
=end

def str_numericals_ms(s)
  h = Hash.new(0) ; s.gsub(/(.)/) {h[$1] += 1}
end

=begin
Here is another solution, submitted by a Codewars user. Rather than using gsub
like in my solution, it involves turning the string into an array of
characters, mapping over them and turning each character into its current
count in the counter hash, then joining it all back into a string.
=end

def str_numericals(s)
  h = Hash.new(0) ; s.chars.map {|c| h[c] += 1}.join
end
