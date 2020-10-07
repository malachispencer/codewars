=begin
Codewars. 14/05/20. 'Most Frequent Weekdays'. 6kyu. Here we create a method that 
returns an array of the most frequent weekday(s) in a given year. Years in this 
challenge started from 1593. Here is the solution I developed to solve the challenge.
1) We require the date library.
2) We create a word array with the days of the week. In the Ruby date class,
   weeks start on a Sunday, which is indexed at 0, Monday 1, Tuesday 2 etc.
3) The date class actually has its own built-in day name array in a constant,
   which can be called with Date::DAYNAMES.
4) We define our method most_frequent_days_ms, which takes a year as its
   argument.
5) We create a date object with the start date (1st Jan) of our year and a date
   object with the end date of our year (31st Dec).
6) We create a range from the 1st of January to December 31st, then group the
   range by weekday using the group_by method and the date library's wday
   method. This gives us a hash where the keys are 0 to 6 (Sunday to Saturday)
   and the values are all the dates which fell on those days in that year.
7) We call the transform_values method with the size method passed in to
   turn our hash into a count of all the days in that year.
8) Using the hash method keep_if, we keep only the key/value pairs which
   have the highest day count. Using max or max_by tradionally would only keep
   one if there were multiple maxes, but our block allows us to keep multiple.
9) We call the keys method to extract the keys of the hash - the most frequent
   day or days - into an array.
10) The keys method returns a sorted array, but Sunday is 0 in the Ruby date
    library, but we want Sunday to be the last day of the week. So if Sunday is
    one of our most frequent days, we move it to the end of the array by
    calling insert but placing a deleted from the array 0 to the end by using
    the slice! method.
11) Now we have an array of the most frequent days in correct position, we map
    over the array and replace the index representations with their word forms
    from the DAYS word array.
=end

require "date"

DAYS = %w{Sunday Monday Tuesday Wednesday Thursday Friday Saturday}

def most_frequent_days_ms(year)
  s = Date.new(year,01,01) ; e = Date.new(year,12,31)
  d = (s..e).group_by(&:wday).transform_values(&:size)
  m = d.keep_if {|k,v| v == d.values.max}.keys
  m = m.insert(-1, m.slice!(m.index(0))) if m.include?(0)
  m.map {|d| DAYS[d]}
end
