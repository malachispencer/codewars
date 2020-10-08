=begin
Codewars. 17/04/20. 'Simple prime streaming'. 6kyu. Here we create a method 
where, from a string sequence of consecutive prime numbers e.g. "235711131719232931..." 
we must return b elements starting from index position a. For the challenge, index 
positions go up to about 20,000. Here is the solution I used to solve the challenge.
1) We require the prime library.
2) In my original solution, I pre-generated a 20,000+ length string of
   consecutive prime numbers and stored it in a constant, PRIMES. For the sake
   of showing my work, here I've stored the generating of the string in the
   constant, doing this also passes on Codewars.
3) Using each on Prime prints out all the primes up to that number. On the
   other hand, using first or take will print out N number of primes specified.
   For creating the PRIMES string with the same length as what I've done here,
   I also could have done Prime.take(4392) or Prime.first(4392). So our primes
   up to 42,000 contains 4392 prime numbers.
4) Inside our method prime_stream, we simply index PRIMES from a, up to and
   excluding a + b. This gives us b elements starting from a.
=end

require "prime"

PRIMES = Prime.each(42000).to_a.join

def prime_stream_ms(a, b)
  PRIMES[a..a+b]
end

=begin
Here is another solution, submitted by a Codewars user. It simply creatings a
string of the first 4392 prime numbers, then returns a substring starting from
a and being b in length. Short and sweet.
=end

def prime_stream_alt(a,b)
  Prime.first(4392).join[a,b]
end

=begin
Here is one more solution, which I adapted based on a Codewars user's solution.
It simply takes a + b prime numbers, remember, this is a safe bet as the length
of the string will always be much higher than the amount of prime numbers in
it. For example, 4392 prime numbers has a string length of 20,534 and 56 prime
numbers has a string length of 139. So returning 6(b) elements from index
position 50(a) in the string can always be done by generating a + b primes.
Again, it returns the substring starting from a with a length of b.
=end

def prime_stream(a,b)
  Prime.take(a+b).join[a,b]
end
