=begin
Codewars. 29/05/20. "Word Mesh". 6kyu. We are provided with an array of strings. The words in the array should mesh together where one or 
more letters at the end of a word will be the same as the first few letters at the start of the next word, they should both be in the same
order. Here we create a method that returns a string of the meshed letters if all words in the array mesh together, if not, we return
"failed to mesh". Here is the solution I developed to solve the challenge.
1) We define our method word_mesh_ms, which takes an array a strings where words should be meshable as its argument.
2) We call each_cons(2) then we map over each 2 consecutive strings in the array.
3) As we map, we join the 2 strings and delimit them with a dot, then we call the scan method. In our regex, we match a set of word
   characters \w+, followed by a dot \., followed by a repitition of capture group 1, the word characters. This generates an array of a
   string which consists of letters at the end of the first word, which are exactly the same as the letters at the start of the second word.
   In other words, the meshed letters. Delimiting with the dot allows our regex to be more accurate.
4) Now we have an array of arrays, where each sub-array contains another sub-array, which holds the meshed letters.
5) If our array contains an empty sub-array, it means the entire array was not meshable, therefore we return "failed to mesh". If not, we 
   join the array and return the string of meshed letters.
=end

def word_mesh_ms(arr)
  m = arr.each_cons(2).map {|w| w.join(".").scan(/(\w+)\.\1/)} ; m.include?([]) ? "failed to mesh" : m.join
end

=begin
Here is another solution, submitted by another Codewars user.
1) On an empty string, we call the tap method, which allows us to edit this string inside a block, the block variable m represents our
   empty string.
2) We then call the each_cons method with 2 passed in so we can iterate over every 2 consecutive words.
3) Inside our each_cons(2) block, we create another block which runs until a ends with b, then inside this block we remove the last
   character from b, until a ends with the same characters remaining in b. This will occur if the words are meshable, so when this does
   occur the until loop is broken out of, then we're back in the each_cons loop, where we add b (the meshed letters) to m. As we are not
   map!-ing over the array, permanent changes are not made to any elements in it.
4) If the words are not meshable, b will eventually become empty, so when this does occur, we return "failed to mesh" because not all the
   words in our array can be meshed.
5) Once we have iterated all each 2 consecutive words, tap automatically returns its contents, which is the meshed letters.
=end

def word_mesh(arr)
  "".tap do |m|
    arr.each_cons(2) do |a,b|
      until a.end_with?(b)
        b = b.chop
        return "failed to mesh" if b.empty?
      end
      m << b
    end
  end
end