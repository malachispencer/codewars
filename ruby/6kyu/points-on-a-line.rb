=begin
Codewars. 23/07/20. 'Points On A Line'. 6kyu. Here we are given coordinates and our method must return true if all of them lie on a 
line. For example, [[1,2], [7, 4], [22, 9]] should return true and [[1,2], [-3, -14], [22, 9]] should return false. Here is the solution 
I developed to solve the challenge.
1) We need two equations in order to solve this challenge, the first is the equation for a straight line, the second is the equation to
   find the slope given two coordinates:
   1) Straight line = y = mx + b where m = slope and b = y-intercept.
   2) Slope = (y₂ - y₁) / (x₂ - x₁).
2) We define our method points_on_line_ms?, which takes an array of points as its argument. Each sub-array in the array holds an x and
   corresponding y point as the first and second element respectively.
3) The first thing we do is handle edge cases, returning true if points is an empty array or if all x coordinates are the same meaning
   we have a horizontal line, or if all y coordinates are the same meaning we have a vertical line. For the horizontal or vertical
   line check we transpose the array, turning the columns into rows and visa versa, this places all x points in one sub-array and all
   y points in another sub-array, then calling uniq will remove all duplicates, so if the new length of the axis is 1, we have a line.
4) Now we begin to find the slope for our standard cases. We call transpose again on points. For example, [[7, 3], [21, 9], [14, 6]]
   becomes [[7, 21, 14], [3, 9, 6]]. The first sub-array holds the x coordinates and the second holds the y coordinates.
5) Now we can find the slope by using any two points. We subtract the first x coordinate from the second x coordinate then do the same
   for y coordinates. We store the products in xy, which is an array.
6) Now to give us the slope, we simply divide the y product by the x product. We convert both values to rational numbers in order to
   perform more precise division with no rounding errors, rationals are fractions, we also could have converted both number to floats.
   The product will be a rational number also. In case our x product is a 0, which will produce a ZeroDivisionError, we use rescue to
   make the slope 0 in that case.
7) Now we have the slope, we need to find the y-intercept, the y-intercept is the position of y when x = 0. We find the y-intercept by
   using any point's y value and x value and slope with our straight line equation.
8) We use the first point, essentially doing b = y - x * m. For example, for [[7, 3], [21, 9], [14, 6]] this would be
   3 - 7 * (3/7), rounding down makes this equal to 0. So the y-intercept is 0.
9) Now we have all the ingredients we need to check that all our points are on a line. We call the all? method on points and pass in 2
   block variables, x and y, which correspond to each element in each sub-array. For each point, we check if y is equal to what is
   produced when we use the slope and y-intercept values we've found in the straight line formula y = mx + b. We round up the product of
   the forumla. If true for all points, points is on a line and thus our method returns true, if not, it returns false.
10) Note, for the y-intercept, we could have used ceil on that when rounding to produce an integer, but then we would have had to floor
    in our all? block when using our straight line formula. So we could have reversed which rounding we used. Actually, we use could have 
    just used the round method on both to get the correct result.
=end

def points_on_line_ms?(points)
  return true if points.empty? || points.transpose.any? {|axis| axis.uniq.length == 1}
  xy = points.transpose.map {|axis| axis[1] - axis[0]}
  slope = xy[1].to_r / xy[0].to_r rescue 0
  y_int = (points[0][1] - points[0][0] * slope).floor
  points.all? {|x,y| y == (slope * x + y_int).ceil}
end