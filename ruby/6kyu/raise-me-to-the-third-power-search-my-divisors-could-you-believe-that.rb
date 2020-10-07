=begin
Codewars. 15/04/20. 'Raise Me to The Third Power, Search My Divisors... .....Could You Believe that?' 6kyu. 
Here we create a program that numbers whose divisor sum is a divisor of its cube, then returns the nth number 
in that sequence. The Codewars challenge specified that we should use memoization to have the highest speed for 
testing. Memoization is an optimisation technqiue used primarily to speed up computer programs by storing the 
results of expensive function calls and returning the cached result when the same input occurs again. Here is the
solution I used to solve the Codewars challenge.
1) I pre-generated all the numbers whose divisor sum is a divisor of its cube,
   up to the 120th term in atom, then stored them in a constant array RESULTS.
2) In the method div_sum_divisor_of_cube, to return the nth term we do n-1
   because the 1st term will be in the 0 index position and thus the 120th term
   will be in the 119th index position, of the RESULTS array.
=end

RESULTS = [
  6, 28, 30, 84, 102, 120, 364, 420, 496, 672, 840, 1080, 1092, 1320, 1428,
  1488, 1782, 2280, 2716, 2760, 3276, 3360, 3444, 3472, 3480, 3720, 4452, 5640,
  7080, 7392, 7440, 7560, 8128, 8148, 8736, 8910, 9240, 9480, 10416, 10920,
  11880, 12400, 15456, 15960, 16368, 16380, 17880, 18360, 18600, 19320, 20520,
  20832, 22920, 23880, 24360, 24384, 24612, 24840, 24948, 25080, 25296, 26208,
  27552, 28680, 30240, 30256, 30294, 31320, 31584, 32760, 33480, 34224, 34440,
  35640, 36036, 37200, 41160, 43680, 45136, 49560, 50760, 52080, 52440, 55692,
  55776, 55860, 56760, 56896, 57240, 57480, 62992, 63720, 63840, 65184, 65884,
  66120, 66960, 69720, 69936, 71880, 74004, 76680, 78864, 81480, 81840, 83160,
  84360, 85320, 85344, 86800, 88452, 90768, 94446, 96096, 96120, 98280, 104160,
  104280, 105648, 107160
]

def div_sum_divisor_of_cube(n)
  RESULTS[n-1]
end

=begin
Here are the methods I used to generate the results in Atom. In
div_sum_divisors, we iterate starting from 2, check if each number's divisor
sum is a divisor of its cube, and if so add this to a results array, then break
out of the loop when the size of the results array is n i.e. 120. In the
div_sum method we calculate the divisor sum by iterating from 1 up to the
square root of num, then incrementing the summed divisor pairs and the square
root if that is a perfect square. For example, the divisor pairs of 100 are
1 and 100, 2 and 50, 4 and 25, 5 and 20, then the square root is 10.
=end

def div_sum_divisors(n)
  results = []
  (2..1_000_000).each do |num|
    results << num if (num**3) % div_sum(num) == 0
    break if results.length == n
  end
  results
end

def div_sum(num)
  sum = 0
  (1..Math.sqrt(num)).each do |e|
    sum += e + (num / e) if num % e == 0 && e != (num / e)
    sum += e if num % e == 0 && e == (num / e)
  end
  sum
end
