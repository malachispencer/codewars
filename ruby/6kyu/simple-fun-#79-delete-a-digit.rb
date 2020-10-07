=begin
Codewars. 24/04/20. 'Simple Fun #79: Delete a Digit'. 6kyu. Here we create 
a method that takes an integer and returns the highest number that can be 
formed - without rearranging the number - by deleting 1 digit. Here is the solution 
I used to solve the challenge.
1) We define our method delete_digit_ms, which takes one argument, n, an
   integer.
2) If n contains only 2 digits, we return the highest of those digits.
3) For 3+ digit integers, we convert them to an array of digits.
4) In order to get the highest number with 1 less digit, we need to traverse
   the array from left to right and remove the first digit that is smaller
   than the digit to the right of it. For example, if n = 609233, 0 is the
   first digit smaller than the digit to the right of it, so removing 0 gives
   us 69233. n = 882448, we should remove 2 and return 88448.
5) To achieve this, we use the detect method on the array, tag the with_index
   method to detect, then return the first digit that is smaller than the
   digit to the right of it. If our loop ends up at the last digit in the
   array, we'll get an error because arr[i+1] = nil and we are comparing this
   with d (an integer), hence we don't make the comparison if we get to the
   last digit.
6) The result of detect is stored in the variable del. If we found a digit
   smaller than the digit to the right, it is stored in del. If we didn't -
   e.g. if n = 876221 - del is now nil, because detect returns nil if no
   matches are found.
7) If del is nil, that means we need to remove the last digit e.g. 1 from
   876221, in order to get the highest number with 1 less digit. So if del is
   nil, we make del equal to arr.last.
8) Now we use the delete_at method to remove del, delete_at takes an index
   position as its argument, so we pass in arr.index(del), which provides the
   exact position of the digit we need to delete.
9) The array now has the digits required, so we join it into a string and
   convert it into an integer, then return it.
=end

def delete_digit_ms(n)
  return n.digits.max if n.to_s.length < 3
  arr = n.digits.reverse
  del = arr.detect.with_index {|d,i| d < arr[i+1] unless arr[i+1] == nil}
  del = arr.last if del == nil
  arr.delete_at(arr.index(del))
  arr.join.to_i
end

=begin
Here is another solution, a much shorter solution, submitted by a Codewars
user. This solution utilises the combination method.
1) We convert the integer into an array of digits, digits reverses the integer,
   so we reverse it back.
2) We call the extremely useful array method, combination. The combination
   method returns an array of arrays with all possible combinations - of a
   given length - of the elements. Importantly, unlike permutation,
   combination doesn't alter the order of the elements.
3) We make the length of our combinations 1 minus the length of n's digits.
4) We call the max method to extract the highest combination.
5) We then join it into a string and convert it to an integer.
=end

def delete_digit_x(n)
  n.digits.reverse.combination(n.digits.size-1).max.join.to_i
end

=begin
Here is my favourite solution, submitted by another Codewars user. It too uses
the combination method, but uses string conversions rather than the digits
method.
=end

def delete_digit(n)
  (s = n.to_s.chars).combination(s.size-1).max.join.to_i
end
