=begin
Codewars. 02/06/20. "Directions Reduction". 5kyu. We are are given directions to go from one point to another in the form of an array such
as ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]. We know that going North then going South is pointless, so we need to
simplify our directions by removing pointless directions. Based on our example, the reduction process goes 
["SOUTH", "EAST", "WEST", "NORTH", "WEST"], ["SOUTH", "NORTH", "WEST"], ["WEST"]. Here is the solution I developed to solve the challenge.
1) We define our method direction_reduction_ms, which takes an array of directions as its argument.
2) Instead of performing our reduction on an array, we turn our array into a string with no spaces as we figure we can do it easier on a 
   string.
3) Within a while loop, we call gsub on the string and match every occurrence of pointless directions, as long as there are pointless
   directions in the string, we remove them. This removes our pointless directions in an iterative fashion.
4) Now we have a string of our simplified directions, we call scan on that string to generate an array where each direction is
   a separate element.
=end

def direction_reduction_ms(d)
  d = d.join ; while d.gsub!(/NORTHSOUTH|SOUTHNORTH|WESTEAST|EASTWEST/, '') ; end ; d.scan(/NORTH|SOUTH|WEST|EAST/)
end

=begin
Here is another solution, submitted by a Codewars user, which performs the reduction on the array.
1) We create a constant hash where pointless directions are stored as key and value.
2) We iterate over the directions array using each_with_object, block variable d is our direction, block variable stack is our new
   array where we will store our simplified directions.
3) If the last element in the stack is the opposite direction of the current direction, we remove that last element from the stack and go
   onto the next iteration. This prevents us from having an opposite pair in our stack. If the last element in the stack is not the
   opposite direction of the current direction we're iterating over, we add that current direction to the stack.
4) arr = ["EAST","EAST","WEST","NORTH","WEST","EAST","EAST","SOUTH","NORTH","WEST"]:
   1) Current element: "EAST". Current added to the stack because nothing is in the stack currently. stack = ["EAST"].
   2) Current element: "EAST". "EAST" is added to the stack because the last element of the stack is not opposite. stack = ["EAST", "EAST"].
   3) Current element: "WEST". Last element in the stack is opposite, last is removed from the stack. stack = ["EAST"].
   4) Current element: "NORTH". Last element in stack not opposite so "NORTH" is added to the stack. stack = ["EAST", "NORTH"].
   5) Current element: "WEST". Last element in stack not opposite, "WEST" added. stack = ["EAST", "NORTH", "WEST"].
   6) Current element: "EAST". Last element in stack is opposite, last removed. stack = ["EAST", "NORTH"].
   7) Current element: "EAST". Last element in stack not opposite, current added. stack = ["EAST", "NORTH", "EAST"].
   8) Current element: "SOUTH". Last element in stack not opposite, current added. stack = ["EAST", "NORTH", "EAST", "SOUTH"].
   9) Current element: "NORTH". Last element in stack opposite, last removed. stack = ["EAST", "NORTH", "EAST"].
   10) Current element: "WEST". Last element in stack opposite, last removed. stack = ["EAST", "NORTH"].
=end

OPPOSITE = {"NORTH"=>"SOUTH", "SOUTH"=>"NORTH", "EAST"=>"WEST", "WEST"=>"EAST"}

def direction_reduction(arr)
  arr.each_with_object([]) {|d, stack| OPPOSITE[d] == stack.last ? stack.pop : stack.push(d)}
end