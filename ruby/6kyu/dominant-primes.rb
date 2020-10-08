=begin
Codewars. 04/05/20. 'Dominant primes'. 6kyu. Dominant primes are prime numbers 
whose position in the prime sequence is also prime. The first five primes are 
2(1), 3(2), 5(3), 7(4) and 11(5). 3, 5 and 11 occupy prime positions in the 
sequence, so they are dominant primes. Here we create a method that takes a 
range from a to b, and returns the sum of the dominant primes in this range. 
Here is the solution I developed to solve the challenge.
1) To solve the challenge I used memoization because all other solutions I
   tried - which passed all the tests - were too slow to do the rest in time.
2) Therefore, here in Atom I generated a list of all prime numbers up to
   500,000 whose positions in the prime sequence are also prime. I did so with:
   primes = Prime.each(500_000).to_a
   primes.select {|p| (primes.index(p) + 1).prime?}
3) This array of dominant primes was then copied and pasted into Codewars and
   stored in the constant D_PRIMES, which I've placed below with just the first
   and last value.
4) Then we define our method dominant_primes_ms, which takes a, the lower end
   of a range, and b, the higher end of a range, both inclusive, as arguments.
5) We simply call the select method on D_PRIMES, extract the dominant primes
   equal to or above a and less than or equal to b, then sum them. Now we have
   the sum of dominant primes in our range.
=end

D_PRIMES = [3, 499729]

def dominant_primes_ms(a,b)
  D_PRIMES.select {|p| p >= a && p <= b}.sum
end

=begin
Here is another solution, submitted by a Codewars user.
1) We require the prime library.
2) We generate all the prime numbers up to b using Prime.each.
3) We call the select method and tag the with_index method onto it, then we
   pass 1 into with_index so that index positions start from 1 instead of 0.
   Now the array index is equivalent to the positions in the prime sequence
   rather than traditional array index positions.
4) In our block, we select all primes whose position in the sequence is prime.
5) Then we call the drop_while method to remove from our array all prime
   numbers below a (the lower end of our range).
6) Now we have an array of all dominant primes between a and b, we simply call
   inject(:+) to sum them.
=end

require "prime"

def dominant_primes(a,b)
  Prime.each(b).select.with_index(1) {|p,i| i.prime?}.
    drop_while {|p| p < a}.
      inject(:+)
end

=begin
Here is an even shorter solution to that above, here drop_while is not used to
remove elements below a, select simply takes primes equal to or above a, who
also have a prime position in the prime sequence. Then we sum these dominant
primes.
=end

def dominant_primes_x(a,b)
  Prime.each(b).select.with_index(1) {|p,i| p >= a && i.prime?}.sum
end
