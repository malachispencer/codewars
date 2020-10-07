=begin
Codewars. 10/05/20. 'validDate Regex'. 5kyu. Here we create a regex that will 
match a string only if it contains a valid date in the form [dd-mm].
1) In our regex, \[ matches for the start of the square bracket. \] at the end
   of the regex matches for the closing square bracket.
2) The actual date - i.e. everything inside the square brackets - is captured
   by one giant capture group, with 6 other capture groups inside it. The first
   capture group is necessary for the regex to work.
3) CG2 (0[13578]|10|12) matches months with 31 days and these are January,
   March, May, July, August, November and December. It is followed by a dash
   and then CG3 (0[1-9]|[12][0-9]|3[01]) which matches for 01-31 days.
4) An or | operator separates the next set of dates we match for. CG4
   (0[469]|11) matches months with 30 days and these are April, June, September
   and November. It is followed by a dash and then CG5 (0[1-9]|[12][0-9]|30)
   which matches for 01-30 days.
5) An or | operator separates the next set of dates we match for. CG6 (02) is
   the only month with 28 days, February. It is followed by a dash then CG7
   (0[1-9]|1[0-9]|2[0-8]) which matches 01-28 days.
6) Our valid_date? method returns true if a valid date is found in the string
   and false if not.
=end

VALID_DATE = /\[((0[13578]|10|12)-(0[1-9]|[12][0-9]|3[01])|(0[469]|11)-(0[1-9]|[12][0-9]|30)|(02)-(0[1-9]|1[0-9]|2[0-8]))\]/

def valid_date?(s)
  /#{VALID_DATE}/ === s
end
