=begin
Codewars. 14/05/20. 'Christmas Day'. 6kyu. Here we create a method that tells 
us what day christmas on a particular year falls on. Here is the solution I 
developed to solve the challenge.
1) We require the date library.
2) We generate an array of the day names using the date library's built-in
   constant DAYNAMES and we do the same with the month names using the date
   library's built-in constant MONTHNAMES.
3) We store our sting date formats in constants to make our life easier. Our
   3 types of string date inputs can be "25 December 2020", "12 25 2020" and
   "2020 12 25".
4) We define our method christmas_weekday_ms, which takes the 3 types of string
   date inputs and a date object as its potential argument.
5) First we check if the input is a date object using the instance_of?
   method, if so, we call the wday method on the date, which returns the
   weekday of that date in number form - e.g. Sunday is 0, Monday is 1, Tuesday
   2 etc - but we use the result to index the day name array, which then
   returns the weekday in word form.
6) If it's not a date object, we check if our string date comes in the form
   "2020 12 25" by splitting it into an array and checking if the first
   element contains 4 characters, if so, we use the strptime method to turn
   our string date into a date object. The strptime method takes two arguments,
   the first the string, and the second the format of the string date, so we
   use our YMD (Year Month Day) format for this date. Again, we call the wday
   method and index DAY with the result.
7) If it's not a YMD string, we check if it's a "12 25 2020" date by checking
   if its first element - when it's split - contains 2 characters and that the
   string contains no letters, if so, we convert it to a date object, call
   wday and index DAY with the result.
8) If it's not any of the previous, it must be a "25 December 2020" date, so
   inside an index bracket of DAY, we the string to a date object and call
   wday etc.
9) But first, we must convert "December" to 12 so our string formatter can work.
   So we split the date, map over it and the element that contains letters, we
   convert it into the index position of that element - "December" - in the
   MONTH (month names) constant array, using the find_index method. If it
   doesn't contain letters, we leave the element the same. Then we join the
   array back into a string with its spaces intact.
10) While it was fun making this method, we did a lot of unnecessary work. The
    only thing we actually need from the input is the year, because the month
    and day are always the same. With that, we can shorten our code to one
    line.
=end

require "date"

DAY, MONTH = Date::DAYNAMES, Date::MONTHNAMES
DMY, MDY, YMD = "%d %m %Y", "%m %d %Y", "%Y %m %d"

def christmas_weekday_ms(d)
  d.instance_of?(Date) ? DAY[d.wday] :
  d.split.first.size == 4 ? DAY[Date.strptime(d, YMD).wday] :
  d.split.first.size == 2 && d !~ /[a-z]/ ? DAY[Date.strptime(d, MDY).wday] :
  DAY[Date.strptime(d.split.map {|e| e =~ /[a-z]/ ? MONTH.find_index(e) : e}.join(" "), DMY).wday]
end

=begin
Here is a better solution, as we can see, the only thing we need to extract from our string is the year.
1) We create a new date object, which will require a year, a month and a day in
   that order, in integer form.
2) Christmas day is always the 25th of December so we can hard code the 12 and
   the 25.
3) However, we must extract the year, and we do so by first converting our
   input to a string, in case it's a date object, strings will be unaffected
   by this. Now our date object will look like this: "2020-12-25".
4) Using the regex, we then slice the year from the date using the regex \d{4,}
   which takes any 4 or more digits from our string. We allow 4 or more in
   case we want to go beyond the year 9999. This string value however must be
   converted to an integer, so we do so.
5) Now we have our date object, we simply call the strftime method, which
   formats a date according to which of the many directives we give it. We give
   it the "%A" directive, which gives us the full weekday name capitalised.
6) "%^A" = Full weekday name all upper case.
7) "%a" = Abbreviated weekday name capitalised e.g. "Sun".
8) "%^a" = Abbreviated weekday name all upper case e.g. "SUN".
=end

def christmas_weekday(d)
  Date.new(d.to_s[/\d{4,}/].to_i, 12, 25).strftime("%A")
end
