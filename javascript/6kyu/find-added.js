/*
Codewars. 16/07/20. 'Find Added'. 6kyu. We are given two strings (s1 and s2) as inputs. Our function must return a string containing the 
numbers that are in s2, which are not in s1. For example, findAdded('9876521', '9876543211') should return '134'; findAdded('678', '6')
should return ''. Here is the solution I developed to solve the challenge.
1) We define our function findAddedMS, which takes s1 and s2 - both a string of numbers - as its arguments.
2) We initialize empty objects, obj1 and obj2, where we will store the count of characters in s1 and s2.
3) We split s1 and s2 into arrays of characters and call forEach on them, creating a counter object for both.
4) We then initialize an empty string called added, where we will store the numbers in s2 which are not in s1.
5) We create a for-in loop, for-in loops are used to iterate over objects. Our block variable n represents the key - or property - of the
   object and we also must pass in the object variable name.
6) Inside our for-in loop, if both obj2 and obj1 contain the same number i.e. s2 and s1 contain the same number. We add to added that
   number, the difference between its count in s2 and its count in s1 number of times. Fortunately for our sake, if both s2 and s1 contain
   the same number, the count in s1 is never higher than the count in s2, otherwise the use of repeat would not work.
7) If the current number in obj2 is not in obj1, we simply add the number from obj2 to added, the number of times its in obj2.
8) added now contains the numbers in s2 that are not in s1, added is already sorted because when we created our counter objects, they
   were automatically sorted in ascending order. So when we iterated over obj2 we were iterate from the smallest number to largest and thus
   adding to added, smallest to largest.
9) We return added.
*/

function findAddedMS(s1,s2) {
  let obj1 = {};
  let obj2 = {};
  [...s1].forEach(e => obj1[e] ? obj1[e]++ : obj1[e] = 1);
  [...s2].forEach(e => obj2[e] ? obj2[e]++ : obj2[e] = 1);
  let added = '';

  for (n in obj2) {
    if (obj2[n] && obj1[n]) {
      added += n.repeat(obj2[n] - obj1[n])
    } else {
      added += n.repeat(obj2[n])
    }
  }
  return added;
}

/*
Here is another solution, a much shorter one which uses the reduce method.
1) We convert s1 to an array of characters using the spread operator then call the reduce method on it. 
2) Our initial value in the reduce method is actually s2, so the accumulator starts off as s2 in its original form, we call the accumulator
   added and the iteration variable n for number.
3) As we iterate over s1, we remove the first instance of n from added. This means if a number is in s1 and s2, we are essentially
   removing that number from s2. What we will be left with is the numbers in s2 that are not in s1.
4) After our reduce block, we split the resulting string into an array of characters, sort it and then join it back into a string.
5) We return the string of added characters.
*/

function findAdded(s1,s2) {
  return [...s1].reduce((added,n) => added.replace(n,''), s2).split('').sort().join('')
}