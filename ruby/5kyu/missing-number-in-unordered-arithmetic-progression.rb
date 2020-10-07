=begin
Codewars. 28/04/20. "Missing number in Unordered Arithmetic Progression". 5kyu.
An Arithmetic Progression is defined as one in which there is a constant
difference between consecutive terms of a given series of numbers, for example
in [1,3,5,7,9] the constant difference is 2. Here we create a method that finds
the missing term in an unordered Arithmetic Progression with one term missing.
After solving the 6yku "Find the missing term in an Arithmetic Progression"
kata with a lucky self-developed solution that timed out on every other test,
here is the solution I used - taken from other solutions of the 6kyu kata - to
solve this challenge.
1) We define our method find_missing_ap, which takes an array of an unordered
   arithmetic sequence as an argument.
2) We add the smallest and largest number in the sequence together, then
   multiply this by the sequence size + 1 divided by 2, minus the sequence sum.
3) This mathematical forumla gives us the missing term in an ordered and
   unordered arithmetic progression.
=end

def find_missing_ap(seq)
  (seq.min + seq.max) * (seq.size + 1) / 2 - seq.sum
end
