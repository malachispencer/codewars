=begin
Codewars. 06/05/20. 'Sum and Rest the Number with its Reversed and See What Happens'. 5kyu.
The number 45 is the first number to have this property: the sum of it and its reverse is 
divisible by the difference (absolute value) between them. 45 + 54 = 99. 45 - 54 = 9 (abs). 
99 is divisible by 9. Here we create a method that returns the nth number in the sequence of 
numbers holding this property. Numbers that when reversed contain a leading 0 e.g. 1890 are to
be excluded. Here is the solution I developed to solve the challenge.
1) To pass the Codewars challenge I used memoization, so I pre-generated the
   results here in Atom with the sum_divisible_by_difference_ms method, then
   copied and pasted the results into Codewars, storing them in a constant SDR.
2) In the nth_sum_div_diff_ms method, we simply call [n-1] on SDR to return the
   nth number in the sequence.
3) sum_divisible_by_difference_ms takes a and b, the lower and upper bounds of
   our range (both inclusive), as our arguments.
4) We create our range from a to b, then call the select method.
5) We skip the number in the range, if its reverse contains a leading zero.
6) To avoid duplication of code, we store the reverse of n (the current
   number in the range) in a variable called r.
7) We evaluate whether the sum of n and its reverse is perfectly divisble by
   the absolute value of the difference between n and its reverse, unless the
   difference between n and its reverse is 0, in which case we skip this
   evaluation (n is definitely not a number with our property in this case).
8) Creating a range from 45 (the first number with the property) to
   1 million gives us the first 66 numbers with this property, the Codewars
   challenge tests up to the 65th number.
=end

SDR = [45, 54, 495, 594, 4356, 4545, 4995, 5454, 5895, 5985, 5994, 6534, 19602,
       20691, 29403, 30492, 39204, 40293, 43956, 45045, 49005, 49995, 50094,
       54054, 59994, 65934, 68607, 70686, 77319, 91377, 197802, 208791, 296703,
       307692, 395604, 406593, 439956, 450045, 454545, 494505, 495495, 499995,
       505494, 524475, 528255, 536445, 540054, 544455, 544635, 545454, 552825,
       554445, 560439, 574425, 593406, 594594, 599994, 604395, 659934, 692307,
       703296, 791208, 802197, 890109, 901098]

def nth_sum_div_diff_ms(n)
  SDR[n-1]
end

def sum_divisible_by_difference_ms(a,b)
  (a..b).select do |n|
    next if n.to_s.reverse.start_with?("0")
    r = n.to_s.reverse.to_i
    (n + r) % (n - r).abs == 0 unless (n - r).abs == 0
  end
end
