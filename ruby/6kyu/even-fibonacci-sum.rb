=begin
Codewars. 15/04/20. 'Even Fibonacci Sum'. 6kyu. Here we create a method that 
sums all the evens in a fibonacci sequence up to, but not including the maximum, n. 
Here is the solution I used to solve the Codewars challenge.
1) We initialize our constant array FIBS, with 0 and 1, the first 2 numbers in
   the fibonacci sequence.
2) We define our method fibonacci_even_sum, which takes one argument, n, the
   max fibonacci number in our sequence. Not the nth fibonacci as we have done
   in 2 previous Codewars challenges.
3) We create our counter variable sum and initialize it to 0.
4) We create a while loop which runs as long as FIBS highest value is less
   than n, so once the highest value becomes equal or above n, no further
   iterations will run.
5) We continually sum the last and penultimate value in FIBS and add this to
   the FIBS array.
6) Now we have a fibonacci sequence where the max value is equal or
   slightly above n.
7) We iterate over our sequence and increment sum with the fibonacci if it's
   even and less than n, our maximum value, which is not to be included in the
   sum.
8) We return the sum.
=end

FIBS = [0,1]

def fibonacci_even_sum(n)
  sum = 0

  while FIBS.max < n
    FIBS << FIBS.last + FIBS[-2]
  end

  FIBS.each do |fib|
    sum += fib if fib.even? && fib < n
  end
  
  sum
end
