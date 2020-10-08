=begin
Codewars. 23/04/20. 'Sum of prime-indexed elements'. 6kyu. Here we create a 
method that takes an array of integers and sums all the numbers whose index 
positions are prime numbers. Here is the solution I developed to solve the challenge.
1) We require the prime library.
2) We define our method prime_index_sum_ms, which takes one argument, arr, the
   array of integers.
3) We initialise a counter variable, sum, to 0.
4) We iterate over the array using each_with_index, if the index is not a
   prime number we skip the corresponding element, we increment sum with the
   value of all the other elements (those whose index is a prime number).
5) We return sum.
6) The semi colon in Ruby can be used to place multiple commands together on
   the same line.
=end

require "prime"

def prime_index_sum_ms(arr)
  sum = 0 ; arr.each_with_index {|n,i| next if !i.prime? ; sum += n} ; sum
end

=begin
Here is another solution, submitted by a Codewars user. It positively selects
those numbers with prime index positions and sums them.
=end

def prime_index_sum_alt(arr)
  arr.select.with_index {|n, i| i.prime?}.sum
end
