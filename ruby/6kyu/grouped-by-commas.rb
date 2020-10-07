=begin
Codewars. 02/05/20. "Grouped by commas". 6kyu. Here we create a method that
takes an integer and returns a string based number with its digits
appropriately separated by commas. Here is my favourite solution.
1) We define our method comma_num, which takes an integer as its argument.
2) We convert our integer to a string then reverse it, so we can place our
   commas starting from the end.
3) We call gsub and in our regex we match for every 3 any characters (...) -
   inevitably digits - and then we place a comma after capture group 1 (...)
   i.e. every 3 digits.
4) We reverse our number back to its original state, but now a string with
   commas.
=end

def comma_num(n)
  n.to_s.reverse.gsub(/(...)/, '\1,').reverse
end

=begin
Here is another solution, which uses scan and join instead of gsub.
1) We convert the integer to a string, then we reverse it.
2) Starting from the end of the number - which is why we reversed it - we split
   the number after every 3 digits into an array, using the scan method.
3) Our regex matches a digit /d with a quantifier {1,3} specifying between
   1 and 3 digits.
4) We join our split number back into a string, with a comma in between each
   3rd digit from the end.
5) We reverse our number again to return it to its original state, now with
   commas.
=end

def comma_num_x(n)
  n.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
end

