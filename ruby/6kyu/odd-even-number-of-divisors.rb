=begin
Codewars. 10/04/20. 'Odd/Even number of divisors'. 6kyu. Here we create a method 
that returns "odd" if the count of all a numbers divisors is odd and "even" if the 
count of all its divisors is even. The inefficient solution is to find all the 
divisors, count how many of them there are and then check if it's odd or even, 
when I did this on Codewars I got a timeout. Mathematical logic says that if a 
number is a perfect sqaure, its proper divisor count is odd, so the efficient 
solution is to check whether a number is a perfect square, and if so return odd, 
which is what we do here.
1) We define our method odd_or_even_div_count, which takes one argument, the
   number.
2) Using the sqrt method from the Math module, we find the square root of that
   number.
3) We then use modulo operator, which gives us the remainder of a division. If
   the remainder of the square root divided by 1 is 0 (perfect square), the
   count of the proper divisors is odd. If the remainder is not 0
   (decimal number, not perfect square), the count of the proper divisors is
   even. This is based on mathematical logic. Essentially here, we are
   checking if num is a perfect square or not.
=end

def odd_or_even_div_count(num)
  Math.sqrt(num) % 1 == 0 ? "odd" : "even"
end

=begin
Here I've included another solution to the odd or even divisor count problem,
taken from a Codewars user.
=end

def odd_or_even_div_count_two(num)
  (num ** 0.5) % 1 == 0 ? "odd" : "even"
end
