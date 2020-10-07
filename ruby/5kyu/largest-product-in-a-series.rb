=begin
Codewars. 27/04/20. 'Largest product in a series'. 5kyu. Here we create a method 
that returns the greatest product of 5 consecutive digits in a given string of digits. 
Here is the solution I used to solve the challenge.
1) We define our method greatest_product_ms, which takes one argument, n, a
   string of digits.
2) We convert the string of digits to an array of string digits using chars.
3) We map over the array of string digits and convert them to integers.
4) We call the each_cons method with 5 passed in, which allows us to iterate
   over every sequence of 5 digits in the string.
5) We map over every 5 digit sequence and use inject(:*) to multiply the digits
   into their product.
6) We call the max method, which returns the greatest product out of all the 5
   digit sequences.
=end

def greatest_product_ms(n)
  n.chars.map(&:to_i).each_cons(5).map {|seq| seq.inject(:*)}.max
end
