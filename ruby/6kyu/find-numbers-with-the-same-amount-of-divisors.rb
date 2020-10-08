=begin
Codewars. 10/04/20. 'Find Numbers with Same Amount of Divisors'. 6kyu. Here we 
create a method that tells us how many pairs of numbers up to a certain number, 
specified by a difference, have the same amount of divisors. For example, under 
50 there are 8 pairs with a difference of 1 that have the same number of divisors: 
[[2,3], [14,15], [21,22], [26,27], [33,34], [34,35], [38,39], [44,45]]. Under 100 
there are 7 pairs with a difference of 3 that have the same number of divisors: 
[[2,5], [35,38], [55,58], [62,65], [74,77], [82,85], [91, 94]]. Here is the 
solution I used to solve the Codewars challenge.
1) We require the prime library.
2) We define our 1st method count_pairs, which takes 2 arguments, diff, which
   represents the difference between the pairs, and num_max, the number we
   count pairs up to.
3) We create a range from 1 to num_max then call the select method and name
   our block variable num.
4) In our block we specify that the divisor count of num be equal to the
   divisor count of num - diff, unless num - diff is less than 1, this ensures
   we are never looking for a divisor count for 0 or lower.
5) At this point, div_count has run and our method would return all the num's
   in our range which have an equal divisor count to num - diff. It would not
   return num - diff counterparts or the pairs.
6) If our range was 1..num_max - diff and our block contained div_count(num)
   == div_count(num + diff), we'd get the counterparts, but still not the pairs.
7) We do not want the range numbers, instead, we want the count, so we tag
   count onto the end statement of our select loop. This returns the number of
   pairs with the same number of divisors under our num_max.
8) Our div_count method takes one argument, num, this will be the number in
   our range from 1 to num_max and also num - diff provided this is at least 1.
9) If num is 1, div_count returns 1, because the rest of our method will return
   a nil value if 1 is run through it.
10) When num is greater than 1, we use the prime_division method on it, which
    returns an array of arrays where each contained array holds the prime
    divisor and its exponent.
11) We map over the array of arrays and in our block variables, provide an
    underscore for the prime divisors - which we won't use - and an x for the
    exponents. We add 1 to the exponents to account for 1 not being included in
    the factorisation then multiply them using inject, which gives us the
    divisor count.
=end

require "prime"

def count_pairs(diff, num_max)
  (1..num_max).select do |num|
    div_count(num) == div_count(num - diff) unless num - diff < 1
  end.count
end

def div_count(num)
  num == 1 ? 1 : num.prime_division.map {|_,x| x + 1}.inject(:*)
end

=begin
Here we have another solution, provided by a codewars user. This is the first
half of their solution, the second half is done by my div_count method. Unlike
in my solution, in this method the range goes from 1 up to num_max - diff, then
in the block we stipulate that div_count evaluations go up to num_max. Doing it
this way round means there's never a case where a div_count is being done for a
number below 1, so no unless exemption is required like in my solution. This
solution also uses the find_all method instead of the select method and the
length method instead of the count method.
=end

def count_pairs_two(diff, num_max)
  (1...num_max - diff).find_all do |num|
    div_count(num) == div_count(num + diff)
  end.length
end
