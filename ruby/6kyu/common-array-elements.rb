=begin
Codewars. 11/05/20. 'Common array elements'. 6kyu. Here we create a method 
that takes 3 arrays of integers and returns the sum of elements that are common 
in all three arrays. For example, [1,2,2,3],[5,3,2,2],[7,3,2,2] will return 7 
because 2, 2 and 3 are common in all three arrays. Here is the solution I 
developed to solve the challenge.
1) We define our method common_ms, which takes 3 arrays as its arguments.
2) First we generate counter hashes of all the arrays using our hashify method
   and store these in variables ah, bh and ch.
3) Our hashify method does returns exactly the same thing as a traditional
   counter hash i.e. arr.each_with_object(Hash.new(0)) {|e, h| h[e] += 1}.
4) We map over ah - we also could have mapped over bh or ch, any of them - and
   if bh and ch contain the same key/original array element/integer, we
   multiply that key/integer by the minimum count of that integer in all 3
   original arrays. This way if the count is 1,1,2 for example, we correctly
   get 1 of that common element. Also, if for example, 2 is encountered 2 times
   in each array (2,2,2), we get 2*2 = 4.
5) Now we have an array of common elements and nil values where non-common
   elements were in ah, so we call the compact method to remove the nil values.
6) We call the sum method to return the sum of the common elements.
=end

def common_ms(a,b,c)
  ah, bh, ch = hashify(a), hashify(b), hashify(c)
  ah.map {|k,v| k * [ah[k], bh[k], ch[k]].min if bh[k] && ch[k]}.compact.sum
end

def hashify(arr)
  arr.group_by(&:itself).transform_values(&:size)
end

=begin
Here is another solution, inspired by another Codewars user's solution.
1) We create our counter hashes of the three arrays and store them in ah, bh
   and ch.
2) Unlike in my solution which usese group_by and transform_values, the counter
   hash here is created with the more traditional Hash.new(0) counter hash.
3) We call the reduce method on the keys of ah and initialize the sum to 0,
   which is required. In a reduce block, the sum is the first block variable
   and the second block variable is the elements.
4) We increment the sum by the element multiplied by its minimum count in all
   3 arrays, so this will only happen if the element actually exists in all 3
   arrays.
=end

def common(a,b,c)
  ah, bh, ch = hash_count(a), hash_count(b), hash_count(c)
  ah.keys.reduce(0) {|sum, e| sum += e * [ah[e], bh[e], ch[e]].min}
end

def hash_count(arr)
  arr.each_with_object(Hash.new(0)) {|e, h| h[e] += 1}
end

=begin
Here is a final solution, submitted by a Codewars user.
1) We place the three arrays into an array, then map over this array and
   for each array turn it into a counter hash. These are stored in the
   variables ah, bh and ch.
2) The & operator allows us to perform array intersection, which combines
   arrays without duplicates, so we do this for a, b and c.
3) Using inject - initialized to 0 - we iterate over the common elements of
   a, b and c, and increment the sum by the element multiplied by its minimum
   count from the 3 arrays.
4) This method didn't work when trying to use the group_by counter hash, it
   returned a nil error when attempting to do the multiplication.
=end

def common_x
  ah, bh, ch = [a,b,c].map {|arr| arr.each_with_object(Hash.new(0)) {|e,h| h[e] += 1}}
  (a & b & c).inject(0) {|sum, e| sum += e * [ah[e], bh[e], ch[e]].min}
end
