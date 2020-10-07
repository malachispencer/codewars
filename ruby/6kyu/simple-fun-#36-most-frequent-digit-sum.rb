=begin
Codewars. 25/04/20. 'Simple Fun #36: Most Frequent Digit Sum'. 6kyu. Here we 
create a method that takes a number and subtracts the sum of its digits from 
that number, then repeatedly does so until the number is a single digit number. 
Our method must return the most frequent digit sum in the process. Here is the 
solution I developed to solve the kata.
1) We define our method most_frequent_digit_sum_ms, which takes one argument,
   n, an integer.
2) If n is already a single digit number, we simply return it.
3) We create an empty array, sums, where we will store our digit sums.
4) While n has more than 1 digit, we decrement the value of n by the sum of
   its digits and each time this occurs we add the digit sum to sums, the loop
   stops once n becomes a single digit number.
5) We call the max_by method on sums and set the count of its elements as the
   block parameter, the element with the highest count - i.e. the most
   frequent - is returned.
=end

def most_frequent_digit_sum_ms(n)
  return n if n < 10
  sums = []
  while n.digits.size > 1
    n -= n.digits.sum
    sums << n.digits.sum
  end
  sums.max_by {|i| sums.count(i)}
end
