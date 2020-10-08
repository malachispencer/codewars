=begin
Codewars. 18/04/20. 'What's a Perfect Power anyway?' 5kyu. A perfect power is a 
positive integer that can be expressed as an integer power of another positive 
integer e.g. 81 is a perfect power because it can be expressed as 9**9. More 
formally, n is a perfect power if there exists natural numbers m > 1 and k > 1 
such that m**k = n. Here we create a method that checks whether an integer is a 
perfect power and returns an m and k pair of it, if it's not, we return nil. 
For example, n = 9 returns [3,2] because 3**2 = 9. Here is the solution I 
found on repl.it, which allowed me to pass the challenge.
1) We define our method perfect_power, which takes one argument, n, the
   number we are checking is a perfect power and then returning and m,k pair.
   If it's not, we return nil.
2) We iterate from 2 up to the square root of n.
3) For each iteration we divide the natural log of n by the natural log of m
   (the iteration number), then we round it to the nearest whole number and
   store this in a variable k, k is our potential exponent.
4) The log method returns the natural logarithm (base e) of the number passed
   in, if a second argument is passed in, that will be the base.
5) k is our potential exponent and m (our iteration numbers) is our potential
   base. If m ** k is equal to n then we return the [m,k] pair. If the entire
   loop is run through and no [m,k] pair is found, we return nil.
=end

def perfect_power(n)
  (2..Math.sqrt(n)).each do |m|
    k = (Math.log(n) / Math.log(m)).round
    return [m, k] if m ** k == n
  end
  nil
end

=begin
Here is another solution, submitted by a Codewars user.
1) It performs a prime factorisation on n, then finds uses the gcd method -
   passed into reduce - to find the greatest common divisor of the exponents in
   the prime factorisation. It stores this in a variable k, k is the potential
   exponent.
2) If the greatest common divisor of n's prime factor exponents is 1, nil is
   returned, this number is not a perfect power.
3) Otherwise, we do n to the power of 1.0 divided by k and round this to the
   nearest whole number, this forms the base, then we return k next to it -
   inside an array - this is the exponent.
4) Important, the pow method performs an exponation similar n ** 0.5, but when
   we try using n ** (1.0 / k).round, some of the tests pass but many of the
   tests fail. Therefore, we must use the pow method.
=end

require "prime"

def perfect_power_alt(n)
  k = n.prime_division.map(&:last).reduce(&:gcd)
  k != 1 ? [n.pow(1.0 / k).round, k] : nil
end
