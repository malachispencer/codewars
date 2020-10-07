=begin
Codewars. 16/04/20. 'Find the unique number'. 6kyu. Here we create a method 
that allows us to find the unique number in an array, the numbers are always 
integers between 1 and 2147483647 and the array may contain millions of numbers 
so the method needs to be optimized for speed. I tried to solve this challenge 
using the select and count method but this was ineffcient. A much more efficient 
way to count values in an array is to use a counter hash. Here is the solution 
that allowed me to pass the Codewars challenge.
1) We define our method find_unique, which takes an array of integers, nums.
2) We call each_with_object on nums and pass in a hash, initialized to 0, this
   defaul value is what allows us to use our hash as a counter.
3) Our first block variable num represents each integer in the array and our
   second block variable, hash, represents our hash.
4) We make the keys our hash the integers in our array and each time num is
   encountered, the value will be incremented by 1.
5) On the end of our block we tag the hash method key, which returns the key
   holding the given value, so we pass in 1, as this will be our unique number.
=end

def find_unique(nums)
  nums.each_with_object(Hash.new(0)) {|num, hash| hash[num] += 1}.key(1)
end

=begin
Here is another solution, submitted by a Codewars user. It uses the reduce
method and the Bitwise XOR (^) operator.
=end

def find_unique_x(numbers)
  numbers.reduce(:^)
end
