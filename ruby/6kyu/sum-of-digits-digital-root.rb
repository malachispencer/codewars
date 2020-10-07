=begin
Codewars. 19/04/20.'Sum of Digits/Digital Root'. 6kyu. The digital root is the 
recursive sum of all digits of a number, until that number contains 1 digit. 
Here we create a method that produces a number's digital root. Here is the 
solution that allowed me to pass the challenge.
1) We define our method digital_root_ms, which takes one argument, n, the
   number we are getting the digital root of.
2) We create a sum counter variable and intialize it to 0.
3) We convert n to an array of digits, iterate over them using each and
   incremement sum with each digit.
4) If sum is less than 10 i.e. a single digit number, we return sum, if not,
   we call digital_root_ms recusively with sum as the argument. The process
   continues until sum is a single digit number.
=end

def digital_root_ms(n)
  sum = 0
  n.digits.each {|d| sum += d}
  sum < 10 ? sum : digital_root_ms(sum)
end

=begin
Here is another solution, submitted by another Codewars user. It also utilises the
digits method and calls itself resursively, but does not use a counter
variable and instead uses the sum method. The digits and sum methods are used
inside the recursive method call.
=end

def digital_root_alt(n)
  n < 10 ? n : digital_root(n.digits.sum)
end

=begin
Here is the best solution. It does not involve using the expensive and 
performance slowing method digits. Instead, it resursively performs n 
divided by 10 + the remainder of n / 10 and eventually this ends up 
producing the digital root. For example, 942 / 10 = 94, remainder 2. 
96 / 10 = 9, remainder 6. 15 /10 = 1, remainder 5. Digital root of 942 is 6.
=end

def digital_root(n)
  n < 10 ? n : digital_root(n / 10 + n % 10)
end
