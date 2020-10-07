/*
Codewars. 23/08/20. 'Frequency Analysis With Buckets'. 6kyu. Here we create a function which takes an array of integers and returns an
array where each index position acts as a 'bucket' holding all the elements of the input array that appeared index amount of times. Where
no elements appeared index amount of times, there will be a null in that index position. For example, [1,2,3,4,4,5,5,5] will return
[null, [1,2,3], [4], [5], null, null, null, null, null]. There will always be a null in the 0 index position because an element cannot
appear 0 times. Here is the solution I developed to solve the challenge.
1) We first intialize an empty object called counts, where we will store the input array elements as properties and the frequency of that
   element in the array as the values.
2) We call forEach() on the array, if the current element is included in the object, we increment its value by 1, if not, we make the
   element a property in the object and set its value to 1.
3) Now we have our frequency object, we create our buckets array. We create an array with a constructor and set its length equal to the
   input array length + 1, this is because we always include a bucket for 0 frequencies even though an element in the array cannot have a
   frequency of 0. We then use the fill method to populate every element in the array with null by default.
4) We then generate an array of all the values of counts. The values are the count of how many times the element appears in the array, but
   this will be the index position of a sub-array in the output array.
5) We call forEach() on the values array and for each index/frequency, we set the element at that index position in buckets, to an empty
   array.
6) We then iterate over the object properties using a for/in loop, the block variable n is simply a placeholder for the object properties.
7) In our for in loop, we access the value/frequency of the current property/element/number and use this to index buckets. Any element
   indexed in buckets will be a sub-array, then we push that property/element/number into the sub-array.
8) When we made our integers object properties, they became strings, so when we push the numbers into a bucket, we have to convert them
   back to number types.
9) We now have an array where all elements from the original array that had a frequency of i, are in a sub-array at i index position in the
   output array, and all other elements in the output array are null.
10) We return buckets, the output array.
*/

function bucketizeMS(arr) {
  let counts = {};
  arr.forEach(n => counts[n] ? counts[n]++ : counts[n] = 1);
  let buckets = Array(arr.length + 1).fill(null);
  Object.values(counts).forEach(i => buckets[i] = []);
  for (n in counts) {
    buckets[counts[n]].push(+n);
  }
  return buckets;
}

/*
Here is another solution which uses the reduce method to build both our counter object and our output array.
1) We call the reduce method on the array and set the initial value of the accumulator to an empty object.
2) In our reduce block, we set the object property equal to the element and if that object property did not exist its initial value is set
   to 0, then the initial value of 0 or the current value - if the object property does exist - is incremented by 1.
3) We return the object, and the object is stored in a variable called counts.
4) We then take the keys/properties of counts, which are the elements from the array, and turn them into an array using the Object.keys()
   method. We then call the reduce method on this array of unique elements of our original array.
5) The initial value of our reduce accumulator is an array of null values, 1 greater in length than our input array, to account for the 0
   element always being null, as an element in the input array cannot have a frequency of 0 but arrays still have 0 index elements.
6) In our reduce block, we take the frequency of the current number and use this to index our output array. The output array will initially
   have a null value in that index position, so if it does, we make it an empty array then use concat to add the number to that sub-array.
   If the element is not null, the next number which had that index number frequency is also added to the sub-array using concat.
7) We return the accumulator and our output array is returned in the format specified.
*/

function bucketize(arr) {
  let counts = arr.reduce((obj,n) => {
    obj[n] = (obj[n] || 0) + 1;
    return obj;
  }, {});

  return Object.keys(counts).reduce((buckets,n) => {
    buckets[counts[n]] = (buckets[counts[n]] || []).concat(+n);
    return buckets;
  }, Array(arr.length + 1).fill(null));
}