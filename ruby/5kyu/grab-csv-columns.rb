=begin
Codewars. 03/06/20. "Grab CSV Columns". 5kyu. We are given a CSV as a string which will have one or more columns and one or more rows.
Each row will be separated by a new line character. There will be no spaces in the CSV string. Here is an example: 
"1,2,3\n4,5,6\n7,8,9\n10,11,12". We are also given an array of indices which represent each column in the row. We must create a method
which returns the columns at the given indices. For example, "1,2,3\n4,5,6" should return "1,2\n4,5". We must ignore indices that map to a
column that doesn't exist. If the all the indices do not map to any column in the CSV we return an empty string. The columns of the result
must be ordered and not repeated. Here is the solution I developed to solve the challenge.
1) We define our method csv_columns_ms, which takes a string CSV and an array of indices as its arguments.
2) We handle our first error check, returning an empty string if the csv is empty.
3) We then split the csv string at every new line into an array. Now we have an array of csv rows.
4) We then map over the csv rows and split each at the commas. Now we have an array of arrays where each sub-array is a row holding its 
   columns as individual elements. We store this in an updated csv variable.
5) Now we sanitise the indices array, we call reject on it and any index values greater than the highest index in the csv sub-arrays, we
   remove. We then call uniq to delete duplicates, then we sort the indices array because our final results must be ordered.
6) If the indices array is empty, we return an empty string. If not, we map over the csv array, and for each row we map over the indices
   array and keep only the columns in the row whose index positions are in the indices array.
7) Now we have an array of the columns we needed to grab, we join each row with a comma, returning it to the original format. Then we join
   all string rows with a new line, returning a string in the original format with the grabbed columns.
=end

def csv_columns_ms(csv, is)
  return "" if csv.empty?
  csv = csv.split("\n").map {|r| r.split(",")}
  is = is.reject {|i| i > csv[0].size - 1}.uniq.sort
  is.empty? ? "" : csv.map {|r| is.map {|i| r[i]}.join(",")}.join("\n")
end

=begin
Here is a solution that is a combination of mine and another Codewars user's solution.
1) We require Ruby's built-in csv class, allowing us to use csv methods.
2) We return an empty string if csv is empty.
3) As opposed to splitting twice like we did in my original solution, we can use the parse method from the CSV class' internal class
   CSV::Parser. This method takes the string and whether the csv contains headings our not, then splits the csv string into an array of
   arrays where each sub-array is a row holding its columns.
4) We then sanitise the indices array once again.
5) If the indices array is empty, we return an empty string. If not, we map over table (our CSV array) and for each row we use the
   values_at method, passing in the indices array with a splat argument, this turns each row into a row containing only the elements at the
   index positions specified in the indices array. Because we sanitised the indices array, we don't get any dirty nil values where the
   index exceeds the index of the row.
6) We then join each row with a comma.
7) We then join the array of string rows into a string delimited with new lines.
=end

require "csv"

def csv_columns(csv, is)
  return "" if csv.empty?
  table = CSV.parse(csv, headers: false)
  is = is.reject {|i| i > table[0].size - 1}.uniq.sort
  is.empty? ? "" : table.map {|r| r.values_at(*is).join(",")}.join("\n")
end