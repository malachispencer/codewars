=begin
Codewars. 14/05/20. 'Base-2'. 5kyu. Here we create 2 methods, one which 
converts an integer to negabinary and one which converts negabinary to an 
integer. Here is the solution I developed to solve the challenge.
1) In our int_to_negabinary_ms method, we first check if the input integer is
   0, if so we make our negabinary string "0", if not nb becomes an empty
   string.
2) We create a while loop as long as i is not 0.
3) In our loop, we convert our integer to negabinary (base -2) by diving it by
   -2 and placing the remainder at the front of the nb string using the prepend
   method. Then we divide the product by -2 and again place the remainder at
   the front of the nb string. We keep doing this until our integer becomes 0,
   with one caveat, whenever the remainder is negative, we add 2 to it and add
   1 to the integer, before we placing the remainder in our nb string.
4) Essentially, we've just used the formula to convert any integer to any
   negative base, if we were converting to base -3, we'd do divmod -3 and add
   3 to remainder, this would give us negaternary.
5) We return nb, the negabinary string of our integer.
6) In our negabinary_to_int_ms method, we first initialize a sum variable.
7) We then convert our negabinary string number to an integer, then call the
   digits method which converts it to a reversed array of digits. This
   reversing will come in handy.
8) If we'd convert negabinary to integer on paper, we'd have the number e.g.
   11010 (6 in int) and we'd start from right to left, our rightmost number
   would be index 0 and each to the left would increase by 1. Then we'd skip
   any zeros and everywhere we encounter a 1, we do 2 to the power of its index
   e.g. 110... 1 = 2**1, 1.. 1 = 2**3, 1 = 2**4.
9) Now if our 1 is in an even index position, we increment the sum by the
   2**i, if our 1 is in an odd index position, we decrement the sum by 2**i so
   for our example sum = 0 - 2**1 = -2 - 2**3 = -10 + 2**4 = 6.
10) This is the formula to convert negabinary to decimal (integer) and this is
    why reverse in the digits method comes in handy, because we place the
    rightmost digit at the 0 index position.
11) So our method skips any zeros, then increments the sum by 2**i if 1 is in
    an even index position and decrements sum by 2**i if 1 is in an odd index
    position. We then return the sum, which is the integer representation of
    our negabinary number.
=end

def int_to_negabinary_ms(i)
  i == 0 ? nb = "0" : nb = ""
  while i != 0 do
    i, r = i.divmod(-2)
    i, r = i + 1, r + 2 if r < 0
    nb.prepend(r.to_s)
  end
  nb
end

def negabinary_to_int_ms(s)
  sum = 0 ; s.to_i.digits.each_with_index {|d,i|
    next if d == 0 ; i.even? ? sum += 2**i : sum -= 2**i} ; sum
end

=begin
Here is another negabinary to integer method with uses map and the built-in sum
method, it is based on a solution submitted by another Codewars user.
1) We convert our negabinary string to an integer, then call digits to convert
   it to a reversed array of digits. Then we map over it with index.
2) In our block, the first operation is (-2) ** i, when placed in a bracket,
   a negative number to the power of an even positive number, yields a
   positive number. So for our aforementioned "11010" example, 01011
   calculations end up being (-2)**1 = -2, (-2)**3 = -8 and (-2)**2 = 16. Then
   summing these returns 6.
3) In this method we don't skip zeros (those values will end up being 0 anyway)
   and we don't need to check for odd and even indexes as our formula makes
   the sum work.
=end

def negabinary_to_int_x(s)
  s.to_i.digits.map.with_index {|d,i| d * (-2) ** i}
end

=begin
Here is a solution which uses bit masking and a bitwise operator.
=end

MASK = 0xAAAAAAAA

def int_to_negabinary(i)
   ((MASK + i) ^ MASK).to_s(2)
end

def negabinary_to_int(s)
  (MASK ^ s.to_i(2)) - MASK
end
