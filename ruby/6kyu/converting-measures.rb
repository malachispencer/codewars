=begin
Codewars. 04/06/20. 'Converting Measures'. 6kyu. Here are a given a string containing a recipe with all measurements in tablespoons (tbsp) 
and teaspoons (tsp). Let's assume 1 tablespoon = 15g and 1 teaspoon = 5g. We must append the tablespoon and teaspoon measuresments, the 
measurement in grams, always rounding up. Here is the solution I developed to solve the challenge.
1) We define our method convert_recipe_ms, which takes recipe string as its argument.
2) We call gsub on the string and we match each tablespoon measurement, which can be 1 or more digits \d+ followed by a space, followed
   by "tbsp" (tbsp), or it could be a fraction \d\/\d followed by a space, followed by "tbsp".
3) We keep capture group 1 (the digits or fraction), the space and "tbsp", then we add a space, followed by the number or fraction - 
   converted to a rational number - mutliplied by 15. We call ceil to always round up the product and place our gram symbol after. The
   grammage is wrapped in brackets, as required.
4) Rational numbers in Ruby are fractions, they allow us to write programs without any rounding errors. In our case we need it to convert
   our string fraction to an actual fraction.
5) The same process we performed on tablespoons, we call gsub again and do on teaspoons, this time mutliplying the number or fraction by
   5.
6) Our recipe now has its measurements converted.
=end

def convert_recipe_ms(r)
  r.gsub(/(\d+|\d\/\d) (tbsp)/) {"#{$1} #{$2} (#{($1.to_r * 15).ceil}g)"}.gsub(/(\d+|\d\/\d) (tsp)/) {"#{$1} #{$2} (#{($1.to_r * 5).ceil}g)"}
end

=begin
Here is a slightly shorter version of my solution, where we accomplish the conversions in one gsub block by utilising booleans.
=end

def convert_recipe_ms_x(r)
  r.gsub(/(\d+|\d\/\d) (tbsp|tsp)/) {"#{$1} #{$2} (#{($2 == "tbsp" ? $1.to_r * 15 : $1.to_r * 5).ceil}g)"}
end