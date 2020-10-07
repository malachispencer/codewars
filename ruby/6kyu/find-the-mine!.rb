=begin
Codewars. 05/06/20. "Find the Mine!" 6kyu. Here we create a method that takes a 2D array and returns the location of the mine. The mine in
the array will be represented as a 1. The areas that are not the mine will contains 0s. The result should be returned as an array where
the first element is the row index and the second element is the column index. For example, [[0,0,0], [0,0,0], [0,1,0]] returns [2,1].
Here is the solution I developed to solve the challenge.
1) We define our method mine_location_ms, which takes an array of arrays (f for field) as its argument. Each sub-array in the array is a
   row, and each element inside the sub-array/row is a column.
2) We first call each_with_index on the array so now each row has an index position next to it. Essentially, we now have an array of arrays
   where each sub-array holds a sub-array of columns as its first element, and an index position as its second element.
3) We call reject and remove all sub-arrays that when their row sub-array is converted to a string using inspect, do not contain a 1.
4) Now we have an array containing a sub-array holding the row (sub-array) containing the mine as its first element, and this row's index
   position in the original array as its second element.
5) We return our results inside an array. First, we index the row index, which is inside the first [0] and only sub-array in the main array,
   then it is the second element inside that sub-array [1]. We then index the sub-array which holds the columns using f[0][0] and then
   call the find_index method with 1 passed in, to return the column index of the mine.
6) Instead of find_index, we also could have used the index method.
=end

def mine_location_ms(f)
  f = f.each_with_index.reject {|r| r[0].inspect !~ /1/} ; [f[0][1], f[0][0].find_index(1)]
end

=begin
Here is another solution, which solves the challenge in one each_with_index block.
1) We call each_with_index on the array.
2) In our block, we return i (the row index), and s.index(1) (the column index) if the row includes 1.
=end

def mine_location(f)
  f.each_with_index {|s,i| return i, s.index(1) if s.include?(1)}
end

=begin
Here is another solution which uses Ruby's built-in matrix class.
1) We require the matrix library.
2) We turn our array into a matrix using the Matrix[*] syntax. Like in our original 2D array, each sub-array is a row and the elements
   inside the rows are columns of that row.
3) We simply call the index method for 1, which returns the indexing syntax of matrix's, [2, 1] as opposed to [2][1] (for arrays). The
   first element is the row index and the second element is the column index inside that row.
=end

require "matrix"

def mine_location_x(f)
  Matrix[*f].index(1)
end

=begin
Here is a solution which uses a basic mathematical formula.
1) We flatten the array, then find the index of 1 in this flattened array. For example, if our input is [[0, 0, 0], [0, 0, 0], [0, 1, 0]],
   the index position of 1 is 7.
2) We then call the divmod method, which returns an array containing how many times the number it's called on can be divided by the
   argument, and the remainder.
3) To divmod we pass in the size of the original array i.e. how many sub-arrays. So for our example [[0, 0, 0], [0, 0, 0], [0, 1, 0]], we 
   get 7.divmod(3) which equals [2, 1].
4) If our input were [[0, 0, 0], [0, 1, 0], [0, 0, 0]], we'd get 4.divmod(3), which returns [1, 1].
=end

def mine_location_z(f)
  f.flatten.index(1).divmod(f.size)
end

=begin
Here is a final solution.
1) Inside a variable called row, we store the row index by calling the index method and passing it a block. Inside the block, we grab the
   index of the first - and only - sub-array which includes a 1.
2) We then call the index method on the row where the 1 is stored using f[row].index(1), this returns the index position of the column
   where 1 is stored.
=end

def mine_location_xz(f)
  [row = f.index {|s| s.include?(1)}, f[row].index(1)]
end