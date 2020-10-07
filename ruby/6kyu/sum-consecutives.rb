=begin
Codewars. 28/04/20. 'Sum consecutives'. 6kyu. Here we create a method that 
takes an array of integers and sums only the numbers which are the same and 
consecutive. For example, [-5,-5,7,7,12,0] should return [-10,14,12,0]. Here 
is the solution I developed to solve the challenge.
1) We define our method sum_consecutives_ms, which takes arr, an array of
   integers as its argument.
2) We call the chunk method on the array. The enumerable method chunk returns
   an array of arrays, where each sub-array contains another array as its
   2nd (last) element. The first element of the sub-array is the value and the
   second element - the sub-sub-array - contains the value's consecutives. All
   consecutives which return the same block value are chunked together with
   chunk.
3) We map over the chunk array and return only the last element from each sub-
   array, so now we have an array of arrays with just the singles and
   consecutives in sub-arrays.
4) We map over each sub-array and sum them. Our singles will of course stay the
   same and our consecutives will be summed.
=end

def sum_consecutives_ms(arr)
  arr.chunk {|chk| chk}.map(&:last).map {|grp| grp.sum}
end

=begin
Here is another solution, it is exactly the same as mine, just using method
arguments instead of blocks to make the code shorter. The itself method simply
returns the object itself, so with chunk it returns whatever chunk returns, it
just allows us to do so without making a block. When used with group_by though,
itself is even more useful as it allows us to group duplicates together.
=end

def sum_consecutives(arr)
  arr.chunk(&:itself).map(&:last).map(&:sum)
end
