=begin
Codewars. 05/05/20. 'Unique In Order'. 6kyu. Here we create a method which 
takes a sequence as input and returns a list of items without any duplicates 
next to each other while preserving the original order of the elements. For 
example, 'ABBCcAD' should return ['A','B','C','c','A','D']. Inputs can be a 
string, an array of integers or an array of letters. Here is the solution I 
developed to solve the challenge.
1) We define our method unique_in_order_ms, which takes a string or an array
   sequence as its argument.
2) If the sequence is a string, we convert it into an array of characters
   using split(//) and store this in an updated s variable.
3) Now we use the chunk_while method to group same consecutive elements
   together. As we can see, there is no need for an a == b block, we can simply
   place the == comparison operator in as chunk_while's argument.
4) Now we have an array of arrays where consecutive sames are grouped together,
   we simply flat_map over the array of arrays and call uniq on each sub-array.
5) Now we have an array of the unique elements with the original order
   preserved.
=end

def unique_in_order_ms(s)
  s = s.split(//) if s.is_a?(String) ; s.chunk_while(&:==).flat_map(&:uniq)
end

=begin
Here is the highest rated clever solution on Codewars.
1) Using the ternary operator, we check if the sequence is a string, if so,
   we convert it to an array of characters, if not, we leave it the same. This
   entire boolean, we wrap in parenthesis.
2) The chunk method is called on the product of the parenthesis, with itself
   passed in as chunk's argument. Now we have an array of arrays where each
   sub-array contains the character as the first element, and an array of all
   consecutive incarnations of that element as the second element.
3) We simply call map(&:first) to reduce our array of arrays down to only the
   first element from each sub-array. Now we are left with an array of the
   unique characters with the original order preserved.
=end

def unique_in_order(s)
  (s.is_a?(String) ? s.chars : s).chunk(&:itself).map(&:first)
end
