=begin
Codewars. 19/05/20. 'Most frequently used words in a text'. 4kyu. Here we create 
a method that takes a string of text - which can include punctuation or line breaks - 
and returns the top 3 most occuring words in the text. For example, 
"e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e" should return ["e", "ddd", "aa"]. 
Words may contain one or more apostrophes and words should be treated case-insensitively 
and returned lower case. Here is the solution I used to solve the challenge, after having
to look up solutions on Github.
1) We define our method top_3_words, which takes a string of text as its
   argument.
2) We downcase the string as we should treat matches case insensitively.
3) We then call the scan method to create an array of all the words in the
   text. In our regex, [a-z']+ matches 1 or more letters or apostrophes and
   placing word boundaries \b either side of it ensures that apostrophes by
   themselves are not matched. Essentially, our regex creates an array of
   words which may or may not contain apostrophes.
4) We then call the group_by method and group all of the same words together.
5) We then turn the values of the hash into their size, thereby leaving us with
   a hash where the key is the word and the value is the count of the word in
   the text.
6) We then sort the hash according to the count's as if they were negative
   integers, which puts the largest takes first and leaves us with an array of
   arrays rather than a hash.
7) We then use the take method to grab the first 3 elements of the array of
   arrays, which gives us the top 3 counts.
8) We map over the array and keep only the words.
=end

def top_3_words(s)
  s.downcase.scan(/\b[a-z']+\b/).group_by(&:itself).transform_values(&:size).sort_by {|k,v,| -v}.take(3).map(&:first)
end

=begin
Here is another solution.
1) We downcase the string then call the scan method to generate an array of
   all the words in the text.
2) In scan's regex, we match a single letter [a-z] followed by 0 or more
   letters or apostrophes [a-z']*.
3) We then call inject on the array of words and initialize a counter hash
   inside inject's initializer.
4) In our block we make the keys of our hash the word and increment its count
   by 1 every time that word is found. We then return the hash from inside
   the inject block, without this the hash would not automatically return.
5) We then sort the hash with counts in descending order thereby converting it
   from a hash to an array of arrays.
6) We grab the first 3 sub-arrays, then map over them and keep only the first
   element from each. Now we have an array with the top 3 most frequently used
   words in the text.
=end

def top_3_words_x(s)
  s.downcase.scan(/[a-z][a-z']*/).inject(Hash.new(0)) {|h,w| h[w] += 1 ; h}.sort_by {|k,v| -v}.first(3).map(&:first)
end
