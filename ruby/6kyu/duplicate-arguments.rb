=begin
Codewars. 29/04/20.'Duplicate Arguments'. 6kyu. Here we create a method that 
returns true if an array contains any duplicate values, and false if it doesn't. 
Here is the top Codewars solution.
1) We define our method dup_args, which takes an array of integers or string
   characters as its argument.
2) If the length of the array changes when we call the uniq - which removes
   duplicates - method on it, we have duplicates and so we return true, if not,
   we return false.
=end

def dup_args(arr)
  arr.uniq.length != arr.length
end

=begin
Here is another solution that uses the uniq method. If the original array is
the same as the arr with uniq (duplicate remover) called on it, there are no
duplicates so we return false, if not, we return true.
=end

def dup_args_alt(arr)
  arr == arr.uniq ? false : true
end

=begin
Here is the solution I developed to solve the challenge. It is not as good as
the above methods as it involves iterating over the array twice, checking if
any element in the array has a count of more than 1, then returning true if so,
if not, return false.
=end

def dup_args_ms(arr)
  arr.any? {|e| arr.count(e) > 1} ? true : false
end
