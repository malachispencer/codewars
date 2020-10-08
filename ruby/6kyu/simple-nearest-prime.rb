=begin
Codewars. 13/04/20. 'Simple nearest prime'. 6kyu. Here we develop an algorithm 
which tells us the nearest prime of a number. If the above and below primes are 
equal in difference to the number, the below prime is returned. If the number is 
itself a prime number, we simply return the number. Here is the solution I used 
to solve the Codewars challenge.
1) We require the prime library.
2) We define our first method nearest_prime, which takes the number as its
   argument, num.
3) We return num if it's a prime number.
4) Now we return the product of either bef_prime or aft_prime, these methods
   both run recursively until they detect a prime number, at which point that
   prime number comes the return value of that method.
5) If the difference between num and bef_prime is smaller or equal to the
   difference between num and aft_prime, we return bef_prime, it is the
   nearest prime. If not, we return aft_prime, because that is the nearest
   prime. We could put this conditional all on one line and use the ternary
   operator, but that line is too long for my liking.
6) Our bef_prime and aft_prime methods will both take the num we entered into
   nearest_prime, decrement and increment by 1, if the new num is a prime, this
   becomes the return value of the method, if not, the method runs
   recursively. This process continues until both have prime numbers as their
   return values, which we then use in the conditional of nearest_prime.
=end

require "prime"

def nearest_prime(num)
  return num if num.prime?
  return bef_prime(num) if num - bef_prime(num) <= aft_prime(num) - num
  aft_prime(num)
end

def bef_prime(num)
  num -= 1
  num.prime? ? num : bef_prime(num)
end

def aft_prime(num)
  num += 1
  num.prime? ? num : aft_prime(num)
end

=begin
Here is a refactored version of a solution submitted by a Codewars user.
1) We create 2 variables, which are both equal to num, up and down, these will
   be incremented and decremented respectively.
2) We increment up by 1 while up is not a prime number, so when it does
   become a prime number, its final value will be that prime number.
3) We decrement down by 1 until it is a prime number.
4) If the difference between num and down (the lower prime) is smaller than or
   equal to the difference between num and up (the higher prime), we return
   down as its the nearer prime. If not, we return up.
5) In the cases where num is a prime number, the incrementing and
   decrementing will not be done, and the differences will be exactly the
   same, both down and up will be num. So we'll get num returned, without
   explicitly needing to handle this special case.
=end

def nearest_prime_v2(num)
  up = num
  down = num

  up += 1 while !up.prime?
  down -= 1 while !down.prime?

  num - down <= up - num ? down : up
end
