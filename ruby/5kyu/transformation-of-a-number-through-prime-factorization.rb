=begin
Codewars. 12/04/20. 'Transformation of a Number Through Prime Factorization'. 5kyu.
Here we create a method that allows us to find the geometric derivative of a number.
Formula: n* = Km * (Pm ** (Km - 1)).
Pm = Prime Factor, Km = Exponent, n* = Geometric Derivative.
So far, I've used adaptations of this method to return a number's divisor
count, sum a number's prime factors, generate a number's prime factorisation,
return a number's prime factors without the exponents, and now to find a
number's geometric derivative. As we can see, it's very versatile.
1) We require the prime library.
2) We define our method geometric_derivative, which takes one argument, n.
3) If n == 1 we return 1, if not, we call the prime_division method and map
   over the array of arrays containing prime factors and exponents it returns.
4) Utilising the geometric derivative formula and following BODMAS principles,
   we multiply the exponent by its prime factor to the power of the exponent
   minus 1. We use inject to multiply all the products. This gives us the
   geometric derivative of n.
5) Every prime number will have an n* of 1. Every number that does not have an
   exponent higher than 1 will also have an n* of 1.
=end

require "prime"

def geometric_derivative(n)
  n == 1 ? 1 : n.prime_division.map { |pf,x| x * (pf ** (x - 1)) }.inject(:*)
end
