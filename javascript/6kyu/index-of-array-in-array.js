/*
Codewars. 16/06/20. 'IndexOf Array in Array'. 6kyu. The JavaScript indexOf method does not work with arrays as input. Here we create a 
function that looks for an array within a two-dimensional array and returns the index of the first matching element. If there is no match, 
the function should return -1. An exception should be thrown in the cases where the query is not an array of 2 elements, at least one 
element in the array is not an array, or at least one sub-array in the array does not have a length of 2. Here is the solution I developed 
to solve the challenge.
1) We define our function findSubArrayMS, which takes an array of arrays, and an array of 2 elements which may or may not be a sub-array
   in the array of arrays.
2) First we handle the query error checking, using the Array.isArray() method we check if the value passed in - the query input - is an
   array, if it's not, or it is an array but its length is not 2, we use the 'throw' statement to return custom error message, the program
   terminates after this.
3) If query is an array with 2 elements, we proceed to our for loop which will iterate every element in the array.
4) If any of the elements in the array are not arrays, or any element is an array but its length is not 2, once again we throw an
   exception and the program returns our custom error message then terminates.
5) Once our array has passed its error test checks, we now check for the match. For each sub-array, we call the every method, which is
   like the all? method in Ruby, checking whether all elements in an array return true for the given test. We check if each element in the
   sub-array is equal to the same-indexed element in the query array. If so, we return i, which represents the index of the main array.
6) In JavaScript, === is the strict equal operator, it checks if two values are of equal value and equal type. == is the normal equal
   operator and this only checks if the values are equal, for example, with this '2' == 2 will return true. On the other hand, '2' === 2
   returns false.
6) If we've gone through all our error checks and for loop and have not returned anything, the query does not match any sub-array in the
   array, so we return -1.
*/

function findSubArrayMS(arr, query) {
  if (!Array.isArray(query) || query.length != 2) throw 'Exception';

  for (let i = 0; i < arr.length; i++) {
    if (!Array.isArray(arr[i]) || arr[i].length != 2) {
      throw 'Exception';
    } if (arr[i].every((e,j) => e === query[j])) {
        return i;
      }
  }
  
  return -1;
}

/*
Here is another solution, which uses the findIndex method.
1) First we check if query is not an array or if it's an array but it doesn't have 2 elements, if either of these are true, we throw
   an exception.
2) In JavaScript, the some method is like the any? method in Ruby, it checks if any of the elements are true to a given test. We call the
   some method on the array and check if any of its elements are not an array or not having a length of 2, if either are true, the some
   method returns true and we throw an error.
3) Finally, we call the findIndex method on the array, which returns the index of the first element which evaluates to true for our
   given test. So using the strict equal operator, we check if the first element in the sub-array is equal to the first element in the
   query array, and if the second element in the sub-array is equal to the second element in the query array.
*/

function findSubArray(arr, query) {
  if (!Array.isArray(query) || query.length != 2) throw 'Exception';
  if (arr.some(e => !Array.isArray(e) || e.length != 2)) throw 'Exception';
  return arr.findIndex(e => e[0] === query[0] && e[1] === query[1]);
}

/*
Here is a solution which uses the indexOf method.
1) Again, we do our query error check, throwing an exception if query is not an array or if it is an array but it doesn't contain 2
   elements.
2) To do our array error check, this time we call the every method and check if every element is not a 2 element array, if so, we throw
   an exception.
3) In JavaScript, the JSON.stringify method is similar to the inspect method in Ruby, it converts an object or value into a JSON string.
   We use the JSON.stringify method to convert all sub-arrays in the array into JSON strings.
4) arr.map(JSON.stringify) is simply a shorthand syntax for writing arr.map(e => JSON.stringify(e)).
5) Converting our sub-arrays to JSON strings allow us to then use the indexOf method to return the index of the first match of the value
   passed in, which in our case is the query converted to a JSON string also.
6) In JavaScript, the indexOf() method and the findIndex() method are very similar, both return the index of the first match and both
   return -1 if no match is found. The difference is that indexOf() takes a value as its first parameter, which makes it better for
   searching for primitive data types (strings, booleans, numbers), on the other hand, findIndex() takes a callback function as its
   first parameter, meaning it's the better option to use when searching for more complex data types (i.e. objects).
7) By converting our sub-arrays to JSON strings, we turned a non-primitive data type into a primitive data type.
*/

function findSubArrayX(arr, query) {
  if (!Array.isArray(query) || query.length != 2) throw 'Exception';
  if (!arr.every(e => Array.isArray(e) && e.length == 2)) throw 'Exception';
  return arr.map(JSON.stringify).indexOf(JSON.stringify(query));
}