=begin
Codewars. 09/05/20. "Polydivisible Numbers". 7kyu. A polydivisible number is a
number whose first digit is perfectly divisible by 1, first two digits are
divisible by 2, first three digits are divisible by 3 and so forth. Here we
create a method that checks if an integer is a polydivisible number. Here is
the solution I developed to solve the challenge.
1) We define our method polydivisible_ms?, which takes an integer as its
   argument.
2) We store a string form of our integer in a variable called s.
3) We iterate from 0, up to but not including the length of the number. This
   acts as iterating the index of the number. For example, 1236 has a length
   of 4. 0 = 1, 1 = 2, 2 = 3, 3 = 6. So for 1236 we iterate from 0 to 3.
4) We call the all method to iterate over the index and return true if all
   iterations meet our condition. It returns false as soon as any don't.
5) In our block, we check whether the first digit is divisible by 1, first 2
   divisible by 2 etc. s[0..i] will be s[0] on the first iteration, so the
   first digit only, i + 1 will be 0 + 1 = 1. On the second iteration, s[0..i]
   will be s[0..1] so the first 2 digits, and i + 1 will be 1 + 1 = 2. We slice
   the string form of the number then convert to an integer.
6) Our method returns true if the number is polydivisible and false if not.
=end

def polydivisible_ms?(n)
  s = n.to_s ; (0...s.length).all? {|i| s[0..i].to_i % (i + 1) == 0}
end

=begin
Here is an improved version of my method, submitted by another Codewars user.
1) As we know every single digit number is divisible by 1, we start our range
   from 2, and go up to the length of n. So if n is 1236: 2 covers 12, 3 covers
   123, 4 covers 1236.
2) In our block, s[0,i] is the equivalent to s[0...i], so up to but not
   including i. On the first iteration, s[0,i] will be the first 2 digits
   [0..1] and i will be 2, so the first 2 digits modulo 2. First 3 digits
   modulo 3 on the next iteration, and so on.
=end

def polydivisible?(n)
  s = n.to_s ; (2..s.length).all? {|i| s[0,i].to_i % i == 0}
end
