=begin
Codewars. 16/05/20. "Simple String Expansion". 5kyu. Here we create a string
expansion method that turns for example "3(ab)" into "ababab" and "2(a3(b))"
"abbbabbb". Input consists of only lower case letters and numbers 1-9 in
valid parenthesis. There will be no letters or numbers after the last closing
parenthesis. Here is the solution I developed to solve the challenge.
1) We define our method str_expansion_ms, which takes a string as its
   argument.
2) We call gsub! on the string, removing all parenthesis using our regex and
   then we reverse! the string.
3) When parenthesis are removed and our string is not reversed e.g. "3b2c" if s
   was "3(b(2(c)))", we see that we can create our desired output ("bccbccbcc")
   by working from right to left. Traverse the string then when we hit a
   number, multiply the string to the right of the number, by that number. For
   example, "3b2c" = "3bcc" = "bccbccbcc". This is why we reverse! the string.
4) We can't get our desired output by alterting the string as we traverse it,
   so we initialize a new empty string called e (for expanded).
5) We then call the each_char method to iterate over each character of the
   string, which is now only numbers 1-9 and lower case letters.
6) In our block, if we encounter a digit, we multiply the entire new string
   by that digit. If it's not a digit (it's a letter), we add that letter to e.
   Because our string is reversed, this performs our string expanding process
   as if we were traversing from right to left.
7) We return e reversed. Our expanded string.
=end

def str_expansion_ms(s)
  s.gsub!(/[()]/, '').reverse! ; e = "" ; s.each_char {|c| c =~ /\d/ ? e = e * c.to_i : e << c} ; e.reverse
end

=begin
Here is another solution, which uses gsub inside a while loop.
1) We call gsub on the string inside a while loop.
2) In our regex, (\d?) is CG1 and this matches 0 or 1 digits; followed by an
   open parenthesis \(; followed by CG2, ([a-z]+), 1 or more lower case
   letters; followed by a closing parenthesis \).
3) If our input is "3(ab)", on the first iteration our full match will be the
   entire string and CG1 will be "3", CG2 will be "ab". If our input is
   "3(b(2(c)))", on the first loop our full match will be "2(c)", CG1 will be
   "2", CG2 will be "c".
4) On each iteration we multiply CG2 by 1 if CG1 is empty (i.e. there's no
   digit before letters in parenthesis), if CG1 does have a digit, we multiply
   CG2 by that digit in integer form. This performs our string expansion.
5) We return our expanded string.
6) If our input is "3(ab)", we have a digit before our letters in parenthesis,
   so we do "ab" * 3 = "ababab". This case is handled in one iteration.
7) If s is "3(b(2(c)))", first iteration does "c" * 2 = "3(b(cc))". Now we
   have no digit before our letters in parenthesis, so we do "cc" * 1 =
   "3(bcc)" because "cc" * 1 = "cc" and from each full match the parenthesis
   are removed as they were not in capture groups. "3(bcc)" then becomes
   "bccbccbcc". Once our regex no longer produces a match, the loop finishes
   and the final (expanded) string is returned.
8) s = "k(a3(b(a2(c))))". "k(a3(b(acc)))", "k(a3(bacc))", "k(abaccbaccbacc)",
   "kabaccbaccbacc".
=end

def str_expansion(s)
  while s.gsub!(/(\d?)\(([a-z]+)\)/) {$2 * ($1 == "" ? 1 : $1.to_i)} ; end ; s
end

=begin
Here is a method which uses gsub with recusion instead of a while loop.
1) We store the regular expression that matches 0 or 1 digits, followed by
   letters in brackets (brackets non-capturing), inside a variable r.
2) If a match of our regex is found inside s, we recursively call the method
   with r passed into gsub as the regex, and the string expansion performed
   in the block i.e. letters * integer of digit if digit is found, or letter *
   1 if digit is not found.
3) When r (our regex) does not produce a match inside s, our string has been
   successfully expanded by every recursive call, so we return s.
=end

def str_expansion_x(s)
  (r = /(\d?)\(([a-z]+)\)/) =~ s ? str_expansion_x(s.gsub(r) {$2 * ($1 == "" ? 1 : $1.to_i)}) : s
end
