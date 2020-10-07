/*
Codewars. 21/08/20. 'Sort odd and even numbers in different order'. 6kyu. Here we create a function which takes an array of integers and
sorts odd numbers in ascending order and even numbers in descending order. If an odd number is in index position x in the original array,
an odd number must also be in position x in the sorted array, likewise for even numbers. This was the pattern that needed to be deciphered
in order to solve the challenge. Here is the solution I developed to solve the challenge.
1) First we map over the original array and everywhere there is an odd number, we place 'odd', everywhere there is an even number, we place
   'even'. We store this array in a variable called composition.
2) In a variable called odds, we store all the odd numbers from the array and then sort them in ascending order using the sort method. We
   store all the even numbers in an array called evens and sort these in descending order.
3) The sort method uses a compareFunction, where a and b are compared and sorted according to the return value of the compareFunction. If
   the compareFunction returns less than 0, a needs to be placed lower than b, or left the same if it already is. If the compareFunction
   returns 0, no changes need to be made. If the compareFunction returns greater than 0, b needs to be placed before a if it isn't
   already.
4) Based on the above, when for example we have 5(a) and 3(b) from odds. We do a - b = 5 - 3 = 2. The return value is greater than 0 
   so b needs to be placed before a. When we have for example 2(a) and 8(b) from evens, we want descending order so we do b - a = 8 - 2 =
   6. The return value is greater than 0, so b needs to be placed before a.
5) Now we have our composition, odds and evens, we call the reduce method on composition, setting an empty array as the initial value. If
   the current value in composition is odd, we remove the first element from odds using the shift() method and place it in the accumulator 
   array, if the current value in composition is even, we remove the first element from evens and place it in the accumulator array.
6) We return the accumulator array, which is returned when we return the result of our reduce function.
7) Inside reduce, we used the push method to add to the accumulator array, doing so required us to return the accumulator on the next line.
   We also could have returned our ternary operator and used the concat method instead of push, which wouldn't have required returning acc
   on the next line.
*/

function sortArrayMS(arr) {
  let composition = arr.map(n => n % 2 == 0 ? 'even' : 'odd');
  let odds = arr.filter(n => n % 2 != 0).sort((a,b) => a - b);
  let evens = arr.filter(n => n % 2 == 0).sort((a,b) => b - a);
  return composition.reduce((acc, v) => {
    v === 'odd' ? acc.push(odds.shift()) : acc.push(evens.shift());
    return acc;
  }, []);
}

/*
Here is a solution similar to mine but shorter.
1) We store all the odd numbers in an array called odds. In order to check the numbers are odd, we simply do n % 2 instead of n % 2 != 0
   like we did in my solution.
2) We store all the even numbers in an array called evens. Likewise, we use a shortcut to check for evenness !(n % 2).
3) We then simply map over the original array, if the number is odd, we replace it with the first element (removed) from odds, if the
   number is even, we replace it with the first element (removed) from evens.
*/

function sortArray(arr) {
  let odds = arr.filter(n => n % 2).sort((a,b) => a - b);
  let evens = arr.filter(n => !(n % 2)).sort((a,b) => b - a);
  return arr.map(n => n % 2 ? odds.shift() : evens.shift());
}