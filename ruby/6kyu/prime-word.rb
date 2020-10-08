=begin
Codewars. 05/05/20. 'Prime Word'. 6kyu. Here we create a method that takes 
an array of 2 arrays e.g. [["Emma",30],["Liam",30]] and determines whether 
the names are prime words or not. If the name is a prime word the entire 
sub-array will be converted to a 1, if it isn't, it will be converted to a 0. 
To find out if a word is prime, we add the number next to the name to each 
ASCII value of every letter in the name, if the product of any of these is a 
prime number, the word is prime. Here is the solution I developed to solve 
the challenge.
1) We require the prime library.
2) We define our method prime_word_ms, which takes an array of 2 sub-arrays
   each holding a name and an integer, as its argument.
3) We map over the array and convert the first element in each sub-array - the
   names - to an array of characters, then we map over the array of characters
   and convert the letters to their ASCII values.
3) We then map over the ASCII values and add the integer to them.
4) Now we have an array of 2 sub-arrays, which contain the sum of the ASCII
   values of each letter of the name and the integer.
5) We then map over the array, then map over each sub-array and if the
   number in the sub-array is prime, we convert it to 1, if not, we convert it
   to 0.
6) Still inside our main array map, if any of the sub-arrays includes a 1, we
   convert that entire sub-array to 1, if it doesn't, we convert that entire
   sub-array to 0.
7) Now our input array has been formatted to return whether the name was a
   prime word or not e.g. [1,1], [1,0], [0,1] or [0,0].
=end

require "prime"

def prime_word_ms(arr)
  arr.map {|a| a.first.chars.map(&:ord).map {|c| c + a.last}}.
    map {|a| a.map {|n| n.prime? ? 1 : 0}.include?(1) ? 1 : 0}
end

=begin
Here is a shorter and cleaner solution, submitted by a Codewars user. It uses
2 maps instead using 4 like my solution.
1) We map over our array of arrays and declare 2 block variables, which
   represent the first and last element of each sub-array, nm for name and n
   for the integer.
2) We convert the name into an array of characters then map over it, convert
   each letter to its ASCII value and add the number to it.
3) We call the any? method to iterate over each sub-array and if there is a
   single prime number in that sub-array, it is converted to a 1, if not, it is
   converted to a 0.
4) Now our array and formatted to return whether the name was a prime word or
   not.
=end

def prime_word(arr)
  arr.map {|nm,n| nm.chars.map {|c| c.ord + n}.any?(&:prime?) ? 1 : 0}
end
