=begin
Codewars. 20/04/20. 'Is Integer Array?' 6yku. Here we create a method that checks 
if every element in an array is an integer or float with no decimals, in which 
case we return true. In all other cases, we must return false. Inputs can be nil 
or strings instead of an array, in which case we must also return false. Here is 
the solution which allowed me to pass the challenge.
1) We check if the input is a string or nil or if any element in the array is a
   nil value or a float with decimals, in which case we return false.
2) If not, we return true as the input is in array containing all integers and
   floats with no decimals.
=end

def is_int_array_ms(arr)
  arr.is_a?(String) || arr.nil? || arr.any? {|e| e.nil? || e % 1 != 0} ? false : true
end

=begin
Here is another solution, almost identical to one submitted by a Codewars user.
We check if the input is an array and all its elements are integers or floats
with no decimals, in which case true is returned, and if not false is returned.
=end

def is_int_array_alt(arr)
  arr.is_a?(Array) && arr.all? { |e| e.is_a?(Integer) || e.is_a?(Float) && e % 1 == 0}
end

=begin
Here is the most concise solution, taken from another Codewars user. It checks
if the input is an array and if all elements inside it converted to an integer,
will have the same value as that element before it was converted e.g. 4.0.to_i
== 4. If this is case, true is returned, if not, false is returned.
=end

def is_int_array(arr)
  arr.is_a?(Array) && arr.all? {|e| e.to_i == e}
end
