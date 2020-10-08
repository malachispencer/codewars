=begin
Codewars. 04/05/20. 'Prime Reduction'. 6kyu. Here we create a program that takes 
a range from a, up to but not including b, and returns all the prime numbers in 
that range which can be reduced to 1 by its sum of squared digits sequence. For 
example, with the prime number 23, 2**2 + 3**2 = 13, 1**2 + 3**2 = 10, 1**2 + 0**2 = 1. 
Here is the solution I developed to solve the challenge.
1) We require the prime library.
2) We define our method prime_reduction_ms, which takes a (inclusive) and b
   (non-inclusive) as the lower and upper bounds of our range.
3) We generate all the prime numbers up to b-1.
4) We call the select method and take only those primes up to b-1, that are
   equal to or greater than a.
5) We call the count method on all the prime numbers from a to b-1, and count
   those whose sum of squared digits reduction ends up at 1. This is where our
   second method is called.
6) Our reduced method takes the current number in our a to b-1 range as its
   argument.
7) If n is less than or equal to 4, we return it. If not, we recursively call
   the reduced method, where we square n's digits and sum them. This process
   continues until we get a number less than or equal to 4, at which point the
   method retuns that number.
8) Once a number is reduced to 4, it's sum of squared digits sequence will
   eventually end up at 4 again, so the prime which is reduced to 4 certainly
   won't be reduced to 1. Once a number is reduced to 3, it's sum of squared
   digits sequence will eventually end up at 4, so the prime that is reduced to
   3 can't be reduced to 1 either. A number reduced to 2, becomes 4 after its
   first ssd, so a prime reduced to 2 cannot be reduced to 1 either. No two
   positive integers can be summed to equal 0.
9) Even a number reduced to 5 ends up being 4. So we can safely assume 4 is the
   lowest point at which we can return n.
9) Our prime_reduction_ms method returns the count of all numbers whose
   sum of squared digits sequence ends up at 1.
=end

require "prime"

def prime_reduction_ms(a, b)
  Prime.each(b-1).select {|p| p >= a}.count {|p| reduced(p) == 1}
end

def reduced(n)
  n <= 4 ? n : reduced(n.digits.map {|d| d**2}.sum)
end
