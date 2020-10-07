=begin
Codewars. 24/04/20. 'Simple Fun #170: Sum Groups'. 6kyu. Given an array of 
integers, sum consecutive even numbers and consecutive odd numbers. Repeat 
the process while it can be done and return the length of the final array. 
Here is a refined version of the top solution on Codewars.
1) We define our method sum_groups, which takes an array of integers as its
   argument.
2) We return the size of the array unless the array still contains any
   consecutive even numbers. a.even? == b.even? essentially evaluates whether
   both a.even? and b.even? are equal to true or false so if both are true we
   don't return arr.size because we have consecutive evens. Likewise, if both
   are false we don't return the array size, because we have consecutive odds.
3) If there are consecutives, we call sum_groups recursively with the chunking
   and summing process performed on the array.
4) arr.chunk(&:even?) returns an array of arrays where each sub-array's first
   element is a true (if it's even) and a false (if it's odd); the second
   element in the sub-array is an array with all the consecutive values that
   match the conditions of the first element.
5) We then call map(&:last) to remove those first elements (booleans) and now
   we have an array of arrays containing consecutive evens and consecutive odds.
6) We map over the array of arrays and sum each sub-array, which essentially
   sums all the odd consecutives and all the even consecutives.
7) Now we have a new array of integers. If there are no consecutives, the size
   of it is returned. If not, the chunk and sum process runs again. This
   process continues until we have no consecutive odds or evens, then we
   return the length of the final array.
9) If our starting array is [2,1,2,2,6,5,0,2,0,5,5,7,7,4,3,3,9], after the
   first recursive call it will be [2,1,10,5,2,24,4,15]. We have consecutives
   [2,24,4] so a second recursive call is done, after which we have
   [2,1,10,5,30,15]. Now we have no consecutives, so we return the array size,
   6.
10) In this method, we could substitute a.even? == a.even? with
    a.odd? == b.odd?, and it would still work, because what we're comparing is
    equal boolean values, equal boolean values mean we have a consecutive,
    either even or odd.
11) We could also substitute arr.chunk(&:even?) with arr.chunk(&:odd?),
    because regardless of which we use, consecutive odds and evens are grouped
    together as a result of either argument being placed in the chunk method.
12) Also, all 3 uses of even? could simply be uses of odd? and our method
    still would work.
=end

def sum_groups(arr)
  return arr.size unless arr.each_cons(2).any? {|a,b| a.even? == b.even?}
  sum_groups(arr.chunk(&:even?).map(&:last).map(&:sum))
end

=begin
Here is a refined version of another solution submitted by a Codewars user,
which uses the slice_when method instead of the chunk method.
1) We call the slice_when method on the array. The slice_when method takes 2
   block variables representing element before and element after and groups an
   array based on the block. It is similar to the chunk method.
2) In our slice_when block we group together consecutive evens and odds in an
   array of arrays and store this in a variable groups.
3) We return the array size if every sub-array in groups contains 1 element,
   which means we have no consecutives.
4) If not, we resursively call the method with the sub-arrays - and hence
   consecutives - summed.
5) Once there are no consecutive odds or evens, every sub-array in groups will
   contain 1 element, in which case the array size is returned.
=end

def sum_groups_sw(arr)
  groups = arr.slice_when {|a,b| a.even? != b.even?}.to_a
  return arr.size if groups.all? {|g| g.size == 1}
  sum_groups_sw(groups.map(&:sum))
end

=begin
Here is the method I found online that allowed me to pass the challenge, it's
clever in that it doesn't sum the numbers at all, but it's not a method I
would voluntarily use.
1) We call the chunk method on our array of integers with odd? passed in as an
   argument and turn this from an enumerator into an array. We essentially
   create an array of arrays where the first element of each sub-array is a
   boolean (true if odd, false if even) and the second element of the sub-array
   is all the consecutive values matching the condition of the first element.
   We store this in a variable chunks.
2) We return the size of the array passed in if it is equal to the size of it
   chunked, this basically means our original array has been chunked and
   mapped down to contain no consecutives. If not, we run the "mapped" process
   on chunks.
3) In the "mapped" process - stored in the variable mapped - we call the map
   method on the chunks array of arrays. If the first value is true (meaning
   this was an odd number) and the size of the consecutive terms of this
   number is odd also, we convert that entire sub-array to 1.
4) In all other cases, i.e. if the first element if false (meaning the
   number was even) or the first element is true but its consecutive terms are
   even in quantity, the sub-array is converted to 0.
5) If our original array we're [2,1,2,2,6,5,0,2,0,5,5,7,7,4,3,3,9], after being
   chunked and mapped it would be [0,1,0,1,0,0,0,1]. Our method is then called
   resursively with mapped passed in, mapped becomes arr and the size of mapped
   is 8, so arr.size is 8. The size of mapped (arr) chunked is 6. So in this
   instance the array size is not returned and the mapped process runs again.
6) Once mapped is chunked and mapped again it becomes [0,1,0,1,0,1], this new
   mapped is passed into the method again. This time mapped (arr) size (6) is
   equal to its chunks size (6). This gives us the size of the final array, 6.
=end

def sum_groups_ms(arr)
  chunks = arr.chunk(&:odd?).to_a
  return arr.size if arr.size == chunks.size
  mapped = chunks.map {|odd,terms| odd && terms.size.odd? ? 1 : 0}
  sum_groups(mapped)
end
