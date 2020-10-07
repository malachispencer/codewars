=begin
Codewars. 30/04/20. 'Consecutive strings'. 6kyu. Here we create a method that 
takes an array of strings and returns the longest possible string that can be 
derived by combining k consecutive strings in the array. In the case of there 
being multiple matches, return the first. If the array is empty, or k is greater 
than the array length, or k is less than 1, return an empty string. Here is the 
solution I developed to solve the challenge.
1) We define our method longest_k_consec_ms, which takes 2 arguments, arr, an
   array of strings, and k, the amount of consecutive strings that the longest
   possible string should consist of.
2) We handle our error checking and return an empty string if the array is
   empty, or k is less than 1, or k is greater than the array size.
3) We call the each_cons method with k passed in as its argument, so now we
   have an array of arrays where each sub-array is k consecutive strings from
   the original array.
4) We map over the array of arrays and join each sub-array. So now we have an
   array of combined k-consecutive strings.
5) We call the max_by method with the length method passed in as an argument,
   which returns longest (combined k-consecutive) string. If there are more
   than 1 string with the max value, the first is returned.
=end

def longest_k_consec_ms(arr, k)
  return "" if arr.empty? || k < 1 || k > arr.size
  arr.each_cons(k).map(&:join).max_by(&:length)
end
