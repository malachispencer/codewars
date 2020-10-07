/*
Codewars. 20/08/20. 'Find last Fibonacci digit [hardcore version]'. 6kyu. Here we create a function which returns the last digit of the nth
element in the fibonacci sequence. This fibonacci sequence will start with 1,1 instead of 0,1. Here is the solution I developed to solve
the challenge.

The Method:
Due to the fact that fibonacci numbers get exponentially large very quickly, brute forcing our way into figuring out the last digit of the
nth element is not feasible. However, there is a pattern to the last digit of fibonacci numbers and this pattern repeats every 60 numbers.
Therefore, we simply have to find the last digit of the first 60 fib numbers, then we can figure out the rest by performing a modulo 60
operation on n.

The Code:
1) Using the fibonacciSequence function, we generate an array of the last digits of the first 60 fibonacci numbers and store this in the
   variable lastDigitSequence.
2) Inside our lastFibDigitMS function, we simply find the remainder of n when divided by 60, then subtract 1 to convert this number to
   index format, now we take the element in this index position from lastDigitSequence.
*/

const lastDigitSequence = [
  1, 1, 2, 3, 5, 8, 3, 1, 4, 5, 9, 4, 3, 7, 0, 7, 7, 4, 1, 5, 6, 1, 7, 8, 5, 3, 8, 1, 9, 0, 
  9, 9, 8, 7, 5, 2, 7, 9, 6, 5, 1, 6, 7, 3, 0, 3, 3, 6, 9, 5, 4, 9, 3, 2, 5, 7, 2, 9, 1, 0 
];

function lastFibDigitMS(n) {
  return lastDigitSequence[n % 60 - 1];
}

/*
Here is the fibonacciSequence function we used to generate an array of the last digits of the first 60 fibonacci numbers. Doing modulo 10
on each number in the sequence allows us to take the last digit. Removing that modulo 10 gives us the full numbers of the sequence.
*/

function fibonacciSequence(n) {
  let fibs = [1, 1];
  for (i = 2; i < n; i++) {
    fibs.push(fibs[fibs.length - 2] + fibs[fibs.length - 1] % 10)
  }
  return fibs;
}

/*
Here is a function that calculates the nth fibonacci number without storing the numbers in an array.
*/

function nthFibonacci(n){
  let pen = 1;
  let last = 1;
  
  for (i = 2; i < n; i++) {
    let temp = last
    last = (pen + last);
    pen = temp;
  }

  return last;
}