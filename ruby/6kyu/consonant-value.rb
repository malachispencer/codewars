=begin
Codewars. 01/05/20. 'Consonant Value'. 6kyu. Here we create a method that takes 
a lower case string of alphabetical characters - with no spaces - and returns the 
highest value of its consonant substrings. For example, in the input "strength" 
the consonant substrings are "str" and "ngth". The value of each consonant corresponds 
to its position in the alphabet e.g. b = 2 and z = 26. So "str" = 19 + 20 + 18 = 57
and "ngth" = 14 + 7 + 20 + 8 = 49. Thus "ngth" should be returned. Here is the
solution I developed to solve the challenge.
1) We define our method max_consonant_value_ms, which takes one argument, a
   lower case string of letters with no spaces.
2) We convert our string to an array of characters using chars then call the
   chunk_while method, the block in our chunk_while method defines the contents
   of the group, we specify that our group contain no vowels using a regex
   pattern matcher.
3) Now we have an array of arrays where only consecutive consonants are grouped
   together. No consecutive vowels are grouped together and obviously single
   cons and single vowels will be in single element sub-arrays.
4) Now we map over our array of arrays but then we also map over each sub-array
   (group) and convert all its characters to their ASCII values, then we
   subtract 96 to reduce it to its position in the alphabet.
5) Now we have an array of arrays where each sub-array contains 1 or multiple
   (consecutive consonants) alphabetical positions aka consonant values for
   the consonants.
6) We map over the array of arrays and sum each sub-array, thereby producing
   our consonant substring values.
7) We call max to return the largest consonant substring value.
=end

def max_consonant_value_ms(s)
  s.chars.chunk_while {|a,b| a =~ /[^aeiou]/ && b =~ /[^aeiou]/}.
    map {|g| g.map {|c| c.ord - 96}}.
      map(&:sum).
        max
end

=begin
Here is another solution.
1) We split the string at its vowels, so all vowels are removed (but
   consecutive vowels become empty strings). Now we have an array of strings
   with consecutive consonants (consonant substrings) grouped together.
2) Now we map over the array of strings and convert each substring into the
   product of its characters binary (ASCII) values summed, minus the length of
   the substring multplied by 96.
3) When we call sum on a string, it returns the sum of its characters ASCII
   values. To convert the ASCII sum to an alphabet sum, we must subtract
   96 multiplied by the number of characters in the substring.
4) Now we have an array of substring consonant values, we simply call max to
   return the highest.
=end

def max_consonant_value_x(s)
  s.split(/[aeiou]/).map {|ss| ss.sum - (ss.length * 96)}.max
end

=begin
Here is my favourite solution, it uses scan instead of split to create the string array.
1) We call the scan method and in our regex we request it to return an array
   of all 1 or more consonant substrings.
2) Without the + it would return an array of consonant characters, instead of
   grouping together consecutives.
3) It's cleaner than split in that consecutive vowels do not become empty
   strings in our array.
4) We map over each substring and convert them to the sum of their consonant
   values i.e. sum of their positions in the alphabet.
5) We call max to return the highest consonant value.
=end

def max_consonant_value(s)
  s.scan(/[^aeiou]+/).map {|ss| ss.sum - (ss.size * 96)}.max
end
