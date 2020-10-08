=begin
Codewars. 11/04/20. 'Numbers with The Highest Amount of Divisors'. 5kyu. Here 
we create a program that takes an array of integers and returns an array 
containing the size of the list, the number of prime numbers in the list, the 
maximum amount of divisors any number or numbers in that list has, and that 
number or numbers. Results are returned in the format: [26, 4, [18, [288]]]. 
This is the solution I used to solve the kata.
1) We require the prime library.
2) We define our results_returner method, which takes one argument, the array
   of integers, returns the array size and runs 2 of our worker methods.
3) Our primes method iterates over the array and counts up all the prime
   numbers.
4) Our div_count method will be called inside our max_divs method and its
   argument will be each number in the array we passed into results_returner,
   it performs the task of counting up the divisors of each number in the
   array.
5) Our max_divs method takes one argument, the array we passed into
   results returner.
6) It starts off by creating 2 empty arrays, maxes, where we will store all the
   numbers that have the highest div_count, and divs, where we store the
   divisor count of every number in the array.
7) We iterate over the array using each and add all the numbers div_counts to
   the divs array.
8) We then call the sort! method on divs, which pushes the highest divisor
   count value to the end of that array. The exlamation mark ensures that divs
   is permanently sorted.
9) We iterate over the main array again using each and if the number's divisor
   count is equal to divs.last (the highest divisor value), we add that
   number to the maxes array. This is how we ensure that if there are multiple
   numbers in the array with the highest divisor count, they all are returned.
   When we tried to use max_by it only returned one of them.
10) We make our max_divs method return the highest divisor count (divs.last)
    and a sorted list of the maxes (maxes.sort). We allow max_divs to take care
    of some of the formatting that Codewars required by placing them in an
    array [divs.last, maxes.sort]. This spared me having be confused at the
    formatting in the results_returner method.
=end

require "prime"

def results_returner(list)
  [list.size, primes(list), max_divs(list)]
end

def primes(arr)
  arr.count {|e| e.prime?}
end

def div_count(num)
  num == 1 ? 1 : num.prime_division.map {|_,x| x + 1}.inject(:*)
end

def max_divs(arr)
  maxes, divs = [], []
  arr.each {|num| divs << div_count(num)}
  divs.sort!
  arr.each {|n| maxes << n if div_count(n) == divs.last}
  [divs.last, maxes.sort]
end