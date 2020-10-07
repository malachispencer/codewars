=begin
Codewars. 30/04/20. 'N smallest elements in original order'. 6kyu. Here we create 
a method that takes an array of integers and returns the N smallest, in original 
order. Here is the solution I developed to solve the challenge.
1) We define our method first_n_smallest_ms, which takes 2 arguments, arr, an
   array of integers and n, the amount of smallest elements we need to return.
2) We takes the n smallest elements using the min method and store them in a
   variable m.
3) We map over the array and if the element currently being iterated over is in
   the m collection, we keep it in the array and then delete that corresponding
   element from the m collection using the delete_at method, which takes an
   index position as its argument. This way no duplicates are kept, only the
   exact number of elements from m.
4) Any element in the array which is not included in m will become a nil value
   because we've performed no action on it, therefore we call the compact
   method to remove all nil values.
5) Now we've returned the n smallest elements in original order.
=end

def first_n_smallest_ms(arr, n)
  m = arr.min(n)
  arr.map {|e| e && m.delete_at(m.index(e)) if m.include?(e)}.compact
end

=begin
Here is another solution I made, inspired by another Codewars user's solution.
1) We store our n smallest elements in a variable m.
2) We call each_with_object on the original array, our new object being a new
   array where the n smallest will be stored, in original order.
3) If the element we are currently iterating over is included in m, we call the
   slice! method - which takes an index - to delete that element from m.
   Because slice! also returns that element, we can add it to the new array
   simultaneously, delete_at also does the same thing.
4) If we try to return the new array by returning r at the end, we'll get an
   error because there is no need to. The new array will automatically be
   called, and it will now contain the n smallest elements in original order.
=end

def first_n_smallest_ms_x(arr, n)
  m = arr.min(n)
  arr.each_with_object([]) {|e,r| r << m.slice!(m.index(e)) if m.include?(e)}
end

=begin
Here is the best solution.
1) We call each_with_index on the array then tag min(n) onto the end, now we
   have an array of arrays where each sub-array contains a smallest as the
   first element and its index position as the second element. The array is
   sorted by the first element.
2) We sort the sub-arrays by their last element, so now the mins are in their
   original order.
3) We map over the array of arrays and keep only the first elements, thereby
   creating an array of the n smallest, in original order.
=end

def first_n_smallest(arr, n)
  arr.each_with_index.min(n).sort_by(&:last).map(&:first)
end

=begin
Here is a final solution.
1) While the array size is above n, it deletes the last occurrence of each max
   element.
2) The delete_at method takes an index position.
3) The rindex method returns the last occurrence of the object placed in its
   argument. The index method is the opposite, returning the first occurrence,
   however, the index method wouldn't work in this method.
4) Once the size of the array becomes equal to n, we return it. It now contains
   the smallest n elements in their original order.
=end

def first_n_smallest_x(arr, n)
  arr.delete_at(arr.rindex(arr.max)) while (arr.size > n) ; arr
end
