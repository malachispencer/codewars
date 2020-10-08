=begin
Codewars. 11/04/20. 'When The Sum of The Divisors Is A Multiple Of The Prime Factors Sum'. 5kyu.
Here we create a program that returns all the numbers in a range that have a prime factor sum, 
which is a factor of its divisor sum. In other words, its prime factor sum is a divisor of its 
divisor sum. Here is the solution which allowed me to pass the Codewars challenge.
1) We require the prime library.
2) We define our first method, which returns the result and runs our other
   methods, pfs_factor_of_ds. It takes 2 arguments, the min and max numbers of
   the range we are looking in.
3) We create our range from min to max then call the select method, in our
   block we specify that the method returns all numbers in the range which
   have a prime factor sum which is a divisor of its divisor sum.
4) In div_sum, we sum the divisors of the numbers in our range. This is the
   most effecient divisor sum method I've developed to date.
5) In our pf_sum method, which takes one argument, the number in our range, it
   first checks if num is 1, in which case it returns 1. If 1 was run
   through the rest the method, it would return a nil value and the whole
   program would get an error.
6) If num is not 1, we call the prime_division method on it, which an array of
   arrays which each contained array holding a prime factor and its exponent.
7) We map over this array of arrays and make our block variables pf for prime
   factor and exp for exponent. We multiply the prime factors by the exponents
   then call inject to add them all up. This gives us the prime factors sum.
8) As stated before, our pfs_factor_of_ds then returns all numbers in the
   range where the number's prime factor sum is a divisor of the number's
   divisors sum.
=end

require "prime"

def pfs_factor_of_ds(min,max)
  (min..max).select { |num| div_sum(num) % pf_sum(num) == 0 }
end

def div_sum(num)
  divs = []
  (1..Math.sqrt(num)).each do |e|
    divs << e + (num / e) if num % e == 0 && e != (num / e)
    divs << e if num % e == 0 && e == (num / e)
  end
  divs.inject(:+)
end

def pf_sum(num)
  num == 1 ? 1 : num.prime_division.map {|pf,exp| pf * exp}.inject(:+)
end
