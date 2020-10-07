=begin
Codewars. 12/05/20. 'Most Consecutive Zeros of a Binary Number'. 6kyu. Here 
we create a method that takes a string containing a base-10 integer and returns 
the count of the most consecutive zeros in that number's binary representation. 
However, the count is returned as a word number. Here is the solution I developed 
to solve the challenge.
1) First we create a number's to words hash, with the keys as integers and the
   values as their word counterpart. We store this in a constant NTW. We know
   that our highest output is 13 so we'll do our hash up to this number.
2) We define our method max_consec_zeros_ms, which takes a string number as its
   argument.
3) First we convert our string number to an integer, then we convert the
   integer to its binary representation using to_s(2).
4) We then convert the bits to an array of characters and call the chunk_while
   method, grouping together same consecutives.
5) We reject all the groups which contain a 1, keeping only the 0 groups.
6) We call max to keep only the group with the most consecutive zeros.
7) The variable m is an array of the most consecutive zeros.
8) If there were no zeros, we'll have a nil value, so we check if m is nil, if
   so, we return the value of NTW's 0 key, if not, we return NTW[m.size] to
   return the corresponing word number of the most consecutive zeros count.
=end

NTW = {0=>"Zero", 1=>"One", 2=>"Two", 3=>"Three", 4=>"Four", 5=>"Five",
       6=>"Six", 7=>"Seven", 8=>"Eight", 9=>"Nine", 10=>"Ten", 11=>"Eleven",
       12=>"Twelve", 13=>"Thirteen"}

def max_consec_zeros_ms(s)
  m = s.to_i.to_s(2).chars.chunk_while(&:==).reject {|g| g.include?("1")}.max ; m == nil ? NTW[0] : NTW[m.size]
end

=begin
Here is my favourite solution, submitted by a Codewars user.
1) We create a word array with our word form numbers. The elements correspond
   exactly to their index positions.
2) In our method, we convert our string number to an integer, then convert the
   integer to its binary form.
3) We then call the scan method with the regex /0*/, which matches 0 or more
   zeros. This returns an array of strings with empty strings where there were
   no zeros and consecutive (or single) zeros where there were any.
4) Interestingly, if we had used a + quantifer (1 or more), we also would have
   got an array of strings, with no empty strings and instead an empty array
   if the binary had no zeros, which later would have ended up a nil value when
   we called max. With the * quantifier we avoid ending up with a nil value.
5) We map over our array of strings and convert each element to its size. Then
   we call max, which gives us the most consecutive zero count.
6) All of the aforementioned inside our method, we place in square brackets,
   and use the max count to index NUMS, which returns the most consecutive
   zero count in word form.
=end

NUMS = %w{Zero One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve Thirteen}

def max_consec_zeros(s)
  NUMS[s.to_i.to_s(2).scan(/0*/).map(&:size).max]
end

=begin
Here is another solution.
1) Again we store the word numbers in a word array, this time using round
   brackets, we can also use square brackets. We previously used curly
   brackets. So the type of brackets on a word array that can be used is
   flexible.
2) Inside our method, there is no need to convert our string number to an
   integer, using the "%b" % binary conversion style we can convert an integer
   directly from string to binary.
3) Once again we call scan with the 0 or more zeros regex to create an array
   of strings with consecutive zeros together.
4) We then call max straight away and convert that max to its size and hence
   most consecutive zero count. We avoid mapping over every element like in
   our previous method.
5) Once again we index NW to return the word form of the most consecutive zero
   count.
=end

NW = %w(Zero One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve Thirteen)

def max_consec_zeros_x(s)
  NW[("%b" % s).scan(/0*/).max.size]
end
