=begin
Codewars. 26/04/20. 'Simple Fun #23: Square Digits Sequence'. 6kyu. Consider 
a sequence where an element is equal to the sum of squared digits of the previous 
element, the sequence ends once an element that has already been in the sequence 
appears again. Starting at a0, here we create a method that tells us the length 
of the sequence. Here is the solution I developed to solve the kata.
1) We require the set class.
2) We define our method square_digits_sequence_ms, which takes one argument, a0,
   the number which starts the sequence.
3) We intialize a new set, seq, where we will store our sum of squared digits,
   and we place a0 in as the first element.
4) We create a loop using loop do.
5) We set a0 equal to the sum of its squared digits, then we add a0 (now the
   sum of squared digits) to seq. On the next iteration, a0 is the ssd of the
   previous iteration, which has its digits squared and summed again, then the
   product is stored in seq.
6) This process continues until an sum of squared digits that should be added,
   is already included in seq, at this point we break out of the loop.
7) We created a set because the include method works much faster with a set
   than it does with an array.
8) We return the size of seq + 1 to accomodate for the ssd that wasn't added
   because it was already included in seq.
=end

require "set"

def square_digits_sequence_ms(a0)
  seq = Set.new([a0])
  loop do
    a0 = a0.digits.map {|d| d**2}.sum
    seq << a0
    break if seq.include?(a0.digits.map {|d| d**2}.sum)
  end
  seq.size+1
end

=begin
Here is another solution, submitted by a Codewars user, it is similar to mine
but a bit shorter. It's key differences are using an array instead of a set to
store the sum of squared digits sequence, and using the until loop instead of
loop do. We may have thought the loop would be broken out of as soon as a0 is
added to seq, but a0 is changed in the same iteration so this doesn't occur
until a new iteration finds a0 inside seq.
=end

def square_digits_sequence_alt(a0)
  seq = []
  until seq.include?(a0)
    seq << a0
    a0 = a0.digits.map {|d| d*d}.sum
  end
  seq.size+1
end
