=begin
Codewars. "Josephus Permutation". 5kyu. 26/04/20. Here we create a method that
returns a Josephus permutation. In other words, it takes an array (items) and
constructs a new array in the sequence of every nth (k) element from items, as
if it items were a circle and it were circling items, extracting every nth
element. Here is the highest best practice rated solution on Codewars and my
favourite.
1) We define our method josephus_perm, which takes 2 arguments, items, the
   array, and k, the every nth element we must place into the new array.
2) We initialize a new array and set its size to the size of items, because the
   new array must have all the elements from items and hence the same size.
3) To create an array with varying objects we can also pass a block to
   Array.new, which we do.
4) In our block we call the rotate! method on items and specify that items is
   rotated k places. If k is for example 3, all elements in items will be moved
   3 places to the left. The exclamation mark means items is permanently
   changed every time items it's rotated.
5) The pop method removes the last item from the array and being inside our
   Array.new block passes the last element from items into our new array every
   time it's been rotated, until Array.new's size is equal to that of items
   original size. items will be empty once our method has finished running as
   all its elements have been moved and passed into the new array.
6) If items is for example [1,2,3,4,5,6,7] and k = 3, after the first rotate it
   will be [4,5,6,7,1,2,3]. 3 (the 3rd element) will be removed from items and
   placed in the new array. Then rotate runs on items (without 3) and we get
   [7,1,2,4,5,6]. 6 is popped into the new array. We rotate again and get
   [4,5,7,1,2]. 2 is popped into the new array. Rotate = [1,4,5,7]. 7 popped.
   Rotate = [1,4,5]. 5 popped. Rotate = [4,1]. 1 popped. Rotate = 4. 4 popped.
7) Now items is empty and the new array is [3,6,2,7,5,1,4]. Notice this is the
   same as circuling items for every 3rd element - without removing any
   elements - until you've touched every element.
=end

def josephus_perm(items,k)
  Array.new(items.size) {items.rotate!(k).pop}
end

=begin
Here is the highest rated clever solution, it does virtually the same thing as
the above method, only moving each needed item to the front of items instead of
the end, then removing that first element and placing it in the new array using
the shift method, until the new array contains all of item's elements.
=end

def josephus_perm_2(items,k)
  Array.new(items.size) {items.rotate!(k-1).shift}
end
