=begin
Codewars. 13/04/20. 'n-th reversible prime'. 6kyu. Here we create a method that 
returns reversible prime number in index position n. Reversible primes are prime 
numbers whose reverse also forms a prime number, including palidromes. Emirps are 
prime numbers whose reverse also forms a prime number, excluding palindromes. Here 
is a solution that allowed me to pass the challenge, once I had already passed the
challenge using a different solution.
1) We require the prime library.
2) We define our method reversible_prime, which takes one argument, n.
3) We created an empty array revs, where we will store all the reversible
   primes.
4) We call Prime.each(1_000_000) to iterate over the first million prime
   numbers, however, in many cases we are not going to need to.
5) We add the current iteration/prime number to revs if its reverse is also a
   prime number and we break out of the loop if the size of revs becomes more
   than n. So if we want the prime in index position 5, revs array will look
   like this [2, 3, 5, 7, 11, 13] and then the loop will cancel.
6) It's important to make the break point > n because n will be the index
   position of the reversible prime, so the prime in index position 5 is
   actually the 6th rev.
7) We return revs[n] to give us the reversible prime in that index position.
=end

require "prime"

def reversible_prime(n)
  revs = []
  Prime.each(1_000_000) do |prime|
    revs << prime if prime.to_s.reverse.to_i.prime?
    break if revs.size > n
 end
 revs[n]
end

=begin
My original solution involved creating a constant array containing all
reversible primes up to 1,000,000 - which I generated here in atom then copied
and pasted to Codewars - then simply indexing REVS[n] inside the method.
=end
