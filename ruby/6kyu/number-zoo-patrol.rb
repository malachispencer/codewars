=begin
Codewars. 28/04/20. 'Number Zoo Patrol'. 6kyu. Here we create a method that 
takes an array of numbers from 1 to n, with one missing element, and returns 
the missing number. The missing number is not necessarily in between the numbers 
in the array, it can be before position [0] or after position [-1]. Here is the 
solution I developed to solve the challenge.
1) We define our method find_missing_number_ms, which takes nums, an array of
   numbers from 1 to n - with one number missing - as its argument.
2) We create a range from 1 to the size of nums plus 1, then sum this range, we
   sum nums, then we subtract the difference, the difference is the missing
   number.
3) This algorithm is doable because nums always starts at 1 and the gap
   between values is always 1, so the last value in nums - with the missing
   number placed in - will always be the size without the missing + 1.
=end

def find_missing_number_ms(nums)
  (1..nums.size+1).sum - nums.sum
end

=begin
Here is another algorithm that can be used to solve the challenge.
1) If nums were [2,3,4], n would be 4. n plus 1 would be 5, divided by 2 would
   be 2.5. n multiplied by 2.5 would be 10. nums.sum would be 9. So 10 minus 9
   would be 1 - the missing number.
2) If nums were [1,2,3,4,5,6,7,8], n would be 9. 9 plus 1 would be 10, divided
   by 2 would be 5. n multiplied by 5 would be 45. nums.sum would be 36. So 45
   minus 36 would give us the missing number, 9.
=end

def find_missing_number(nums)
  n = nums.size + 1 ; n * (n + 1) / 2 - nums.sum
end
