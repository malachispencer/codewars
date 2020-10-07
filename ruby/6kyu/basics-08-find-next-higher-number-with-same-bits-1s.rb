=begin
Codewars. 12/05/20. 'Basics 08: Find next higher number with same Bits (1's)'. 6kyu.
Here we create a method that finds the next number with the same amount of 1s in its bits. 
Here is the solution I developed to solve the challenge.
1) We define our method one_bits_next_ms, which takes an integer as its
   argument.
2) We store the 1-bit count of n in a variable nbc. Here we call the bc method,
   which converts our number to binary ("%b" % n) in string form and then
   counts the 1s. Converting a number to binary can also be done in Ruby with
   n.to_s(2).
3) We create a loop and then increment n by 1.
4) We return n (the next higher number) if its 1 bit count is the same as the
   input n's 1 bit count.
=end

def one_bits_next_ms(n)
  nbc = bc(n)
  loop do
    n += 1
    return n if bc(n) == nbc
  end
end

def bc(n)
  ("%b" % n).count("1")
end
