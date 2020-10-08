=begin
Codewars. 12/04/20. 'Total Primes'. 6kyu. Here we create an algorithm that grabs 
the amount of total (or full) primes in a range. A total prime is a prime number 
whose digits are also all prime numbers. Here is the solution I used to pass 
the Codewars challenge.
1) We require the prime library.
2) We define our method total_primes_count, which takes 2 arguments, a and b,
   the upper and lower bounds - non-inclusive - of our range.
3) Using the take_while method on the prime class, we generate an array of all
   the prime numbers that are less than b and store this in primes_up_to_b.
4) We call the count method on primes_up_to_b and specify that we count all the
   numbers which are greater than a, and when converted to a string, contain
   2,3,5 or 7 - prime digits.
5) In our regular expression, we use the pattern matching operator =~. \A and
   \Z are the anchors defining the start of the string and the end of the
   string respectively. [2357] specifies that we are looking for [2 or 3 or 5
   or 7] and + specifies that we are looking for 1 or more of them.
=end

require "prime"

def total_primes_count(a, b)
  primes_up_to_b = Prime.take_while {|num| num < b}
  primes_up_to_b.count do |n|
    n > a && n.to_s =~ /\A[2357]+\Z/
  end
end

=begin
Here is a method I tried to use which passed all the tests, but was too slow in
doing so so it didn't allow me to pass the challenge. Because this solution
iterates over even non-prime numbers in the range, then requires yet another
iteration over num.digits, it is highly inefficient in performing the task.
Even when the all? loop was replaced with the regex, this approach was still
too slow to pass the challenge on Codewars.
=end

def total_primes_beta(a,b)
  (a..b).count do |num|
    num.prime? && num.digits.all? {|d| d.prime?}
  end
end
