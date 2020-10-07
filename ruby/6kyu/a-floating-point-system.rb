=begin
Codewars. 21/07/20. 'A floating-point system'. 6kyu. A floating point number can be represented as mantissa * radix ^ exponent, for example
0.06, if the specified number of digits in the mantissa is 10, can be represented as 6000000000 * 10 ^ -11. Here we create a method which
takes a number and an amount of digits for the mantissa, and returns a string in the form mantissaPexponent e.g. 0.06, 10 will return
'6000000000P-11' and 123456.0, 4 will return '1234P2'. Here is the solution I developed to solve the challenge.
1) We define our method mantissa_exponent_ms, which takes a number n, and a number of digits the mantissa should have as its argument.
2) The first thing we go about doing is making our exponent. The pattern I noticed is that the exponent is the number of digits before the
   decimal point, minus the digits our mantissa should have, but this is only the case if there are no leading zeros in n. When n contains
   leading zeros e.g. 0.06 or 0.4567001 an extra step is needed, we must also subtract the index position of the first non-zero digit in
   the number - 1.
3) Therefore, the first thing we do is create a variable called lead_zeros which is a boolean, if the index position of the first non-zero
   character in the string is above 0, this is true, otherwise it's false.
4) Then we create our exponent. Using string slicing we keep only the digits before the decimal point from n, take its length, then subtract
   our digits input from that length. If there are lead zeros, we also subtract the index position of the first non-zero digit - 1. This
   gives us our exponent.
5) Now we create the mantissa by removing the decimal point from n using gsub, then we remove all leading zeros. Now the mantissa starts
   with the first non-zero digit, as it should. We also slice from the first element, up to but not including the index position
   corresponding to the digits input.
6) Another pattern I deduced is that zeros needed to be added to the matissa if the exponent is negative. To calculate the amount of
   zeros that must be added, we simply subtract the length of mantissa at this stage, from digits. The reason we slice the mantissa
   previously is because some inputs with negative exponents - e.g. '1000000000.0' - will have more digits than necessary even once
   we've removed the decimal and leading zeros, of course, in this case there are no leading zeros. So without slicing, the mantissa will
   be '10000000000', this will produce a negative integer when we do digits (10) - mantissa.length (11).
7) We also slice because if our exp is positive, we may need to remove some numbers from our mantissa. For example, '123456.0' will be
   '1234560' without slicing but digits is 4, so we take [0...4] which is '1234'.
8) Finally, if the exponent is negative, we return mantissa + 0s added + Pexp. If the exponent is positive, we simply return mantissa + Pexp.
=end

def mantissa_exponent_ms(n, digits)
  lead_zeros = n.index(/[1-9]/) > 0 
  exp = n[/\d+(?=\.)/].length - digits - (lead_zeros ? n.index(/[1-9]/) - 1 : 0) 
  mantissa = n.gsub(/\./, '').gsub(/^0+/, '')[0...digits]
  (exp < 0 ? mantissa + '0' * (digits - mantissa.length) : mantissa) + "P#{exp}"
end