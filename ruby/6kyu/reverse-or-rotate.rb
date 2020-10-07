=begin
Codewars. 28/05/20. 'Reverse or rotate?' 6kyu. We are given a string of digits which we must divide into chunks of a given size. If the 
last chunk is less than the given size, we can ignore it. For each chunk, if it represents an integer such that the sum of its cubed 
digits is divisible by 2, we reverse it, if not, we rotate that chunk 1 position to the left. We put together these modified chunks and 
return the result as a string. Here is the solution I developed to solve this challenge.
1) We define our method reverse_or_rotate_ms, which takes a string of digits s, and a size of the chunks sz, as arguments.
2) First we handle our error checking, if sz is 0 or its length is greater than the string, we return an empty string.
3) We then convert our string of digits to an array of characters, then call each_slice and pass in sz. Now we have an array of arrays
   with groups of sz consecutive digits as each sub-array.
4) We call reject and remove any chunk whose size is less than sz, if any exist it will be the last chunk.
5) We then map over the array of chunks, then we map over each chunk. In our chunk map, we convert each digit to an integer and then cube
   that digit. Back in our main array map, we then take those cubes and sum them. If the sum of the groups cubes is cleanly divisible by 2, 
   we reverse that chunk, if not, we rotate that chunk, which means every element in the group will move one place to the left.
6) Now our array of chunks has been correctly modified, we join them back into a string number.
=end

def reverse_or_rotate_ms(s,sz)
  return "" if sz.zero? || sz > s.length
  s = s.chars.each_slice(sz).reject {|g| g.size < sz}
  s.map {|g| g.map {|d| d.to_i ** 3}.sum % 2 == 0 ? g.reverse : g.rotate}.join
end