=begin
Codewars. 11/05/20. "Simple string indices". 6kyu. Here we create a method
that takes a string with brackets and an index of an opening bracket and we
must return the index position of the matching closing bracket. We return -1 if
there is no opening bracket at the given index position. Here is the solution I
developed to solve the challenge.
1) We define our method closing_bracket_ms, which takes a string with brackets
   and the position of the opening bracket as its arguments.
2) If there isn't an opening bracket in the n index position, we return -1.
3) We initialize a counter variable bal (for balance).
4) We iterate over each character in the string with index and skip iterations
   before the index position of n (our opening bracket).
5) We increment bal by 1 if we encounter an opening bracket.
6) We decrement bal by 1 if we encounter a closing bracket.
7) If bal becomes 0, we have found the matching closing bracket of our opening
   bracket and so we return its index position.
=end

def closing_bracket_ms(s,n)
  return -1 if s[n] != "("
  bal = 0
  s.each_char.with_index do |c,i|
    next if i < n
    bal += 1 if c == "("
    bal -= 1 if c == ")"
    return i if bal == 0
  end
end