=begin
Codewars. 19/04/20. 'Pure odd digits primes'. 6kyu. Prime numbers that only have 
odd digits are pure odd primes. Here we create a program that returns the amount 
of pure odd primes up to n, the largest pure odd prime below n and the first pure 
odd prime above n. Here is the solution I used to solve the Codewars challenge.
1) We require the prime library and the set class.
2) We create a constant array containing all primes up to the highest value of
   n in the tests, which was 100,000 for this challenge.
3) We define our method pure_odd_primes, which takes one argument, n.
4) We create a set called pure_odds, sets are faster to search in than arrays.
5) We iterate over PRIMES and add to the pure_odds set every prime less than n
   whose digits consist of only odd numbers. We check for the latter by
   converting the prime to a string and using a pattern matching regular
   expression. \A signifies the start of string, \Z signifies the end of the
   string, the numbers inside [] are what we are looking for and + allows for
   1 or more of any of them.
6) Inside an array, we return the size of pure_odds, which is the amount of
   pure odds below n; we return the largest value in pure_odds; and we return -
   by calling the method pure_above(n) - the first pure odd above n.
7) In our pure_above, we use the detect method and the regular expression to
   return the first pure odd prime above n.
=end

require "prime"
require "set"

PRIMES = Prime.each(100_000).to_a

def pure_odd_primes_ms(n)
  pure_odds = Set.new
  PRIMES.each do |p|
    pure_odds << p if p.to_s =~ /\A[13579]+\Z/ && p < n
  end
  [pure_odds.size, pure_odds.max, pure_above(n)]
end

def pure_above(n)
  Prime.detect {|p| p > n && p.to_s =~ /\A[13579]+\Z/}
end

=begin
Here is another solution, I created this based on another Codewars solution.
Here I accomplish everything without needing to create a constant, a set or
using 2 methods, it's all done in 1 method. When I generate primes, I do so up
to n instead of a hard coded number like 100,000, as I did in my original
solution.
=end

def pure_odd_primes(n)
  pure_odds = Prime.each(n).select {|p| p.to_s =~ /\A[13579]+\Z/}
  pure_above = Prime.detect {|p| p > n && p.to_s =~ /\A[13579]+\Z/}
  [primes.length, primes.last, pure_above]
end

=begin
Here is one more solution, taken from a Codewars user.
1) We initialize the 3 values we'll be returning, the count below n, the max
   below n and the first above n.
2) We iterate over each prime number, but using next and a regular expression
   we skip that iteration if the prime number's digits contain an even number.
3) We increment the count for each iteration below if p is below n.
4) max gets changed to p on each iteration less than n, until p is equal to or
   above n, at which point the value of max stays as the highest pure odd prime
   under n.
5) above gets changed to p when p becomes more than n, at which point, we
   break out of the loop, thereby leaving above as the first pure odd prime
   above n.
6) We return count, max and above in an array.
=end

def pure_odd_primes_alt(n)
  count, max, above = 0, 0, 0
  Prime.each do |p|
    next if p.to_s =~ /[02468]/
    count += 1 if p < n
    max = p if p < n
    above = p if p > n
    break if above > n
  end
  [count, max, above]
end
