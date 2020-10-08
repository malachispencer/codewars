=begin
Codewars. 20/05/20. 'Bob's reversing obfuscator'. 5kyu. Here we create a method 
that takes an encoded string and uses just a marker and our wits to decode the string. 
An input of ("Lor-.tile gnicsipida rutetcesnoc ,tema tis rolod muspi me", "-") should
return "Lorem ipsum dolor sit amet, consectetur adipiscing elit." An input of
("q.qSusqsitanenev cen lsin sillom subinif ecsuF .itnetop essidnep", "q") should return 
"Suspendisse potenti. Fusce finibus mollis nisl nec venenatis." Here is the solution I 
developed to solve the challenge. My solution occasionally fails a random test, delivering 
the error message "'tr' : invalid range "|-q" in string transliteration (ArgumentError)."
1) We define our method decoder_ms, which takes an encoded string and a marker,
   the marker can feature once or multiple times in the string.
2) We create an empty array called d, where we will store segments of the
   decoded message.
3) Based on a pattern that I figured out by working with the string
   "Dq.silucaiqonec mollq odommoc qis ipsum qlsin lev" and its marker "q". If
   we split each sub-section at q boundaries we get the following:
   ["D", ".silucai", "onec moll", " odommoc ", "is ipsum ", "lsin lev"].
4) Comparing with final output "Donec mollis ipsum vel nisl commodo iaculis.",
   we see that everything in an even index position doesn't need reversing,
   they only need to be appended together. Everything in an odd index position
   however, needs to be reversed and then shifted to position -1, then -2,
   then -3 etc as they are encounterd in the array.
5) With this in mind, we create an empty array where we will store our
   sub-sections, then we initialize the position counters for sub-sections
   that will be added to the new array. The first even will be placed in
   position 0 and the first odd will be placed in position -1.
6) We then split the encoded string by its markers, then iterate over it with
   index. If the index of the segment is even, we insert it in d, wherever
   even position counter is at (initially 0), then increment ev by 1.
7) If the index of the segment is odd, we insert a reversed version of that
   string in the position where the odd position counter is currently at
   (initially -1), then decrement od by 1.
8) Now our array of strings has been decoded, we return it joined back into
   a string.
9) To provide one more example, when ("q.qSusqsitanenev cen lsin sillom subinif
   ecsuF .itnetop essidnep", "q") is split into sub-sections it produces:
   ["",".","Sus","sitanenev cen lsin sillom subinif ecsuF .itnetop essidnep"].
   "" and "Sus" are appended together, "." is shifted to position -1, and
   then "sitanenev cen lsin sillom subinif ecsuF .itnetop essidnep" reversed is
   placed in position -2. Then it is all joined into the decoded string.
=end

def decoder_ms(e,m)
  d = [] ; ev = 0 ; od = -1
  e.split(m).each_with_index do |s,i|
    d.insert(ev, s) && ev += 1 if i.even?
    d.insert(od, s.reverse) && od -= 1 if i.odd?
  end
  d.join
end

=begin
Here is a superior solution, which doesn't fail any random tests.
1) We split the encoded string at its markers, then we call the partition
   method with index.
2) The partition method returns an array of 2 sub-arrays where the first
   contains the elements which evaluate to true and the second with the
   elements which evaluate to false.
3) In our block, we partition the elements which are in even index positions
   (first sub-array) and the elements which are in odd index positions (second
   sub-array). We store these sub-arrays in variables called ev and od.
4) We join the even strings and then concatenate the odd strings joined and
   reversed, leaving us with our decoded string.
=end

def decoder(e, m)
  ev, od = e.split(m).partition.with_index {|s, i| i.even?} ; ev.join + od.join.reverse
end
