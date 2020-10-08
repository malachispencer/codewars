=begin
Codewars. 11/04/20. 'Prime Factors'. 6kyu. Here we create a method that 
generates the prime factors of a given number. Here is the solution I 
created to solve the Codewars challenge.
1) We require the prime library.
2) We define our method prime factors, which takes one argument, num, the
   number we are generating the prime factors of.
3) We create an empty array, pf_arr, where we will store the prime factors.
4) If num is 1, the method returns an empty array. If not, we call the
   prime_division method on num which generates its prime factors and their
   exponents.
5) We add the prime factors of num to pf_arr, the exponent number of times of
   that particular prime factor. For example, the prime factor of 8 is 2 and
   its exponent is 3. So our method adds 2 to the array 3 times. We achieve
   this using exp.times do.
6) We return pf_arr which gives us the prime factors of num e.g. 8 would be
   [2,2,2].
=end

require "prime"

def prime_factors(num)
  pf_arr = []
  num == 1 ? pf_arr = [] : num.prime_division.each do |pf,exp|
    exp.times do
      pf_arr << pf
    end
  end
  pf_arr
end

=begin
Here is a much shorter solution, provided by a Codewars user. It uses the
enumerable method flat_map, which allows us to iterate over the array of arrays
created by prime_division, replicate the prime factor based on its exponent
and then flatten that array of arrays into one array.
=end

def prime_factors_v2(num)
  num == 1 ? [] : num.prime_division.flat_map {|pf, exp| [pf] * exp}
end
