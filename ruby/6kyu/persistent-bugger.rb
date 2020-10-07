=begin
Codewars. 21/04/20. 'Persistent Bugger.' 6kyu. The multiplicative persistence 
of a number is the number of times you must multiply its digits until you reach 
a single digit number. Here we create a method that tells us the multiplicative 
persistence of a number. This is the solution that I used to pass the challenge.
1) We define our method persistenc0_ms, which takes one argument, n, the number
   for which we are deriving the multiplicative persistence.
2) We return 0 if n is already a single digit number i.e. lower than 10.
3) We intialize a counter variable called count and set it to 0.
4) We create an open loop.
5) We set n equal to the multiplication of n's digits. If we did not do n =
   the multiplication would only be done once.
6) Every time n's digits are multiplied by each other, count is incremented by
   1.
7) We break out of the loop if n < 10 and return the count.
=end


def persistence_ms(n)
  return 0 if n < 10
  count = 0
  loop do
    n = n.digits.inject(:*)
    count += 1
    break if n < 10
  end
  count
end

=begin
Here is another solution, similar to mine, taken from a Codewars user. Instead
of using loop do it uses a while loop and requires no break statement. Unlike
mine, it takes care of 1 digit inputs without needing to explicitly.
=end

def persistence(n)
  count = 0
  while n > 9 do
    n = n.digits.inject(:*)
    count += 1
   end
  count
end
