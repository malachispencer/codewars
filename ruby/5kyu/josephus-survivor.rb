=begin
Codewars. 26/04/2020. "Josephus Survivor". 5kyu. Here we create a method that
returns who is the survivor of a Josephus permutation. The method takes a
number of people (n) and a step (k) of every nth person/element that should be
killed/removed until 1 person/element is remaining (the survivor). Here is a
refined version of the solution I found on medium.com to solve the challenge,
as it involves creating an array of all the numbers it is not the most
effecient method.
1) We define our method josephus_survivor_am (array method), which takes 2
   arguments, n, the highest number in our intial array/amount of people and k,
   the every nth person that should be killed/element that should be removed.
2) We create an array from 1 up to n.
3) Until the array has only 1 element left, we rotate! the array - permanently
   changing it - k places and then remove the very last element. So for
   example if the array is [1,2,3,4,5,6,7] and k is 3, every element is moved
   3 places to the left, now the array will be [4,5,6,7,1,2,3]. The 3rd
   element is now the last, we remove it and run that process again and again
   until we have only 1 element left.
4) Here we also could have used rotate!(k-1), moving every kth element to the
   start of the array, then using shift to remove the first element from the
   array after each rotation.
5) Our loop will finish when the array contains only 1 element, the survivor,
   so we return that element.
=end

def josephus_survivor_am(n, k)
  survivors = (1..n).to_a
  until survivors.size == 1
    survivors.rotate!(k).pop
  end
  survivors[0]
end

=begin
Here is a recursive method for solving the Josephus problem.
=end

def josephus_survivor_rm(n, k)
  n == 1 ? 1 : (josephus_survivor_rm(n - 1, k) + k - 1) % n + 1
end
