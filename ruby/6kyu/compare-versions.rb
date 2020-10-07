=begin
Codewars. 21/07/20. 'Compare Versions'. 6kyu. Here we create a method that takes two arguments, version 1 and version 2, it returns true
if v1 is a newer or equal version than v2, and false if not. Here is the solution I developed to solve the challenge.
1) We define our function compare_versions_ms, which takes two versions as its arguments.
2) Our versions come in the form of strings, so first we split them at their dots, then map over the numbers and convert them to integers.
   Now v1 and v2 are arrays of something like a major, minor, patch e.g. [10, 4, 6], although some inputs contain 2 numbers, 4 numbers or
   more.
3) Now we map over v1 with index, and we subtract the number in the same index position in v2. If v2 is shorter than v1 and so a number in
   the corresponding index position doesn't exist, we subtract 0.
4) Now we create a variable called con for condition, if every value in v1 is 0 or above, we can almost assume that it is the newer version,
   provided we do one more check, that is, whether v2 has more numbers than v1, if that is the case, v2 is the newer version. So if all of
   the numbers in v1 are 0 or greater, con is currently set to true.
5) At this point, if con is false, we know for sure that v1 is not the newer version. For example, comparing 10.2.3 with 9.2.3 would give us
   [-1, 0, 0].
6) If con is currently true, but v2 is longer than v1, we return false because v1 is not the newer version. Otherwise, we return true.
=end

def compare_versions_ms(v1,v2)
  v2 = v2.split('.').map(&:to_i)
  v1 = v1.split('.').map(&:to_i)
  v1 = v1.map.with_index {|n,i| n - (v2[i] || 0)}
  con = v1.all? {|n| n >= 0}
  con == false ? false : v2.size > v1.size ? false : true
end

=begin
Here is a shorter solution which uses the spaceship operator.
1) We split v1 into an array of its numbers, then map over the numbers and convert them to integers. We do the same for v2.
2) We compare both arrays using the spaceship operator. The spaceship operator works in the following manner:
   1) v1 < v2 // -1
   2) v1 == v2 // 0
   3) v1 > v2 // 1
   4) v1 and v2 are not comparable // nil
3) Thus if our spaceship operator comparison is greater than or equal to 0, we return true, if it's -1, we return false.
=end

def compare_versions(v1,v2)
  (v1.split('.').map(&:to_i) <=> v2.split('.').map(&:to_i)) >= 0
end

=begin
Here is another solution, which uses Ruby's built-in Version class to create version objects and then compare them with the greater than
or equal to comparison operator.
=end

def compare_versions_x(v1,v2)
  Gem::Version.new(v1) >= Gem::Version.new(v2)
end
