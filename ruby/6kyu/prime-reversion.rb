=begin
Codewars. 04/05/20. 'Prime reversion'. 6kyu. In the range 0 to 10 we have the 
following prime pairs: [2,2], [2,3], [2,5], [2,7], [3,3], [3,5], [3,7], [5,5], 
[5,7] and [7,7]. Let's take one pair, 2 and 7, multiply them, 2 * 7 = 14, then 
sum the digits of the product, 1 + 4 = 5. 5 is a prime number, so 2 and 7 is a 
pair in the range 0 to 10 that reverts to prime. In the range 0 to 10, there 
are 4 prime pairs that revert to prime. Here we create a method that returns 
the number of pairs that revert to prime in a range. Here is the solution I 
developed to solve the challenge.
1) We require the prime library.
2) We define our method revert_to_prime_ms, which takes a (inclusive) and
   b (non-inclusive) as the lower and upper bound of our range.
3) We generate every prime number up to but not including b, then we select
   only the primes equal to and above a.
4) Because we need to check duplicate pairs e.g. [2,2], [23,23], we call the
   flat_map method with [p,p] to duplicate every prime number in the array, if
   we just did map we'd get an array of arrays with each element looking as
   follows [11,11].
5) We call the combination method with 2 passed in so that we get every
   original array ordered combination of 2 elements in the array, thereby
   generating our pairs, however, we also call the uniq method so we remove
   duplicate pairs, as we will have many.
6) Now we have an array of arrays with prime pairs in each sub-array, we call
   the count method and count up all the pairs that revert to prime i.e. by
   multiplying the pair, then summing the digits of the product.
=end

require "prime"

def revert_to_prime_ms(a,b)
  Prime.each(b-1).select {|p| p >= a}.
    flat_map {|p| [p,p]}.combination(2).uniq.
      count {|x,y| (x * y).digits.sum.prime?}
end

=begin
Here is a refined version of my solution.
1) We generate all primes up to and including b.
2) Rather than select, we use the grep method to grap all prime numbers from a,
   up to but not including b.
3) Rather than flat_map, combination and uniq, we do all that work with one
   method, repeated_combination, which gives us our prime pairs with a
   duplicate combination included.
4) We then count up all the prime pairs in the range which revert to prime.
=end

def revert_to_prime(a,b)
  Prime.each(b).grep((a...b)).
    repeated_combination(2).
      count {|x,y| (x * y).digits.sum.prime?}
end
