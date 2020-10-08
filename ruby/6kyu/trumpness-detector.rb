=begin
Codewars. 03/06/20. "Trumpness detector". 6kyu. We are given a string of a "Donald Trump quote" and we must detect how much of a Trump
quote it is. "Trumpness" is calculated by summing each set of extra vowels in the string and then dividing this by the base number of
vowels in the string. For example, "HUUUUUGEEEE WAAAAAALL" contains 12 extra vowels ["UUUU","EEE","AAAAA"] and 3 base vowels ["U","E","A"]
so it has a Trumpness score of 4. Upper and lower case letters must be treated as the same. Decimal results should be rounded to 2
decimal places. Here is the solution I developed to solve the challenge.
1) We define our method trumpness_ms, which takes ts (Trump speech), a string of a Trump-like sentence as its argument.
2) We first calculate the number of base vowels by downcasing the string, calling the squeeze method to remove extra vowels, then we
   call gsub to remove all non-vowel characters. We then take the size of the base vowels. This is stored in a variable b.
3) Now we calculate the amount of extra vowels. Once again we downcase the string, the we call the scan method.
4) In our regex, ([aeiou]) matches a single vowel, followed by 1 or more repititions of that vowel (\1+). Due to both being in capture
   groups, we generate an array of arrays where each sub-array holds the first vowel as its first element, and the extra vowels as its
   second element. Only consecutive vowels will end up in our array, no base vowels that do not have extra vowels after them will end up in 
   our array.
5) We map over the array taking only the last element from each sub-array, the extra vowels. Then we join the array of extra vowels into a
   string and take its size. We store the number of extra vowels in a variable e.
6) To make our division accurate with no rounding errors, we convert both e and b to rational numbers as we perform the division, we
   then round the result to 2 decimal places.
7) We now have our trumpness score.
=end

def trumpness_ms(ts)
  b = ts.downcase.squeeze.gsub(/[^aeiou]/, '').size
  e = ts.downcase.scan(/([aeiou])(\1+)/).map(&:last).join.size
  (e.to_r / b.to_r).round(2)
end

=begin
Here is another solution I developed, using the regex of another Codewars user's solution.
1) We generate an array of every instance of 1 or more vowels using the scan method and a regex. Upper and lower cased vowels will still
   be grouped together. The array will be an array of strings.
2) We then perform our calculation. To calculate the number of extra vowels we call the sum method on v and then if the size of the
   substring is more than 1, we increment the sum by the substring size minus 1 (minus the base vowel), if the substring size is 1, we
   increment by 0. We convert the number of extra vowels to a rational number.
3) We divide the extra vowels by the total number of elements in v, which is the amount of base vowels, we convert the number of base
   vowels to a rational number.
4) We round the result to 2 decimal places.
=end

def trump_detector_ms_x(ts)
  v = ts.scan(/a+|e+|i+|o+|u+/i) ; (v.sum {|s| s.size > 1 ? s.size - 1 : 0}.to_r / v.size.to_r).round(2)
end