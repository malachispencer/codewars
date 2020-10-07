=begin
Codewars. 30/04/20. "Valid Parentheses". 5kyu. Here we create a method that
takes a string of parentheses and determines whether the order of the
parentheses is valid. For example, "(())((()())())" would be valid and so we
return true, ")(()))" would be false and so we return false. Here is the
solution I used to solve the challenge.
1) We define our method valid_parentheses_ms?, which takes a string as an
   argument.
2) We initialise a counter called bal (for balance), this will keep track of
   the balance of our parentheses as we iterate over our string.
3) We call the each_char method, which allows us to iterate over each character
   of our string.
4) If our character is an open parenthesis "(" our count increments by 1, if
   our character is a close parenthesis ")", we decrement by 1. If the balance
   is ever -1, that means we have a new close parenthesis coming before any
   open parenthesis and so we can return false right away.
5) If our loop has finished, we didn't encounter a close coming before an open,
   but we may have more open's than closes, in which case bal > 0 and we return
   false.
6) If bal is 0, our parentheses are valid because there are an equal and
   correctly ordered amount of open and closed parentheses, so we return true.
=end

def valid_parentheses_ms?(str)
  bal = 0
  str.each_char do |c|
    return false if bal == -1
    bal += 1 if c == "("
    bal -= 1 if c == ")"
  end
  bal == 0 ? true : false
end

=begin
Here is another solution, submitted by a Codewars user.
1) We convert our string to an array of characters, then we call
   each_with_object on it and iterate over every character.
2) If we encounter an open parenthesis, we add it to the new array (stack)
   using push.
3) If we encounter a close parenthesis after an open, we delete that open
   parenthesis from the stack.
4) If we encounter a close parenthesis and there is no open parenthesis to
   remove from the stack, pop will return nil, which means we have a close
   before an open and so we return false immediately.
5) Once we've iterated through the entire array of characters, if stack is
   empty the parentheses were balanced and so true is returned. If stack is
   not empty, that means it contains 1 or more open parenthesis, with of course
   no close's to match, in which case the parentheses are not valid, so false
   is correctly returned.
=end

def valid_parentheses_x(str)
  str.chars.each_with_object([]) do |c, stack|
    if c == '('
      stack.push(c)
    elsif c == ')'
      stack.pop or return false
    end
  end.empty?
end

=begin
Here is another solution, which uses gsub and a regex.
1) We delete every character apart from parentheses from the string.
2) We start a while loop and call the gsub! method with open and closed
   parentheses as the pattern to match. gsub continues to remove pairs of open
   and closed parentheses until there is no pattern left to match.
3) If after gsub has performed its work the string is empty, the string only
   consisted of balanced pairs and so the condition is true, if the string is
   not empty, all of the parentheses were not balanced and so the condition is
   false.
=end

def valid_parentheses(str)
 str = str.delete("^()")
 while str.gsub!("()","") ; end
 str == ""
end
