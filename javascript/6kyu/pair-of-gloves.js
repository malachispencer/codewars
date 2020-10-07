/*
Codewars. 17/06/20. 'Pair of gloves'. 6kyu. We are given an array of gloves, a pair of gloves consists of two gloves of the same colour. We
must create a function which returns how many pairs of gloves we have in our drawer. For example, [['gray','black','purple','gray','black']]
should return 2. Here is the solution I developed to solve the challenge.
1) We define our function numberOfPairsMS, which takes an array of gloves - each named by a colour - as its argument.
2) First we create an empty object, where we will store the count of each glove.
3) We iterate over the array of gloves using forEach, if the key for the particular glove already contains a value, we increment that
   value by 1, if it doesn't we make the value 1. Essentially, we create what would be a counter hash in Ruby.
4) Now we have an object where each key is a colour and the values are the count of that colour in the array. However, for example we may
   have gloves with a count of 5 or 7 or 9 in our object, if the count is 9, we can get 4 pairs of gloves from this, so we need to round
   these numbers down.
5) Using the Object.values() method, we convert the object into an array of its values (i.e. counts).
6) We then map over the array of counts. If the count is an even number, we simply half it, which gives us how many pairs of gloves we can
   get from that even count. If it is an odd number, we divide the number by 2, then use the Math.floor method to round down, this gives us
   how many pairs we can get from that odd count. If the count was 1, we'd divide by 2 giving 0.5, then rounding down would equal 0.
7) Finally, we call the reduce method on the array of pairs to sum up all the pairs and return the result.
*/

function numberOfPairsMS(gloves) {
  let count = {};
  gloves.forEach(g => count[g] ? count[g]++ : count[g] = 1);
  count = Object.values(count).map(c => c % 2 == 0 ? c / 2 : Math.floor(c / 2));
  return count.reduce((s,c) => s += c, 0);
}

/*
Here is a solution which uses a number counter variable.
1) We sort the array of gloves, so now any existing pairs will be adjacent.
2) We initialize a counter variable called count to 0.
3) We create a for loop which will traverse the array of gloves.
4) If we encounter a pair, we increment count by 1, then we increment i by 1 also. For example, if i = 0 and 0 and 1 are a pair, i++ will
   make i = 1 within this iteration, so on the next iteration i will equal 2. This ensures that once we've found a pair, we move onto the
   next glove or pair.
5) Once we've gone through our for loop, we return the count.
*/

function numberOfPairs(gloves) {
  gloves = gloves.sort();
  let count = 0;
  for (let i = 0; i < gloves.length; i++) {
    if (gloves[i] === gloves[i+1]) {
      count += 1;
      i++;
    }
  }
  return count;
}

/*
Here is a final solution, whih involves using a regex.
1) We sort the array of gloves, then we join the array into a string where each glove is delimited by a comma. This type of join needed to
   be done in order for our regex to work more easily.
2) We then call the match method and match a set of word characters (capture group 1), followed by a comma, followed by the same set of 
   word characters of capture group 1. We make our search global. This will return an array of all the pairs in the array. If there are no
   pairs, it will return null.
3) The entireity of our code is in parentheses, because if our match method returns null, we have an or condition which makes that null
   value an empty array.
4) We simply call the length method on the array, the length of the array is the amount of pairs. If the array was empty, length = 0.
*/

function numberOfPairsX(gloves) {
  return (gloves.sort().join().match(/(\w+),\1/g) || []).length
}