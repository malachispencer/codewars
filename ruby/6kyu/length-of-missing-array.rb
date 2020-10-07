=begin
Codewars. 28/04/20. 'Length of missing array'. 6kyu. Here we create a method 
that takes an array of arrays, if you sort the sub-arrays by length you'll see 
that their length values are consecutive, but one is missing, our method must 
return the missing array length. If the array of arrays is empty or nil, we 
return 0. If any sub-array is empty or nill, we return 0. Here is the solution 
I developed to solve the challenge.
1) We define our method missing_array_length_ms, which takes aoa, an array of
   arrays as its argument.
2) First we handle our error checking. We return 0 if aoa is nil or aoa is
   empty or aoa includes a nil sub-array or aoa includes an empty sub-array.
3) We map! over each sub-array and convert them from their values, to their
   lengths. Now our array of arrays has become an array holding lengths. The
   exclamation mark is important as this permanently changes aoa, without it
   the method wouldn't work.
4) We permanently sort! aoa, so now aoa is a sorted array of consecutive
   lengths with one length missing. Once again, the exclamation mark is crucial.
5) We call each_with_index and if the next element in aoa is not equal to the
   successor (size+1) of the current element, we return the successor, in other
   words, the missing length. The succ method returns the integer equal to
   int + 1.
=end

def missing_array_length_ms(aoa)
  return 0 if aoa.nil? || aoa.empty? || aoa.include?(nil) || aoa.include?([])
  aoa.map!(&:size).sort!.each_with_index do |s,i|
    return s.succ if aoa[i+1] != s.succ
  end
end

=begin
Here is another solution, submitted by a Codewars user. It is very similar to
mine in that it converts the sub-arrays to their lengths and then sorts them.
The difference is that it uses each_cons to iterate 2 elements of the array of
lengths at a time, if the difference between the next and current is 2, we
return the current + 1. This returns the missing length.
=end

def missing_array_length(aoa)
  return 0 if aoa.nil? || aoa.empty? || aoa.include?(nil) || aoa.include?([])
   aoa.map(&:size).sort.each_cons(2) do |a, b|
    return a + 1 if b - a == 2
  end
end

=begin
Here is another solution, it is not an efficient solution, but it makes use of
some unfamiliar language features.
1) We check if the array of arrays contains any empty sub-arrays, in which case
   we return 0.
2) If not, we run the following sequence of code inside a single parenthesis
   (must be in parenthesis to work).
3) We map! (exclamation necessary) over the array of arrays and convert the
   sub-arrays to their lengths. Now aoa is an array of lengths.
4) We use Range.new to create a range and pass in *aoa.minmax.
5) Range.new normally takes at least 2 arguments in the form Range.new(1, 10)
   or Range.new(aoa.min, aoa.max).
6) The enumerable method minmax returns a 2 element array with the minimum
   value and maximum value of the enumerable object it's called on. So if aoa
   were [1,5,3,4] it would return [1,5].
7) Range.new(*aoa.minmax) with the splat operator essentially uses the min
   value as the start of the range and the max value as the end of the range.
   Hence this range will include the missing length.
8) We convert the range to an array and subtract aoa from it, leaving us with
   the missing length, we use [0] to return it.
9) rescue returns 0 if any errors are encountered during our code in
   parenthesis, which will be a nil array, an empty array or a sub-array that's
   a nil value.
=end

def missing_array_length_r(aoa)
  aoa.any?(&:empty?) ? 0 : ( aoa.map!(&:size) ;
  (Range.new(*aoa.minmax).to_a - aoa)[0] ) rescue 0
end
