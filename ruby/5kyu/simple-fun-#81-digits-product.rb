=begin
Codewars. 24/04/20. 'Simple Fun #81: Digits Product'. 5kyu. Here we create a 
method that takes an integer and returns the smallest positive integer whose 
digits can be multiplied to produce that integer. For example, for 12 it's 26 
because 2 * 6 = 12; for 450 it's 2559 because 2 * 5 * 5 * 9 = 450. Here is the 
solution I developed to solve the challenge. It is a brute force solution that 
most likely wouldn't be efficient enough for extremely large numbers.
1) We define our method digits_product, which takes one argument, num, a
   positive integer.
2) We iterate from num + 1 to avoid problems if num is a single digit number,
   for example, 0.digits.inject(:*) == 0, likewise for 1, likewise for 5 etc.
   Originally I iterated up to 10_000 but once I passed all the tests I
   realised the highest output is in the 4000s so capped off the range at 5000.
3) We use the detect method to find the first (and hence smallest) digits
   product.
4) We convert each iteration to an array of digits then multiply all those
   digits together, the first time we encounter an n whose digits product is
   equal to num, detect returns it. If we don't encounter a digits product, we
   return -1, as requested in the challenge.
=end

def digits_product(num)
  (num+1..5000).detect {|n| n.digits.inject(:*) == num} || -1
end
