=begin
Codewars. 22/04/20. 'Gap in Primes'. 5kyu. Here we create a program that returns 
the first pair of successive primes in a certain range that have a specified gap. 
Here is the solution I used to solve the challenge.
1) We require the prime library.
2) We define our method gap, which takes 3 arguments. g is the gap between the
  successive primes we are looking for. l is the lower end of the range we are
  searching in and h is the higher bound, both inclusive.
3) We create a range from l to h then iterate over each number (n) in it.
4) We skip that number if it's not a prime number.
5) If n is a prime number, and n + g (the gap) is equal to a prime number, and
   n + 1 up to but not including n + g contains no prime numbers, we have found
   a successive pair of primes with the specified gap, so we return [n, n + g]
   immediately to return the first pair that matches.
6) If no pair is found in the range, we return nil.
=end

require "prime"

def gap(g, l, h)
  (l..h).each do |n|
    next unless n.prime?
    return [n, n + g] if (n + g).prime? && (n+1...n+g).none?(&:prime?)
  end
  nil
end

=begin
4 solutions that involved generating from the prime library - including 3 that
are actually in solutions - timed out. However, here is something I've been
wondering how to do for a while, generating primes within a given range,
instead of merely up to.
=end

def prime_range(lower_bound, higher_bound)
  Prime.each(higher_bound).select {|prime| prime >= lower_bound}
end
