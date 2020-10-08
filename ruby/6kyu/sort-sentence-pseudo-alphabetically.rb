=begin
Codewars. 03/06/20. "Sort sentence pseudo-alphabetically". 6kyu. We are given a sentence containing words and punctuation. We must create
a method which places all words beginning with a lower case letter at the start of the sentence and all words beginning with an upper case
letter should come after that. Words starting with lower case letters should be sorted in ascending order, words starting with upper case
letters should be sorted in descending order. Here is an improved version of the solution I developed to solve the challenge.
1) We define our method pseudo_sort_ms, which takes a string sentence as its argument.
2) We call the scan method on the string and generate an array of all the words in the string, punctuation is ignored and not included in
   the array.
3) We then call the partition method to split the array into two arrays. The first array contains the elements which evaluate to true for
   our block, our block specifies that we partition the array by words which start with a lower case letter.
4) All words that start with a lower case letter are stored in a variable l, words that start with an array case are stored in a variable
   u.
5) We then concatenate the array's together but l is sorted, which sorts it in ascending order, then u is sorted and then reversed, which
   sorts it in descending order.
6) We then join the entire array into a string separated by spaces.
=end

def pseudo_sort_ms(s)
  l, u = s.scan(/[a-z]+/i).partition {|w| w[0] =~ /[a-z]/} ; (l.sort + u.sort.reverse).join(" ")
end