=begin
Codewars. 04/05/20. "Count and group character occurences in a String". 6kyu.
Here we create a method that takes a string and returns a hash where the keys
are the count of how many times the characters appear in the string and the
values are an array of all the characters with that respective count, the array
should be sorted alphabetically and contain only one occurrence of each
character. Here is the solution I developed to solve the challenge.
1) We define our method count_and_group_chars_ms, which takes a string as its
   argument.
2) We use the case equality operator to assess if the string contains all
   special characters or is empty, if so we return an empty hash. This wasn't
   actually needed to pass the challenge.
3) A\ asserts position at the start of the string. \W matches any character
   that's not a word character. + is the quantifier which states 1 or more not
   word characters. \Z asserts position at the end of the string.
4) We downcase our string as upper and lower case letters should be counted as
   the same - as requested by the challenge - and then we call gsub and remove
   all special characters and leave only letters and numbers. We store this in
   an updated s variable.
5) Previously, I had attempted to use gsub! and downcase! on the original
   string but this led to failing tests.
6) We convert our string to an array of characters, then we call uniq to
   remove duplicates as duplicates are not to be in our final hash, then we
   sort the characters, as our final hash values should be sorted.
7) We call the enumerable group_by method, which returns a hash grouped by our
   parameter, in this case the count of the characters in the string. Because
   uniq and sort don't actually alter our string, the count is based on the
   string before we called these methods, meaning duplicates are counted and so
   we get a proper count of the "clean" (no special characters or spaces)
   string.
8) Additionally, group_by places in values in the order they are encountered
   when we call the method, so if we hadn't sorted our characters beforehand,
   they wouldn't be sorted in our hash, and we'd have to use
   transform_values(&:sort) to sort them. However, because we did sort them
   beforehand, they are sorted. In addition, uniq also could have been done in
   a transform_values block instead of before calling group_by.
9) Now we have a hash in the required format e.g. {3=>["e"], 2=>["t"],
   1=>["a", "b", "c", "g", "h", "m", "n", "o"]}.
=end

def count_and_group_chars_ms(s)
  return {} if /\A\W+\Z/ === s
  s = s.downcase.gsub(/[^a-z0-9]/, '')
  s.chars.uniq.sort.group_by {|c| s.count(c)}
end
