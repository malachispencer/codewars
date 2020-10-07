=begin
Codewars. 21/07/20. 'Build Tower'. 6kyu. Here we create a method that builds a tower having n amount of floors. Here is the solution I
developed to solve the challenge.
1) We define our method tower_builder_ms, which takes the amount of floors our tower must have as its argument.
2) The pattern I deduced is that every floor is its ordinal position multiplied by two, minus one. By ordinal position we mean 1, 2, 3
   instead of index positions i.e. 0, 1 2.
3) Thus we create a range from 1 up to and including n, then we map over each number - which is a level - and make that level containing
   the amount of stars (or tower blocks) corresponding to our formula level * 2 - 1.
4) Now our tower/array contains the correct amount of stars/blocks, we must populate all but the last level with spaces at the start and
   front. Every level must be the width of the bottom floor and must contain an amount of spaces that is equal to bottom floor size -
   lvl size. These spaces must be halved and distributed on either side of the star or stars.
5) Therefore, we map over our tower array and for each level we create a variable called s (for spaces), then subtracts the size of lvl from
   the size of the bottom floor, then divides it by 2 and rounds the number down if needed. For each level, we concatenate s amount of
   spaces to the front and the end of the string. For the last element - the bottom floor - 0 spaces will be concatenated.
6) We return our tower.
=end

def tower_builder_ms(n)
  tower = (1..n).map {|lvl| '*' * (lvl * 2 - 1)}
  tower.map! {|lvl| s = ((tower[-1].size - lvl.size) / 2).floor ; ' ' * s + lvl + ' ' * s}
end

=begin
Here is a shorter solution, submitted by another Codewars user.
1) We create a new array using the Array.new() syntax, placing in n as the arguments. This initially creates an array of n nil values.
2) When we call our block however, our block variable represents the index positions of each element. This can easily allow us to
   populate the array with its index positions.
3) This method uses a different formula than my solution, this method sees that if you multiply the index position of the level by 2, then
   add 1, you get the correct amount of stars/blocks. This is basically the opposite of mine, which multiplied the ordinal position by 2
   then subtracted 1.
4) Based on this formula, the first thing we can do in our block is populate our array with the correct amounts of stars.
5) Now, in the same block, we can add the spaces. Once again, a different formula is used, subtracting the index position from n and then
   subtracting 1, this produces the correct amount of spaces. We use this forumla to concatenate the spaces to the front and the end of
   the stars.
6) Our array is now a tower, so we return it.
=end

def tower_builder(n)
  Array.new(n) {|i| ' ' * (n - i - 1) + '*' * (i * 2 + 1) + ' ' * (n - i - 1)}
end

=begin
Here is a final solution, which uses the same formula as my solution for the stars. It also is a clean, readable solution which does
everything in one map block.
1) We create our range from 1 up to and including n, then we call map on the range/array.
2) For each lvl, the correct number of spaces for each side is found simply by subtracting the lvl from n. The correct amount of stars is
   found by multiplying the element/ordinal position of the level by 2 then subtracting 1.
3) For each lvl, we simply do space + stars + space.
4) The tower is returned.
=end

def tower_builder_x(n)
  (1..n).map do |lvl|
    space = ' ' * (n - lvl)
    stars = '*' * (lvl * 2 - 1)
    space + stars + space
  end
end