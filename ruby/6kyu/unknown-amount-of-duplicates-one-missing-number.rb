=begin
Codewars. 09/05/20. 'Unknown amount of duplicates. One missing number.' 6kyu. 
Here we create a method that takes an array of unsorted, consecutive integers 
and finds the missing number, then returns this missing number along with the 
duplicates, in an array. For example, [10,9,8,9,6,1,2,4,3,2,5,5,3] should return 
[7,[2,3,5,9]]. Here is a refined version of the solution I developed to solve 
the challenge.
1) We define our method find_miss_num_dups_ms, which takes an array of
   unsorted, consecutive integers as an argument.
2) First we find the missing number by creating a range from the smallest
   number in the array up to the largest number in the array - which will
   include the missing - then summing them. We then remove all the duplicates
   from the array, sum the elements, then subtract this from the range sum.
   This gives us the missing number.
3) Now we find our duplicates, using select and count leads to a time out, so
   instead we call the group_by method with the itself method passed in as its
   argument, which produces a hash where the key is the element and the value
   is an array of all that elements incarnations in the original array.
4) We then call the values method, which deletes the keys and leaves us with an
   array of arrays with each sub-array holding the incarnations of the element
   in the original array.
5) We then call the reject method, which returns a new array of all the items
   for which the given block is not true, so we pass in the one? method, which
   essentially removes all sub-arrays containing only one element.
6) Now we have an array of arrays with only the duplicates. We simply flat_map
   over it and pass in the uniq method to leave only one of each element.
7) We sort the originally duplicate elements.
8) All of this we place inside one array to return it in one go and avoid
   variable assignments.
=end

def find_miss_num_dups_ms(a)
  [(a.min..a.max).sum - a.uniq.sum,
    a.group_by(&:itself).values.reject(&:one?).flat_map(&:uniq).sort]
end
