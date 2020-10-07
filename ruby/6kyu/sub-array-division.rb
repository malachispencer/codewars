=begin
Codewars. 12/05/20. 'Sub-array division'. 6kyu. Here we create a method that 
takes an array and an integer and determines whether any element or sum of 
elements in that array is cleanlydivisible by the given integer. Here is the 
solution I developed to solve the challenge.
1) We define our method divisible_sub_ms?, which takes an array of integers
   and an integer as its arguments.
2) We create a range from 1 up to and including the size of the array. This
   will act as an index of the amount of elements we wish to use to create
   combinations of elements from that array.
3) We pass our block varibale into the combination method called on the array
   and then call the any? method, we return true if the sum of any combination
   of 1, 2, 3 etc elements up to the size of the array, is divisible by n.
4) If our block is finished and we haven't true, there was no possible
   sub-array sum that was divisible by n so we return false.
=end

def divisible_sub_ms?(arr, n)
  (1..arr.size).each {|i| return true if arr.combination(i).any? {|g| g.sum % n == 0}} ; false
end

=begin
Here is a shorter version of my solution, submitted by another Codewars user. It
essentially allows us to cut out or true and false statements by using any? as
the range iterator instead of each. It says "is there any sum of a combination
of 1, 2, 3 etc elements that is divisible by n", if so return true, if not,
return false.
=end

def divisible_sub(arr, n)
  (1..arr.size).any? {|l| arr.combination(l).any? {|g| g.sum % n == 0}}
end

=begin
Here is a solution that is more Python-esque in its syntax.
1) We create a for loop that iterates from 1 up to the size of the array. len
   is the block variable (so len can be called anything).
2) We create a combination of len elements, on the first iteration this will be
   1 element combinations, then instead of calling any? we simply iterate over
   the combinations and return true if any of them summed is divisible by n.
3) If none are divisible by n, we return false.
=end

def divisible_sub_x(arr, n)
  for len in 1..arr.size
    arr.combination(len) {|g| return true if g.sum % n == 0}
  end
  false
end
