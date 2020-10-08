=begin
Codewars. 12/04/20. 'Surrounding Primes for a value'. 6kyu. Here we create a 
method that returns the surrounding prime numbers of a number, so the first 
prime before it and the first prime after it. Here is a refined version of my 
favourite solution submitted by a Codewars user, it's similar to the solution 
I used to solve the challenge.
1) We require the prime library.
2) We define our method surrounding_primes, which takes one argument, num, the
   number of which we're returning the surrounding primes.
3) To get the before prime, we call the take_while method on the prime class
   and generate an array of all the prime numbers less than num, the highest
   value in that array will be the before prime, so we call the max method
   on that array and store the result in bef_prime.
4) To get the after prime, we do Prime.detect with pr > num in the block so
   that we get the first prime number above num, we store this in the aft_prime
   variable.
5) We return bef_prime and aft_prime in an array, as requested by the Codewars
   challenge.
=end

require "prime"

def surrounding_primes(num)
  bef_prime = Prime.take_while {|prm| prm < num }.max
  aft_prime = Prime.detect {|pr| pr > num}
  [bef_prime, aft_prime]
end

=begin
Here is another solution from a Codewars user which uses helper methods and recursion.
1) We define our method surrounding_primes_v2, which takes one argument, num,
   the number for which we are returning the surrounding primes. This method
   returns our results and runs our other methods.
2) In our bef_prime method, the num we entered into surrounding_primes_v2 is
   passed in, then this number is decremented by 1, if it's a prime, bef_prime
   returns this number, if not, bef_prime is run again and that process
   continues until we get a prime number.
3) In our aft_prime method, the num we entered into surrounding_primes_v2 is
   passed in, then it is incremented by 1, if it's a prime number, aft_prime
   returns that number, if not, aft_prime runs again and this process repeats
   until it stumbles into a prime number.
4) surrounding_primes_v2 returns bef_prime and aft_prime values once both have
   detected a prime number.
=end

def surrounding_primes_v2(num)
  [bef_prime(num), aft_prime(num)]
end

def bef_prime(num)
  num -= 1
  num.prime? ? num : bef_prime(num)
end

def aft_prime(num)
  num += 1
  num.prime? ? num : aft_prime(num)
end
