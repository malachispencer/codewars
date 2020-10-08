=begin
Codewars. 23/04/20. 'Simple Fun #303: Prime Product'. 6kyu. Here we create a 
method that can determine whether an integer can be split into 2 primes, if so, 
we return the maximum product of two primes that the integer can be split into. 
For example, 20 can be split into 7 and 13 (7 + 13) as well as 3 and 17 (3 + 17), 
the products of these 2 pairs respectively are 91 (7 x 13) and 51 (3 x 17), so the 
maximum prime product of 20 is 91. Here is the solution I developed to solve the 
challenge.
1) We require the prime library.
2) We define our method max_prime_product_ms, which takes one argument, num, an
   integer.
3) We create an empty array, products, where we will store all the products of
   prime pairs that can form num.
4) We iterate from num down to num divided by 2, because once we go below this
   we are simply grabbing the same pair products we grabbed in the upper half.
5) We skip the iteration if n is not a prime number, because then obviously it
   can't be part of a prime pair.
6) If the result of num - n, for example 20 - 17 = 3, is a prime number - 3 is
   a prime number - we have found two primes that can form num (17 + 3 = 20).
   Therefore, we add the product of them (17 * 3 = 51) to products. This occurs
   again when n is at 13, and so 13 * 7 = 91 is added to products. The
   iteration stops when we get to num / 2, because we've added all the pairs,
   if they exist.
7) If products is empty, num cannot be split into 2 primes and so we return 0.
   If not, we return the highest value in products, which is the maximum
   product of 2 primes that can form num.
=end


require "prime"

def max_prime_product_ms(num)
  products = []
  num.downto(num/2).each do |n|
    next if !n.prime?
    products << (n * (num - n)) if (num - n).prime?
  end
  products.empty? ? 0 : products.max
end

=begin
Here is a refined version of a solution submitted by a Codewars user.
1) We generate all prime numbers up to n/2, then map over them. No need to go
   all the way up to n because we only need to iterate 1 of the pair and
   calculate its counterpart with n - p.
2) If n - p is a prime number, we have have found a prime pair that forms n. In
   this instance we multiply that prime pair, thereby converting the value of
   p into the product of it multiplied by its prime counterpart.
3) If n - p is not a prime number, p becomes nil.
4) Once we've mapped over all the prime numbers up to n/2 and transformed the
   first prime of the prime pair into products, we'll have an array of nil
   values and products.
5) We use the compact method to remove all the nil values from the array.
6) We call the max method to return the max prime product of n.
7) If we don't find any prime pairs, we return 0.
=end

def prime_product_alt(n)
  Prime.each(n/2).map {|p| (p * (n - p)) if (n - p).prime?}.compact.max || 0
end
