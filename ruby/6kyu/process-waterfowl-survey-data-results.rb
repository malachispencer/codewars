=begin
Codewars. 29/05/20. 'Process Waterfowl Survey Data Results'. 6kyu. We are provided with suvery data results in the form of an array of 
strings where each string contains a duck name and a count. Our method must create a report of the survery. For example, 
["Redhead 3", "Gadwall  1", "Smew 4", "Greater Scaup 10", "Redhead 3", "Gadwall 9", "Greater Scaup  15", "Common Eider 6"] should return 
["COMEID", 6, "GADWAL", 10, "GRESCA", 25, "REDHEA", 6, "SMEW", 4]. In the survey array, the duck name and count may be separated by more 
than 1 space but will always be separated by at least 1 space. In our report array, duck names must be converted to a six letter name-code. 
Here is the solution I developed to solve the challenge.
1) We define our method duck_report_ms, which takes survey data in the form of an array of strings as its argument.
2) First we handle our error check by checking if the array in string form includes "Labrador Duck", we check using the pattern match
   operator and the literal word in our regex. If it does, we return our custom error message ["Disqualified data"].
3) Updating the s variable, we call the group_by method on it and group it according to bird name using string slicing with a regex. In our
   regex, (.+\w) is capture group 1, which matches 1 or more of any characters, followed by a single word character, because of what is
   placed after it also, this matches our duck name, regardless of how many spaces or other characters - e.g. hyphens - are included in it;
   \s+ is the 1 or more spaces after the bird name; \d+ is the count. The 1 makes sure our method groups by CG1 (the bird name).
4) Now we have a hash where the key is the duck name and the values are every occurrence of that duck in the survey array.
5) We call transform values on the hash, then map over the array of values and convert each value from the duck name and count, to just
   the count using string slicing and a regex. We then convert this count to an integer and once we've finished mapping we convert the
   entire array to its sum.
6) Now we have a hash where the key is the duck name and the value is the total count in integer form.
7) We then call transform_keys! and upcase the entire key, then split it at either a space or a hyphen (hyphen's are also considered a
   space in the duck name). Now our keys are arrays of one or more strings where each string is all or part of the duck name.
8) We call transform_keys! again, this time to turn the duck name into its 6 letter code. If the key contains one string (i.e. the duck
   name has one part) and the size of that string is less than or equal to 6, we turn the key array into that string. If the key contains 
   one string and the length of the name is more than 6, we turn that key into the first 6 letters of the duck name. If the size is 2, we
   concatenate the first 3 letters of the first word in the duck name to the first 3 letters of the second word in the duck name. If the
   size is 3, we concatenate the first 2 letters of each of the 3 words in the duck name. Finally, if the size is 4, we concatenate the
   first letter from the first 2 words and the first 2 letters from the last 2 words.
9) Now our duck name's are correctly coded, we simply sort the hash, which sorts by the keys and converts the hash into an array. Then we
   flatten the array. Giving us our duck report in the required format.
=end

def duck_report_ms(s)
  return ["Disqualified data"] if s.join =~ /Labrador Duck/
  s = s.group_by {|b| b[/(.+\w)\s+\d+/, 1]}.transform_values {|v| v.map {|b| b[/\d+/].to_i}.sum}
  s.transform_keys! {|k| k.upcase.split(/\s|\-/)}
  s.transform_keys! do |k|
    k.size == 1 && k[0].size <= 6 ? k[0] :
    k.size == 1 && k[0].size > 6 ? k[0][0..5] :
    k.size == 2 ? k[0][0..2] + k[1][0..2] :
    k.size == 3 ? k[0][0..1] + k[1][0..1] + k[2][0..1] :
    k[0][0] + k[1][0] + k[2][0..1] + k[3][0..1]
  end
  s.sort.flatten
end