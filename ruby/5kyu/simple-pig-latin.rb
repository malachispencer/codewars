=begin
Codewars. 22/04/20. 'Simple Pig Latin'. 5kyu. Here we create a method that takes 
a string sentence and then moves the first letter of each word to the end and adds 
"ay" to the end after that, punctuation must be ignored. Here is the solution I 
developed to pass the challenge.
1) We define our method pig_it_ms, which takes one argument, a sentence in a
   string, str.
2) We create an empty array called pig, where we will add our new,
   pig-latinised sentence.
3) We split str into an array then iterate over each word.
4) Using string slicing, we reconstruct each word in the array with the first
   letter moved to the end and "ay" added to the end of that. We do this if the
   element is identified as a word, using the regex pattern matcher for the
   \w (word) character class. We add this to pig.
5) If the element is punctuation - identified with the not word character class
   regex symbol \W - we simply add the element to pig as it is.
6) We return pigs.join(" ") to return our pig-latinised string.
=end

def pig_it_ms(str)
  pig = []
  str.split.each do |w|
    pig << w[1..-1] + w[0] + "ay" if w =~ /\w/
    pig << w if w =~ /\W/
  end
  pig.join(" ")
end

=begin
Here is another solution I developed, it is almost identical to my original
solution just that we rearrange the string by splitting it into an array of
characters, then we use the rotate method to shift every element 1 index
position to the left. Rotate with no number passed in is the same as rotate(1)
so the element in position 1 becomes the first element, and the first element
becomes the last element, we join this back then add "ay" to the end.
=end

def pig_it_ms_two(str)
  pig = []
  str.split.each do |w|
    pig << w.chars.rotate.join + "ay" if w =~ /\w/
    pig << w if w =~ /\W/
  end
  pig.join(" ")
end

=begin
Here is a better solution, taken from a Codewars user. It is the highest
clever rated solution on Codewars.
1) gsub returns a copy of the given string with all (global) occurrences of the
   pattern substituted for the second argument.
2) (\w) captures the first letter of every word, this is the first capture
   group.
3) (\w+) captures the rest of the letters of every word, this is the second
   capture group.
4) '\2\1ay' essentially says put the capture group 1 (first letter) after
   capture group 2 (the rest of letters) and after capture group 1 (first
   letter), put ay. This rearranges the string. Single quotation marks '' must
   be used instead of "" to make this substitution work.
=end

def pig_it(str)
  str.gsub(/(\w)(\w+)*/, '\2\1ay')
end
