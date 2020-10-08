=begin
Codewars. 13/04/20. 'Primes in numbers'. 5kyu. Here we create a method that 
returns the prime factorisation of a number in the following string format e.g.
"(2**5)(5)(7**2)(11)" if n = 86240. Here is the solution I used to solve 
the Codewars challenge.
1) We require the prime library.
2) We define our method prime_factors_str, which takes one argument, num.
3) We create an empty string, where we will store our factorisation.
4) We call the prime_division method on num, which returns the prime factors
   and their exponents in an array of arrays, then we iterate over the array
   using each.
5) If the exponent is greater than 1, we add (prime factor**exponent) into the
   string. If the exponent is 1, we add (prime factor) into the string.
6) We return the string.
=end

require "prime"

def prime_factors_str(num)
  str = ""
  num.prime_division.each do |pf,ex|
    str << "(#{pf}**#{ex})" if ex > 1
    str << "(#{pf})" if ex == 1
  end
  str
end

=begin
Here is another solution submitted by a Codewars user, instead of creating an
empty string, using each and adding to the string, it uses map, checks if the
exponent is 1 using the ternary operator and converts each element in the
array to a string with the correct format, then calls join to turn that array
of strings into a string.
=end

def prime_factors_str_v2(n)
  n.prime_division.map {|p, x| x == 1 ? "(#{p})" : "(#{p}**#{x})"}.join
end
