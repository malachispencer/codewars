=begin
Codewars. 13/04/20. 'Prime number decompositions'. 5kyu. Here we create a program 
that takes a number and returns its prime decomposition in three forms:
1) An array with a standard prime factorisation e.g. [2,2,5,5] if n = 100.
2) An array of 2 arrays with the first contained array holding the prime
   factors and the second contained array holding the exponents in
   corresponding index positions e.g. [[2,5],[2,2]] if n = 100.
3) An array containing the product of the prime factors and exponents e.g.
   [4,25] if n == 100.
Here is a refactored version of the solution which allowed me to pass the Codewars challenge.
=end

=begin
For the standard prime factorisation, we use the prime_division method then
replicate the prime factor the amount of times of its exponent, using flat_map
instead of map ensures that this is flatten down into a single array.
=end

require "prime"

def prime_factorisation(n)
  return [] if n.is_a?(Float) || n <= 1
  n.prime_division.flat_map {|pf, exp| [pf] * exp}
end

=begin
For the primes and exponents array. I created 2 empty arrays, 1 for primes and
1 for exponents. Then I iterated over the prime_division array and added all
the primes to the prime array, and all exponents to the exponent array. Then
I returned both these arrays inside an array, to create the array of arrays.
=end

def primes_exponents(n)
  return [] if n.is_a?(Float) || n <= 1
  pfs, exps = [], []
  n.prime_division.each do |pf,exp|
    pfs << pf
    exps << exp
  end
  [pfs,exps]
end

=begin
Since my primes_exponents method was unnecessarily long winded, here is a
shorter way to perform the task. The transpose method assumes that self is an
array of arrays and transposes - swaps - the rows and columns.
=end

def primes_exponents_v2(n)
  n.is_a?(Float) || n <= 1 ? [] : n.prime_division.transpose
end

=begin
To generate the array containing the product of the prime factor and its
exponent, I simply raised the prime factor to the power of its exponent.
=end

def prime_products(n)
  n.is_a?(Float) || n <= 1 ? [] : n.prime_division.map {|pf,ex| pf ** ex}
end

