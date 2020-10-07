/*
Codewars. 29/06/20. 'Find within array'. 6kyu. Here we create a function which takes an array as its first argument. The function's second
argument is a function which takes 2 parameters, value and index. The given function returns true or false. Our function must iterate over
the array and return the index position of the first element which returns true for the given function. If no true element is found, our
function must return -1. Here is the solution I developed to solve the challenge.
1) We create two functions, valueEqualsIndex and lengthEqualsIndex, either of which can be passed as an argument to our main function.
2) We define our main function, findInArrayMS, which takes an array and a function as its arguments.
3) We create a for loop, which will iterate over every element in the array.
4) Our parameter function takes 2 arguments, value and index, so we pass in the current element and i (the index) to func, if this
   function returns true, we return the index position of the element that gave a true value.
5) If no true value is returned during our for loop, we return -1 after it.
*/

const valueEqualsIndex = function(v,i) {return v === i;}
const lengthEqualsIndex = (v,i) => {return v.length === i;}

function findInArrayms(arr, func) {
  for (let i = 0; i < arr.length; i++) {
    if (func(arr[i], i) == true) {
      return i;
    }
  }
  return -1;
}

/*
Here is a much shorter solution, which uses the findIndex method.
1) We call the findIndex method on the array. The findIndex method itself returns the index position of the first element which is true
   for the given block and -1 if no true element is found.
2) Inside the findIndex method, we pass the function. What we do here is exactly the same as doing arr.findIndex((v,i) => func(v,i)). So
   the value and index are automatically recognised as the parameters of func.
*/

function findInArray(arr, func) {
  return arr.findIndex(func);
}