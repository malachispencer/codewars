/*
Codewars. 24/07/20. 'Points On A Line'. 6kyu. Here we are given coordinates and our function must return true if all of them lie on a line.
For example, [[1,2], [7, 4], [22, 9]] should return true and [[1,2], [-3, -14], [22, 9]] should return false. Here is the solution I
developed to solve the challenge.
1) We need two equations in order to solve this challenge, the first is the equation for a straight line, the second is the equation to
   find the slope given two coordinates:
   1) Straight line = y = mx + b where m = slope and b = y-intercept.
   2) Slope = (y₂ - y₁) / (x₂ - x₁).
2) We define our function pointsOnLineMS, which takes an array of xy coordinates as its argument. Each sub-array holds an x coordinate as
   its first element and a y coordinate as its second element.
3) We do our first edge case check, if points is an empty array, we return true.
4) Now we create a variable called transposed where we store the points array of arrays, transposed i.e. columns turned into rows. This
   involves calling our transpose function.
5) Our transpose function takes an array as its argument and can transpose an array containing 2 columns in each row i.e. 2 elements in each
   sub-array.
6) The transposed array will contain 2 rows/sub-arrays so we initialize row1 and row2 as empty arrays.
7) We then call forEach on the array passed in (points) and for each sub-array, we push the first element (x coordinates) into row 1 and
   push the second element (y coordinates) into row 2.
8) We then create a new array using Array.from() and set its length equal to 2, we then map over the new array and make the first element
   row1 and the second element row2. This new array is our transposed array and it is returned.
9) Now points has been transposed, all x coordinates are in the first sub-array/row, and all y coordinates are in the second sub-array/row.
10) Now we handle our second edge case check, if all x coordinates in points are the same or all y coordinates in points are the same, we
    have a line, if all coordinates in all of points are the same, we have a single point.
11) We create an if block, and call the some method on transposed, we essentially uniq (remove the duplicates) from the axis sub-array by
    turning it into a set, and if the length is now 1, then all the values in that axis were the same. If this is true for any axis in
    transposed, we have a line or a single point, and thus we return true.
12) Now we've transposed points and handled edge cases, we go about finding the answer for our standard cases. We use the first part of the
    slope formula, subtracting the first x point from the second x point and the first y point from the second y point. We store the
    products in a variable called xy.
13) Now we calculate the slope by dividing the y product by the x product. JavaScript automatically gives us a float, unlike Ruby which
    performs integer division by default.
14) Now we have the slope, we find the y-intercept by taking any point's x and y coordinates and the slope, and rearranging the formula.
    We multiply the x coordinate by the slope, then subtract the product from the y value. We ceil the result and store this in a variable
    y-int.
15) Finally, we use the every method - similar to Ruby's all? method - and check whether the values we plug into our straight line
    formula are equal to y on every point, if so, points lies on a line and thus our function returns true.
16) When we use the straight line forumla in the every method, we floor the result, when we calculated the y-intercept, we ceiled the
    result, we could have also done this the other way around and got the correct result. We also could have just used Math.round on
    both to get the correct result.
*/

function pointsOnLineMS(points) {
  if (points.length === 0) {return true;}
  let transposed = transpose(points);
  if (transposed.some(axis => [...new Set(axis)].length === 1)) {return true;}
  let xy = transposed.map(axis => axis[1] - axis[0]);
  let slope = xy[1] / xy[0];
  let y_int = Math.ceil(points[0][1] - points[0][0] * slope);
  return points.every(xy => xy[1] === Math.floor(slope * xy[0] + y_int));
}

function transpose(arr) {
  let row1 = [];
  let row2 = [];
  arr.forEach((sub,i) => {row1.push(sub[0]); row2.push(sub[1]);});
  return Array.from({length:2}).map((_,i) => i == 0 ? row1 : row2);
}