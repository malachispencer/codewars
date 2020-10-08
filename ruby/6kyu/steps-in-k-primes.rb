=begin
Codewars. 22/04/20. "Steps in k-primes". 6kyu. A number is called k-prime if it
has exactly k prime factors, counted by the amount of exponentiation. Here we
create a method that returns all pairs of k-primes with a certain step between
them, within a given range. Here is the solution I developed to solve the
challenge.
1) We require the prime library.
2) We define our first method, k_prime_pairs, which takes 4 arguments. k, the
   amount prime factors the pairs must have. step, the difference the number
   pairs must have. min and max, the lower and upper bounds of our range, both
   inclusive.
3) We create an empty array, pairs, where we will store our k-prime-step pairs.
4) We iterate from min to max-step, this way we don't end up with pairs where
   the first is below max and the second is above max.
5) We add [n, n + step] to pairs if both numbers have the specified amount of
   prime factors.
6) We return the pairs. If no pairs were found, an empty array is returned.
7) In our k_primes method, we simply sum the exponents of n (and n + step),
   this gives us the amount of prime factors each number has.
=end

require "prime"

def k_prime_pairs(k, step, min, max)
  pairs = []
  (min..max-step).each do |n|
    pairs << [n, n + step] if k_primes(n) == k && k_primes(n+step) == k
  end
  pairs
end

def k_primes(n)
  n == 0 ? 0 : n == 1 ? 1 : n.prime_division.map(&:last).sum
end
