=begin
Codewars. 29/04/20. 'Organise duplicate numbers in a list'. 6kyu. Here we create 
a method that takes an array of integers and returns an array of arrays where each 
sub-array contains all duplicates of a particular number. The sub-arrays should be 
in the same order as the first occurrence of the numbers they contain. Here is the 
solution I developed to solve the challenge.
1) We define our method duplicate_organiser_ms, which takes an array of integers
   as an argument.
2) We call the group_by method, which groups the collection by the results of
   the block and returns a hash. By passing in the itself method as group_by's
   argument, we return a hash where the keys are the number from the array and
   the values are every incarnation of that number in the array i.e. the
   duplicates. The hash keys are in order of first appearance of that key's
   number in the array.
3) Now that our duplicates are grouped together in the values of the hash, we
   use the hash method values to return an array populated with the values of
   the hash. This gives us an array of arrays where the duplicates are
   grouped together and everything is in order of first appearance of the
   number in the original array.
=end

def duplicate_organiser_ms(arr)
  arr.group_by(&:itself).values
end
