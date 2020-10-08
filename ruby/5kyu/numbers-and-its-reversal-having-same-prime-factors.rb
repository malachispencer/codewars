=begin
Codewars. 12/04/20. 'Numbers and its Reversal Having Same Prime Factors.' 5kyu.
Here we create a program which searches a range of numbers and returns every 
number whose reverse has the same prime factors (exlcuding the exponents). For 
example, the prime factorisation of 1089 is 3,3,11,11 so its primes are [3,11], 
the prime factorisation of 9801 is 3,3,3,3,11,11 so its primes are [3,11]. We will 
not return palidromes e.g. 171, 454, 4224. Here is the soltuion I used to solve 
the Codewars challenge.
1) We require prime library.
2) We open up the Numeric class to add some custom methods that we are going
   to be able to call directly on an integer.
3) The first of these methods is primes, where we use the prime_division
   method to return the array of arrays where each contained array holds a
   prime factor and its exponent. We map over these and return only the primes,
   which will come in the format [2, 3, 7], so exponents are exlcuded.
4) As the built-in reverse method can't be called on an integer, we create an
   int_reverse method. We convert the integer to a string, reverse it, then
   convert it back to an integer.
5) Our same_prime_factors method performs our extraction process, it takes one
   argument, max, the highest number in the range of numbers we are searching
   in.
6) We create our range from 1 to max, then call select and make our block
   variable num. We return the nums whose primes are the same as the primes of
   num.int_reverse, excluding the palidromes i.e. num and num.int_reverse are
   the same.
=end

require "prime"

class Numeric
  def primes
    self == 1 ? 1 : self.prime_division.map {|pf,_| pf}
  end

  def int_reverse
    to_s.reverse.to_i
  end
end

def same_prime_factors(max)
  (1..max).select do |num|
    num.primes == num.int_reverse.primes unless num == num.int_reverse
  end
end

=begin
Here is another solution, taken from a Codewars user, it's much shorter than
mine and accomplishes everything in one method.
1) We define our method same_prime_factors_v2, which takes the max number in
   the range we are searching in as its sole argument.
2) We create our range from 2 to max and call the find_all method, making our
   block variable num.
3) We create our reversed num and store it in a variable called num_r. We do
   this using the digits method, which converts an integer into an array of
   digits, reversed. We then join that array and convert it back to an integer.
4) In our block evaluation, we first specify that num be not equal to num_r
   and we also specify that that the prime factors (excluding the exponents)
   of num and num_r be the same.
5) prime_division returns an array of arrays e.g. [[2, 1], [3, 1], [7, 1]] so
   we use map(&:first) because the primes are the first element in each
   contained array. If these are equal for num and num_r, they have the same
   prime factors. Remember, exponents are ignored.
=end

def same_prime_factors_v2(max)
  (2...max).find_all do |num|
    num_r = num.digits.join.to_i
    num_r != num && num.prime_division.map(&:first) == num_r.prime_division.map(&:first)
  end
end
