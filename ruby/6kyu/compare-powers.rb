=begin
Codewars. 19/04/20. 'Compare powers'. 6kyu. We know what is a larger number 
between 2**10 and 2**13. Likewise, we know what is larger between 2**10 and 3**10. 
However, when the bases and exponents are both different - i.e. 6**7 and 9**4 - it 
becomes much harder to tell. Here we create a method that compares 2 power-exponent 
pairs. It returns 1 if the product of the second is larger, -1 if the product of the
first is larger and 0 if they are equal. Here is the solution - adapted from a
JavaScript solution I found on Github - which allowed me to pass the challenge.
1) We define our method compare_powers which takes 2 arguments, n1 and n2, both
   arrays of 2 elements each containing a power and an exponent.
2) For n1, we mutiply the natural logarithm of the power times the exponent
   and store this in the variable n1, thereby altering n1 to a product.
3) For n2, we do the same, multiplying the natural logarithm of the power,
   times the exponent and storing this in a new n2.
4) If n1 and n2 are equal, we return 0. If n2 is greater than n1, we return 1.
   Otherwise - if n1 is greater than n2 - we return -1.
=end

def compare_powers(n1,n2)
  n1 = Math.log(n1[0]) * n1[1]
  n2 = Math.log(n2[0]) * n2[1]
  n1 == n2 ? 0 : n2 > n1 ? 1 : -1
end

=begin
Here is another solution, submitted by a Codewars user, which also mutiplies
the natural logarithm of the power by the exponent. However, this solution uses
the spaceship operator <=> to compare them. The spaceship operator evaluates
the value of left and right, if the left is larger than the right, it returns
1, if the right is larger than the left, it returns -1, they left and right
are equal, it returns 0. If left and right are not comparable at all, it
returns nil.
=end

def compare_powers_alt(n1,n2)
  Math.log(n2[0]) * n2[1] <=> Math.log(n1[0]) * n1[1]
end
