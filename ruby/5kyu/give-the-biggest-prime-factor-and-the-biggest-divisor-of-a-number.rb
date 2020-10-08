=begin
Codewars. 18/04/20. 'Give The Biggest Prime Factor And The Biggest Divisor Of A Number'. 5kyu.
Here we create an program that returns the biggest prime factor and biggest divisor of a number 
(excluding itself), with a fair amount of error checking. Here is the solution that allowed me 
to solve the challenge.
1) We require the prime library.
2) We define our first method max_pf_max_div, which takes the number, n, for
   which we'll return its highest prime factor and highest divisor (excluding
   itself).
3) In this method, we do our error checking. First, we return a custom error
   message if n is a float with decimals. If n is a float with a 0 decimal, we
   convert it to an integer, if n is a negative integer, we convert it to its
   absolute values, both these steps can be done in 1 go without explicit
   checks using n = n.abs.to_i. The abs method converts a float to its
   absolute (positive) value. If n is already an positive integer, it is not
   affected by these method calls.
4) Finally, the max_pf_max_div checks if n is a prime number, if it is, we
   return an empty array, if not, we return the number's highest prime factor
   and highest divisor in an array. This is when our calculation methods
   max_pf and max_div are called.
5) In max_pf, we call the prime division method, which returns an array of
   arrays with each contained array holding the prime factor and its exponent.
   We call the max method, which isolates the sub-array with the biggest prime
   factor (and its exponent). Then we call first to grab the prime factor, as
   its always the first element in the sub-array.
6) In our max_div method, we add all the divisors from 2 to the square root of
   n - along with their divisor counterparts - to an array called divs. We
   start from 2 instead of 1 because the counterpart of 1 will be n itself, and
   we are looking to exclude n. We call the max method on the divs array, which
   gives us n's highest divisor (excluding n).
=end

require "prime"

def max_pf_max_div(n)
  return "The number has a decimal part." if n % 1 != 0
  n = n.abs.to_i
  n.prime? ? [] : [max_pf(n), max_div(n)]
end

def max_pf(n)
  n.prime_division.max.first
end

def max_div(n)
  divs = []
  (2..Math.sqrt(n)).each do |e|
    divs << e if n % e == 0 && (n / e) != e
    divs << (n / e) if n % e == 0 && (n / e) != e
    divs << e if n % e == 0 && (n / e) == e
  end
  divs.max
end
