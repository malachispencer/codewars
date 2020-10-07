=begin
Codewars. 24/05/20. 'Prize Draw'. 6kyu. To participate in a prize draw each person gives his or her first name. The letter of each person's 
name has a value, that value is that letter's position in the alphabet. The sum of the name's values is taken, which is then added to the 
length of the name. Each name has a weight associated with it, the sum of the name plus the size of the name is then multiplied by the 
weight. The names are then sorted from the highest (winning) number down to the name in last place. Our method returns the name in r 
position. Here is the solution I developed to solve the challenge.
1) We define our method prize_draw_ms, which takes 3 arguments: a string of participant names, ns, weights corresponding to each name, w, 
   and the rank we must return, r.
2) If ns is empty, we return "No participants".
3) If the rank we must return is greater than a number of participants, we return "Not enough participants", by checking if r is greater
   than the number of weights (which all correspond to a name).
4) We split our string of names at the commas, because a comma separates each name. Then we map over the array of names.
5) For each name, we turn it into an array of 2 elements, the name as the first element, and then an array of the alphabet positions 
   (i.e. value) of each letter as the second element.
6) Now we map of the array of arrays again, once again we leave the name in its place as the first element, but we convert the array of
   values into its sum added to its size.
7) We then map over array of arrays with index, once again keeping the names the same as the first element of each sub-array, but this time
   multiplying the number next to the name by the element in the same index position in the weights array. The weight for each name is in
   the same index position as the order of the names in the original string and our array.
8) Now we have an array of arrays where each sub-array holds a participant name, and that participants final value. The person with the
   highest number is the winner and the person with the lowest number is in last place.
9) Now we have to sort our participants from first to last place, but if multiple participants have the same final value, they need to be
   sorted in alphabetical order. So we call sort_by and pass in [-b, a], this ensures that the highest value is placed first, then same
   values are sorted alphabetically e.g. ["Benjamin", 152], ["Benjanim", 152], ["Benjamni", 152] will be sorted ["Benjamin", 152], 
   ["Benjamni", 152], ["Benjanim", 152].
10) Finally, we return the name of the person in rth position.
=end

def prize_draw_ms(ns, w, r)
  return "No participants" if ns == ""
  return "Not enough participants" if r > w.size
  ns = ns.split(",").map {|n| [n, n.chars.map {|c| c =~ /[A-Z]/ ? c.ord - 64 : c.ord - 96}]}
  ns.map! {|n| [n.first, n.last.sum + n.last.size]}
  ns = ns.map.with_index {|n,i| [n.first, n.last * w[i]]}.sort_by {|a,b| [-b, a]}
  ns[r-1].first
end