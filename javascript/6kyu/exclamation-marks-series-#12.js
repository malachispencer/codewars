/*
Codewars. 19/08/20. 'Exclamation marks series #12: Remove odd number continuous exclamation marks and question marks'. 6kyu. Here we create
a function which takes a string of exclamation marks and questions marks and removes consecutive, adjacent odds until none exist in the
string. Here is the solution I developed to solve the challenge.
1) We create a regular expression which seperates our string into singles and adjacent consecutives. Our regex matches any character, 
   followed by one or more of that same character 0 or 1 times, the 0 or 1 times means we will match consecutive adjacents and singles.
2) In Ruby, we converted the string to an array of characters then used the chunk_while(&:==) method to the put consecutive adjacents
   together.
3) We create a while loop where in our run condition we split the string into singles and consecutive adjacents, or an empty array if no
   matches are found, then we check if any element in the array has an odd length that isn't 1. Thus our while loop runs as long as there
   are odd numbered consecutive adjacents in the string.
4) Inside the while loop, we split the string into singles and consecutives using the match method and our regex, then we call the filter
   method and keep only the elements whose length is 1, or whose length is even, then we join the array back into a string.
5) This process continues until there are no odd numbered consecutives in the string, at which point our while loop finishes, and we
   return the string with all odd consecutive exclamation and question marks removed. 
*/


function removeOddsMS(s) {
  while ((s.match(/(.)(\1+)?/g) || []).some(g => g.length > 1 && g.length % 2 != 0)) {
    s = s.match(/(.)(\1+)?/g).filter(g => g.length == 1 || g.length % 2 == 0).join('');
  }
  return s;
}

/*
RUBY SOLUTION

def remove(s)
  s.chars.chunk_while(&:==).any? {|g| g.size > 1 && g.size.odd?} ? 
    remove(s.chars.chunk_while(&:==).reject {|g| g.size > 1 && g.size.odd?}.join('')) 
      : s
end
*/