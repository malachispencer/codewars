=begin
Codewars. 10/04/20. 'Find Number With Maximum Number Of Divisors'. 6kyu. Here we 
create a method that takes 2 numbers and finds the number in its range which has 
the highest number of divisors. Here is the solution I used to solve the kata.
1) We require the prime library.
2) We define our method highest_div_count, which takes 2 arguments, a and b,
   the numbers which define our range where we search for the number with the
   highest divisor count.
3) We return custom error messages if the user enters numbers smaller than 1 or
   makes a larger than b.
4) We create our range from a to b, then call the enumerable method max_by,
   which returns the element with the maximum value from the given block.
5) In our block, we make num the block variable and pass this into our 2nd
   method, divisor_count. Essentialy, every number in the a to b range will be
   run through our divisor_count method and our max_by block will return the
   num with the highest divisor count.
6) In our divisor_count method, num is the argument, the number in our range it
   is currently working on.
7) First we check if num is 1, if so, divisor_count returns 1, because if we
   didn't, the rest of the method would return a nil value when 1 is run
   through it and we'd get an error when max_by compares nil with an integer.
8) If num is greater than 1, we call the prime_division method on it, which
   returns an array of arrays, where each contained array holds the prime
   divisor and its exponent. For example, 12.prime_division would return
   [[2,2],[3,1]] because (2**2) * 3 = 12.
9) We then map over the array of arrays and in our block variables we do an _
   for the prime divisor because we won't be using it, and an x for exponent.
   We add 1 to every exponent because 1 wasn't included in the factorisation
   then multiply them using inject. This gives us the divisor count for num.
10) As stated before, divisor_count will run with every number in the a to b
    range as its argument, then the max_by method will make the
    highest_div_count method return the number which has the highest divisor
    count.
=end

require "prime"

def highest_div_count(a, b)
  return "Please make sure numbers are 1 or greater." if a < 1 || b < 1
  return "Error, please make sure b is larger than a." if a > b
  (a..b).max_by {|num| divisor_count(num)}
end

def divisor_count(num)
  num == 1 ? 1 : num.prime_division.map {|_,x| x + 1}.inject(:*)
end
