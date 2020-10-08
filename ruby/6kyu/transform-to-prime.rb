=begin
Codewars. 05/05/20. 'Transform To Prime'. 6kyu. Here we create a method that 
takes an array of integers and tells us the minimum number that needs to be 
added to the array in order to transform its sum to a prime number. Here is 
the solution I developed to solve the challenge.
1) We require the prime library.
2) We define our method minimum_number_ms, which takes an array of integers as
   an argumnet.
3) We intialize a counter variable called m to 0, this will eventually be our
   minimum number needed to make the array's sum prime.
4) We sum the array's integers and store this in a variable s.
5) We create a while loop which continues as long as s is not prime.
6) We add 1 to s in each iteration, then also add 1 to m.
7) Once our loop stops, s has become a prime number. m's value will be the
   minimum number that was needed to make the array's sum a prime number, so
   we return m.
8) Instead of a multiline method, we place everything on one line by using the
   semi colon to separate our commands.
=end

require "prime"

def minimum_number_ms(nums)
  m = 0 ; s = nums.sum ; while !s.prime? ; s += 1 ; m += 1 ; end ; m
end
