=begin
Codewars. 05/06/20. "Array Deep Count". 6kyu. The length and size methods will only give the number of top-level elements in an array. Here
we create a method that returns ALL the elements in an array, including all sub-arrays. Here is the solution I used to solve the challenge,
with assistance from Stack Overflow.
1) We define our method deep_count_ms, which takes an array as its argument.
2) We create a duplicate of our array and store it in a variable dup, this is the array that will be iteratively flatten one level at a time.
3) We initialize a count of the depth to 0 - ie. how many inner level arrays there are - inside the array.
4) We create a loop that runs until our duplicate is equal to the input array completely flattened. So if the original array has no inner
   level arrays, this loop doesn't run.
5) On each iteration, we flatten dup 1 level and update it as a variable, then we increment depth by 1.
6) Once dup is equal to the input array completely flattened, the loop is broken out of and depth is the number of flattenings that were
   required to break out of the loop. In other words, the depth is the number of inner level arrays.
7) We simply add the depth to the amount of top level elements in dup (which is now completely flattened). This gives us the count of
   all elements including inner level arrays.
=end

def deep_count_ms(arr)
  dup, depth = arr.dup, 0
  until dup == arr.flatten do
    dup = dup.flatten(1)
    depth += 1
  end
  depth + dup.size
end

=begin
Here is a much shorter solution, which uses the inspect method.
1) We call the inspect method on the array, which returns the array represented as a string. Then we count the number of opening array
   brackets then subtract 1 to remove the main array bracket. So now we have a count of the inner level arrays.
2) We also could have just converted the array to a string using the to_s method, instead of using inspect.
3) We add the inner level array count to the number of elements in the array when its flattened, giving us the deep count.
=end

def deep_count(arr)
  arr.inspect.count("[") - 1 + arr.flatten.size
end

=begin
Here is a solution which uses recursion.
1) We map over the array, if the element is not an array, we turn it into 1.
2) If the element is an array, the method is called recursively, and so this inner array is mapped over, its elements are turned into 1,
   then the sum of these elements is taken and 1 is added to this to include the sub-array itself. If the sub-array had 1 element and no
   sub-arrays, our main array now contains a 2.
3) In the case of [1, 2, [3, 4, [5]]], we map over and get [1, 1], then we encounter a sub-array. The method is called recursively, so now
   we are mapping over [3, 4, [5]], we get [1, 1] and then we encounter a sub-array. The method is called recursively, so now we are
   mapping over [5], this array becomes [1]. [1] summed is 1, + 1 (sub-array) = 2; then our higher level array becomes [1, 1, 2], it is
   summed to equal 4, + 1 (the sub-array is added) = 5; now the main level array is [1, 1, 5], this is summed and this equals 7. The main
   array is not included in the count of course.
4) This is how our method works recursively to give a deep count.
=end

def deep_count_x(arr)
  arr.map {|e| e.is_a?(Array) ? deep_count_x(e) + 1 : 1}.sum
end