=begin
Codewars. 30/04/20. 'Difference of 2'. 6kyu. Here we create a method that 
takes an array of integers and returns an array of arrays that contains all 
pairs of integers with a difference of 2. The results should be in ascending 
order. For example, the input [6, 3, 4, 1, 5] should return [[1, 3], [3, 5], [4, 6]]. 
ere is a refactored version of the solution I used to solve the challenge.
1) We define our method twos_difference_ms, which takes an array of integers as
   its argument.
2) We sort the array, then call the combination method on it, which produces an
   array of arrays containing all original ordered combinations of 2 elements
   from the array.
3) We call the select method and extract only the sub-arrays which contain
   pairs with a difference of 2.
4) In my original solution I did all the sorting after combination and
   select - (sort_by(&:sum).map(&:sort)) - which was unnecessary.
=end

def twos_difference(arr)
  arr.sort.combination(2).select {|c| c.max - c.min == 2}
end
