=begin
Codewars. 27/04/20. 'Find the missing letter'. 6kyu. Here we create a method that 
takes an array of consecutive (increasing) letters and returns the missing letter. 
The array will always be a valid array with exactly one letter missing. The array 
will always contain letters in only one case. Here is the solution I developed to 
solve the challenge.
1) We define our method find_missing_letter_ms, which takes an array (arr) of
   consecutive (increasing) letters as an argument.
2) We call each_with_index on the arr, l representing letter and i for index.
3) The ord method converts a character to its ASCII value. If there is a
   difference of 2 between the ASCII value of the current letter and the next
   letter in the array, in between these letters lies the missing letter.
4) Hence we take the ASCII value of l, add 1 to it, then use the chr method to
   convert it to its character in string form. We return this immediately,
   which gives us the missing letter.
=end

def find_missing_letter_ms(arr)
  arr.each_with_index do |l,i|
    return (l.ord+1).chr if arr[i+1].ord - l.ord == 2
  end
end

=begin
Here is a great best practice solution, submitted by a Codewars user, more
effecient than creating another array as we do in find_missing_letter_c.
1) Here we use the succ (successor method), it is both a string method and an
   integer method. With integers, it returns integer equal to int + 1.
   Similarly, with strings it returns the next character e.g. "a".succ => "b".
2) In this method we iterate over the array, if the next letter in the sequence
   is not equal to l.succ (the letter which follows it), we return l.succ i.e.
   the letter which follows it i.e. the missing letter.
=end

def find_missing_letter_bp(arr)
  arr.each.with_index {|l,i| return l.succ if arr[i+1] != l.succ}
end

=begin
Here is the highest clever rated solution on Codewars. It creates a range from
the first element to the last element (which will include the missing letter),
turns this into an array, then subtracts the original array from it, leaving us
with an array holding only one element, the missing letter, so we join this
into a string.
=end

def find_missing_letter_c(arr)
  ((arr.first..arr.last).to_a - arr).join
end

=begin
Here is a final method, it is arguably the least effecient method, but I've
made it to demonstrate flexibility in solving the challenge. We create another
range from the first to the last element - with the missing included - and
convert this to an array. We map over the range array, convert all its elements
to ASCII values, then sum them; we do the same for the original array; then we
subtract the original from the range. The difference will be the ASCII value of
the missing letter, which we convert to its letter with the chr method.
=end

def find_missing_letter_r(arr)
  range = (arr.first..arr.last).to_a
  (range.map(&:ord).sum - arr.map(&:ord).sum).chr
end
