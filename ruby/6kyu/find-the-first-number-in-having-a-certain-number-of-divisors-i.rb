=begin
Codewars. 10/04/20. 'Find the First Number in Having a Certain Number of Divisors I'. 6kyu.
Here we create a method that allows us to find the first number with a certain amount of 
divisors. Here is a refactored version of the solution I used to pass the Codewars challenge.
1) We define our method first_with_n_divs, which takes one argument, n, the
   certain amount of divisors. Remember, we are looking for the first number
   that has n divisors.
2) When we enter 0 as n, our program doesn't work - becasue our range starts at
   1 - so we cover this with a custom error message.
3) We create an endless range and call the detect method on it, the detect
   method takes a block and returns the FIRST element which evaluates to true.
4) In our block, we designate our block variable num and call our 2nd method,
   divisors_count, with num passed in as its argument and we require that the
   result of divisors_count(num) be equal to n.
5) Essentially, the divisors_count method will run with each number in our
   range, until it gets a number where the divisors count is equal to n. The
   first_with_n_divs method will then return that number, because it used
   detect. We also could have used the find method, it also returns the first
   element which evaluates to true for the given block.
6) At this point, we could make a traditional divisor counter method, where we
   create a range up to n, then count all its divisors. While this solution
   works, it is inefficient and when we do this on Codewars, we get a
   timeout. This is because we are using 2 loops. Instead, we create a
   method that uses factorisation.
7) So, in our divisors_count method, it takes the number of the current
   iteration in the range inside first_with_n_divs.
8) First we assess whether num is 1, in which case divisors_count returns 1.
   If we did not do this, the rest of our method would create a nil value
   when 1 is run through it.
9) When num > 1, we call the prime_division method on it, which gives us an
   array of arrays with each contained array holding the prime divisor and its
   exponent. For example, 350.prime_division returns [[2,1],[5,2],[7,1]]
   because 2 * (5**2) * 7 = 350.
10) We map over the array of arrays and in our block, we place an underscore
    where "prime" could be because we won't be using these values, this is the
    Ruby convention for block variables we don't use, our second block variable
    is exp for exponent.
11) We add 1 to all the exponents to account for the fact that 1 was not
    included in the factorisation, then we use inject to multiply them. This
    gives us the divisor count for num.
12) As stated before, divisors_count runs using each number in
    first_with_n_divs' range, until the divisor count is equal to n, at that
    point, first_with_n_divs returns the number from the range that was
    responsible for making divisors_count == num.
=end

require 'prime'

def first_with_n_divs(n)
  return "Enter a larger number." if n < 1
  (1..).detect {|num| divisors_count(num) == n }
end

def divisors_count(num)
  num == 1 ? 1 : num.prime_division.map { |_, exp| exp + 1 }.inject(:*)
end

=begin
Here is another solution, taken from a Codewars user and refined. We are doing
exactly the same thing as the first_with_n_divs solution, we are just using
different method names, different methods and instead of creating an endless
range we make a finite range.
=end

def n_divs_first(n)
  return "Enter a larger number." if n < 1
  (1..100_000).find {|num| divisor_counter(num) == n}
end

def divisor_counter(num)
  num == 1 ? 1 : num.prime_division.map {|_, x| x + 1}.reduce(:*)
end
