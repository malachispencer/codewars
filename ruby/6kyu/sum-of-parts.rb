=begin
Codewars. 18/05/20. 'Sums of Parts'. 6kyu. An array of integers - e.g. [0,1,3,6,10] - can be broken
down into the following parts: [0,1,3,6,10], [1,3,6,10], [3,6,10], [6,10], [10], []. The sum of these 
parts is [20,20,19,16,10,0]. Here we create a method that returns an array of the sums of an array's 
parts. Here is the solution I developed to solve the challenge.
1) We define our method parts_sums_ms, which takes ls, an array of integers as
   its argument.
2) We initialize a new array called s, for sums, and we make its first value
   the sum of the full array.
3) We then create a for loop which iterates the index of ls. As we traverse
   ls, we add to s, its last element subtracted by the current in ls.
4) If our input were [0,1,3,6,10], s would start off with [20]. On the first
   iteration s.last (20) - ls[i] (0) = 20 and this is added to s which is now
   [20,20]. Then 20 - 1 = 19 and s = [20,20,19]. Then 19 (s.last) - 3 (ls[i])
   = 16 so s = [20,20,19,16]. 16 - 6 = 10, s = [20,20,19,16,10]. 10 - 10 = 0,
   s = [20,20,19,16,10,0]. Now we have our sum of parts.
5) We return our sum of parts, s.
=end

def parts_sums_ms(ls)
  s = [ls.sum] ; for i in 0...ls.size ; s << s.last - ls[i] ; end ; s
end

=begin
Here is another solution I developed to solve the challenge, which is probably
a bit more effecient than the above because alters the existing array instead
of creating a new one.
1) We use the insert method to place them sum of the full array in the first
   position of ls.
2) We then map! over ls with index. The bang is important because it ensures
   ls values are changed as we iterate.
3) As we traverse ls, we leave the first element - sum of the full array -
   as it is, for every other element, it becomes the number before it minus
   that number.
4) If ls is [0,1,3,6,10], after insert it is [20,0,1,3,6,10]. On the first
   iteration 20 is left the same. On the second, ls[i-1] = ls[1-1] = ls[0] =
   20 - n (0) = 20, so 0 becomes 20. Third iteration, 1 becomes 20 - 1 = 19.
   Fourth, 3 becomes 19 - 3 = 16, and so on.
5) After our loop, ls has now become an array of the sum of its parts, and this
   is returned by our method.
=end

def parts_sums_ms_x(ls)
  ls.insert(0,ls.sum) ; ls.map!.with_index {|n,i| i == 0 ? n : ls[i-1] - n}
end

=begin
Here is the shortest solution. Here we add a new, sum array to a reduce 
block, as reduce's starting value, then we add the sum of its parts to the 
array as we traverse ls.
=end

def parts_sums(ls)
  ls.reduce([ls.sum]) {|s,n| s << s.last - n}
end
