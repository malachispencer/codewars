/*
Codewars. 24/08/20. 'UN-usual Sort'. 6kyu. Normally, when we use the sort method in JavaScript, it places numbers (numbers and string types)
before alphabetical characters. Here we create a function which sorts an array placing numbers after alphabetical characters, when numbers
have the same value but are different types, the number type should be placed before the string type. Only single digit numbers will be used
in this kata. Here is the solution I developed to solve the challenge.
1) In an array called alpha, we store all the alphabetical characters by using the filter method, then taking every element that is
   not-a-number. We then sort the alpha array. That is the alphabetical characters taken care of.
2) In an array called nums, we store all the numbers by using the filter method and taking all the elements from the input array that are
   not not-a-number, in other words, we take all the numbers - both number types and strings numbers.
3) We then call the sort method on nums and initiate a compareFunction.
4) If a and b are equal in value but a is a number and b is a string, our compareFunction must return -1, which means no change needs to be
   made and thus b stays after a. NOTE, we can actually remove this entire if statement from the code and still pass all the tests, but I
   leave it in for clarity.
5) If a and b are equal in value but a is a string and b is a number type, our compareFunction must return 1, which means a change needs
   to be made and thus b (the number) will be placed before a.
6) In all other cases, which will include 2 numbers being compared, and 2 string numbers being compared, we resort to the normal a - b
   which will sort in ascending order.
7) Now that nums is sorted, we concatenate it to the end of alpha and return our unusually sorted array.
*/

function unusualSortMS(arr) {
  let alpha = arr.filter(e => isNaN(e)).sort();
  let nums = arr.filter(e => !isNaN(e)).sort((a,b) => {
    if (a == b && typeof a === 'number' && typeof b === 'string') {
      return -1;
    } else if (a == b && typeof a === 'string' && typeof b === 'number') {
      return 1;
    } else {
      return a - b;
    }
  });
  return alpha.concat(nums);
}

/*
Here is a solution submitted by another Codewars user.
1) We create a constant array where every character is in its sorted order.
2) Inside our function, we simply call the sort method on the array and in our compareFunction, we do the index position of a in sorted,
   minus the index position of b in sorted. 
3) If the calculation results in a number above 0, a change needs to be made because b's index position is lower than that of a and thus b 
   should come before a.
4) If the calculation results in a number below 0, no change needs to be made, because b's index position is greater than that of a and
   thus b is correctly after a.
5) If the calculation results in 0, the 2 elements are the same.
*/

const sorted = [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
  0, '0', 1, '1', 2, '2', 3, '3', 4, '4', 5, '5', 6, '6', 7, '7', 8, '8', 9, '9'
]

function unusualSort(arr) {
  return arr.sort((a,b) => sorted.indexOf(a) - sorted.indexOf(b));
}

/*
Here is a very clever solution which uses ascii codes for the compareFunction.
1) We first create a helper function called code, that will be called during the compareFunction in order to sort our characters
   according to ASCII values.
2) First we set a variable called ascii equal to the ASCII value of the string form of the character passed in.
3) If the ASCII is between 48 and 57, lower and upper inclusive, the character passed in was a number. Because we want to sort numbers
   after letters, we add 75 to the ASCII of any number. 48 + 75 = 123 and the ASCII value of the last letter is 122 (z), so essentially
   this will allow us to sort numbers after letters intead of before as they normally would be.
4) Now we come to our main function, where we call the sort method on the array and initialize a compareFunction.
5) Inside the compareFunction, we create a variable called difference, which is the code of a minus the code of b.
6) If the difference is not 0, a and b are simply sorted using the difference, so greater than 0 means b must be placed before a and less
   than 0 means a is correctly before b. For example, if a = 4 and b = 'm' we will have 127 - 109 = 18. 18 is greater than 0 i.e. b is
   smaller than a so b should be before a.
7) If the difference is 0, we check whether the type of a is a string, if so, we return 1 because b is a number and numbers need to come
   before strings. This case of a and b being different types can only occur with numbers. Of course, if a is a number, it is already
   correctly before b so we return -1.
8) We return the sorted array.
*/

function code(char) {
  let ascii = String(char).charCodeAt(0);
  return ascii >= 48 && ascii <= 57 ? ascii + 75 : ascii;
}

function unusualSortX(arr) {
  return arr.sort((a,b) => {
    let difference = code(a) - code(b);
    return difference ? difference : typeof a === 'string' ? 1 : -1;
  });
}