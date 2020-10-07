=begin
Codewars. 17/04/20. 'Find The Parity Outlier'. 6kyu. Here we create a method 
that returns the outlier from an array that should be all odd numbers or an 
array that should be all even numbers. Here is the solution that allowed me 
to pass the Codewars challenge.
1) We define our method find_outlier_ms, which takes one argument, an array of
   all but one even numbers or all but one odd numbers.
2) We create 2 empty arrays, odds and evens, where we will store our odd and
   even numbers from the array.
3) We iterate over the array then add all numbers which are not perfectly
   divisble by 2 (odd numbers) to the odds array, we add all numbers which are
   perfectly divisible by 2 to the evens array. We also could have used the
   odd? and even? methods here.
4) If the count of odds is 1, we return the first element in odds, if not, the
   count of evens must be 1, so we return the first element in evens.
=end

def find_outlier_ms(arr)
  odds, evens = [], []
  arr.each do |num|
    odds << num if num % 2 != 0
    evens << num if num % 2 == 0
  end
  odds.count == 1 ? odds[0] : evens[0]
end

=begin
Here is another solution, submitted by a Codewars user.
1) We call the enumerable method partition on the array. The partition method
   returns an array of arrays holding 2 sub-arrays, the first containing the
   elements for which the block returns true, and the second containing the
   rest.
2) As we have passed in the odd? method to partition, the first sub-array will
   contain the odds and second the evens.
3) We then use the find method, which returns the first element that matches
   the condition we specify.
4) We pass in the one? method to find. The one? method returns true if one
   element matches a condition we specify and it also can check if the size of
   an array is 1. In this case we are finding the first array with a size of 1.
5) We return the first - and only - element from the array whose size is 1.
=end

def find_outlier(arr)
  arr.partition(&:odd?).find(&:one?).first
end

=begin
Here is another short and simple solution, submitted by another Codewars user.
If the count of the evens in the array is 1, we find the first - and only -
even. If not, we find the first - and only - odd.
=end

def find_outlier_alt(arr)
  arr.count(&:even?) == 1 ? arr.find(&:even?) : arr.find(&:odd?)
end
