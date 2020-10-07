=begin
Codewars. 20/04/20. "Count the divisible numbers". 6kyu. Here we create a method 
that returns the count of all numbers in a range x to y, divisible by k. This is 
the solution which allowed me to pass the challenge, I learned how to do this from 
GeeksforGeeks after my loop and count method was too inefficient to pass.
1) We define our method divisible_count, which takes 3 arguments, x, the lower
   bound of our range, y, the upper bound of our range, and k, the divisor.
2) If the lowest number in our range x, is perfectly divisible by k, we
   return the difference between y divided by k and x divided by k, plus 1.
3) If x is not perfectly divisible by k, we return the difference between y
   divided by k and x divided by k, but this time we don't add 1.
=end

def divisible_count(x, y, k)
  x % k == 0 ? (y / k) - (x / k) + 1 : (y / k) - (x / k)
end

=begin
Here is another solution, submitted by a Codewars user. We simply take the
difference between y divided by k and x minus 1 divided by k.
=end

def divisible_count_alt(x, y, k)
  (y / k) - (x - 1) / k
end
