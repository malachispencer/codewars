=begin
Codewars. 28/05/20. "Range Extraction". 4kyu. Here we create a method that takes an array of integers and returns a string where all ranges
are grouped together, a range is defined as at least 3 consecutive integers. For example, [-3,-2,-1,2,10,15,16,18,19,20] should return
"-3--1,2,10,15,16,18-20". This is the first 4kyu kata that I've solved on my own. Here is a refined version of the solution I developed to
solve the challenge.
1) We define our method range_extraction_ms, that takes a list of integers as its argument.
2) We call the chunk_while method on the array and group together integers as long as there is a difference of 1 between them.
3) We then call map on the chunks, if the size of the group is one or two, we leave them the same, if not, using string interpolation we
   create the range from the first element in the group to the last element in the group.
4) We then flatten the array of chunks into a one level array and then join it delimited by commas.
5) Now we have our string of integers grouped by ranges.
=end

def range_extraction_ms(l)
  l.chunk_while {|a,b| b - a == 1}.map {|g| g.size <= 2 ? g : "#{g[0]}-#{g[-1]}"}.flatten.join(",") 
end