=begin
Codewars. 11/05/20. 'Simple frequency sort'. 6kyu. Here we create a method that 
sorts elements in an array by decreasing frequency of elements, if two elements 
have the same frequency, our method sorts them by increasing value. For example, 
[2,3,5,3,7,9,5,3,7] should return [3,3,3,5,5,7,7,2,9]. Here is the solution I 
developed to solve the challenge.
1) We define our method sort_by_frequency_ms, which takes an array of integers
   as its argument.
2) We call the group_by method on the array and group all same elements
   together in a hash. We then call the values method to eliminate the keys
   and leave us with an array of arrays where same elements are grouped
   together.
3) We then call the sort_by method and sort the groups (sub-arrays) by the
   negative integer of their size, so now they are sorted in descending order
   of frequency i.e. highest frequency first.
4) Now same frequency elements must be sorted in ascending order, so we call
   the chunk_while method to group all same frequency elements together. We
   now have an array of arrays of arrays.
5) We map over the chunks - same frequency sub-arrays - and sort them, which
   puts them in ascending order.
6) We flatten our nested array into a one level array. Our elements are now
   sorted by decreasing frequency, with same frequency elements sorted in
   ascending order.
=end

def sort_by_frequency_ms(arr)
  arr.group_by(&:itself).values.sort_by {|g| -g.size}.
    chunk_while {|a,b| a.size == b.size}.map(&:sort).flatten
end

=begin
Here is a much shorter solution for the kata.
1) We simply call the sort_by method and pass in an array with the first
   element being the frequency of the element sorted as if it were a negative
   integer, which sorts frequency in descending order.
2) The second element in the array is element itself, which gets sorted as
   normal, in ascending order.
3) Now our array is sorted in the required format.
=end

def sort_by_frequency(arr)
  arr.sort_by {|e| [-arr.count(e), e]}
end
