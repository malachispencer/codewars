=begin
Codewars. 05/05/20. "Number Format". 6kyu. Here we create a method that takes
an integer and returns a string based number with commas appropriately placed,
unlike in the "Grouped by commas" kata, here we will have negative numbers. 
Here is the top solution on Codewars.
1) We define our method number format, which takes a positive or negative
   integer as an argument.
2) We convert our integer to a string.
3) We call the reverse method so that we can place commas starting from the end.
4) We call the gsub method, in our regex we match for every 3 digits (\d{3}),
   that have another digit after it (?=\d). Capture group 1 is every 3 digits
   with a digit after it, we place a comma after each.
5) Our commas are now appropriately placed, so we reverse our string to
   return it to it's normal format, now a string with commas. Negative symbols
   were untouched in this process.
=end

def number_format(n)
  n.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
end

=begin
Here is another solution, which uses scan instead of gsub.
1) We convert our integer to a string, then reverse it so we can add commas
   starting from the end.
2) We call the scan method and return an array of every 1-3 digits d{1,3} which
   could be possibly followed by a minus symbol \-? (? = 0 or 1).
3) Once we have this array of our number components, we join it with a comma
   separating the elements.
4) We then reverse it back to its original form, now a string with commas
   appropriately placed.
=end

def number_format_x(n)
  n.to_s.reverse.scan(/\d{1,3}\-?/).join(",").reverse
end
