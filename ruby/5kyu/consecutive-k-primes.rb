=begin
Codewars. 22/04/20. "Consecutive k-Primes". 5kyu. Here we create a method that
returns how many times numbers in an array come up with exactly k prime
factors twice in a row. Here is the solution I developed to solve the challenge.
1) We require the prime library.
2) We define our method consecutive_kprimes_ms, which takes 2 arguments: k, the
   number of prime factors our consecutive numbers should have, and arr, the
   array of numbers.
3) We initialize a counter variable, count, to 0.
4) We iterate over the array with its index and increment count by 1 every
   time the element at index position i has k prime factors and the element
   at the index position next to it [i+1] has k prime factors.
5) We return the count. If no consecutives k-primes are found, the count
   returns 0.
6) In our kprimes method, we return 0 if the number passed in is nil - this was
   required to pass all the tests - and then we sum the exponent values to
   give us the total amount of prime factors of the number passed in.
=end

require "prime"

def consecutive_kprimes_ms(k, arr)
  count = 0
  arr.each_with_index do |n,i|
    count += 1 if kprimes(arr[i]) == k && kprimes(arr[i+1]) == k
  end
  count
end

def kprimes(n)
  n.nil? ? 0 : n.prime_division.map(&:last).sum
end

=begin
Here is another solution, submitted by a Codewars user.
1) We map over the array and convert the array into an array of each number's
   prime factor count.
2) We then use the enumerable method each_cons to iterate over 2 elements at a
   time and we attach the count method. In our count block, pf will actually
   be 2 consecutive elements in a sub-array - due to each_cons - so if both
   those elements match the form [k,k], it means we have found a consecutive
   k-prime pair and count increments by 1.
3) In the end, the final count is returned.
=end

def consec_kprimes(k, arr)
  arr.map {|n| n.prime_division.map(&:last).inject(:+)}.
    each_cons(2).count {|pf| pf == [k,k]}
end
