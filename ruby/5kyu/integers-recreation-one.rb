=begin
Codewars. 16/04/20. 'Integers: Recreation One'. 5kyu. Here we create a program that 
finds all numbers in a range whose sum of squared divisors is also a square. For 
example, the sum of 42's squared divisors is 2500, and 2500 is also a square 
because 50**2 = 2500. Here is the solution I used to solve the kata.
1) We define our first method ssd_square, which takes a and b as arguments, the
   beginning and end of the range we're searching in.
2) We create an empty array called results, where we will store all numbers
   whose sum of squared divisors is also a square.
3) We iterate from a to b and add every number, plus it's sum of squared
   divisors - inside an array - to the results array, if it's square root forms
   a whole number.
4) We return results, which is an array of arrays e.g. [[1, 1], [42, 2500],
   [246, 84100]] if a = 1 and b = 250.
5) In our sum_sq_div method, which takes the current number in our ssd_square
   range, we initialize a counter variable to 0.
6) We then iterate from 1 up to the square root of num and increment the sum
   by the square of its divisors, and its square root if that's a whole number.
7) We return sum, which becomes the value we use in sum_sq_div for checking if
   it's a perfect square and adding it to the results array if so.
=end

def ssd_square(a, b)
  results = []
  (a..b).each do |num|
    results << [num, sum_sq_div(num)] if Math.sqrt(sum_sq_div(num)) % 1 == 0
  end
  results
end

def sum_sq_div(num)
  sum = 0
  (1..Math.sqrt(num)).each do |e|
    sum += e ** 2 if num % e == 0 && e != (num / e)
    sum += (num / e) ** 2 if num % e == 0 && e != (num / e)
    sum += e ** 2 if num % e == 0 && e == (num / e)
  end
  sum
end

=begin
Here is the highest voted best practice and highest voted clever solution on
Codewars.
1) We require the set class. A set stores items like arrays and hashes but has
   attributes which make it 10x faster in specific situations. Additionally,
   all items in a set are guaranteed to be unique, no duplicate objects can be
   added to a set.
2) We define our method ssd_square_alt, a and b are the start and end of the
   range we are searching in.
3) We map over each number (num) from a to b and inside a variable called divs,
   we create a new set. Inside this new set we select all num's divisors up to
   its square root.
4) To add to the set we use the += operator, and iterate over divs, adding in
   the counterparts of the divisors up to the square root.
5) Inside a variable called ssd, we store the sum of squared divisors by
   mapping over divs, squaring each div and then summing the products.
6) We return [num, ssd] if the square root of ssd is a whole number.
7) We call the array method compact to eliminate all the nil values.
=end

require "set"

def ssd_square_alt(a, b)
  (a..b).map do |num|
    divs = Set.new((1..Math.sqrt(num)).select { |n| num % n == 0 })
    divs += divs.map { |d| num / d }

    ssd = divs.map { |d| d * d }.inject(:+)
    [num, ssd] if Math.sqrt(ssd) % 1 == 0
  end.compact
end
