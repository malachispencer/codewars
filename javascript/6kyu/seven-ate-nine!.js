/*
Codewars. 28/06/20. 'Seven "ate" nine!' 6kyu. Here we create a function which takes an array of digits and finds every sequence of 789 then
places 7 after 9 in this sequence, thereby preventing 7 from 'eating' 9. If 9 is never in any danger - i.e. no sequence of 789 - we
return the same array. Here is the solution I developed to solve the challenge.
1) We define our function hungrySevenMS, which takes an array of digits as its argument.
2) We join the array of digits into a string with no spaces or commas and store this in a variable str.
3) We then create a while loop which runs as long as str includes a sequence of 789.
4) Inside our while loop, we call the replace method on the string and for the first found sequence of 789, we place the 7 after 9. Only
   the first sequence found is replaced on each iteration because we didn't use the global pattern modifier, which means our while loop
   will require more iterations than if we used the g pattern modifier.
5) Once our while loop finishes - or if it didn't run at all - we join str back into an array, then map over it and convert each string
   digit to an integer using parseInt. We return the new array of digits.
*/

function hungrySevenMS(arr){
  let str = arr.join('');
  while (/789/.test(str)) {
    str = str.replace(/(7)(89)/, '$2$1');
  }
  return str.split('').map(n => parseInt(n));
}

/*
Here is a variation of my solution with two improvements, namely with the global pattern modifier and the use of the Number() method.
1) This time inside our while loop, we use the global pattern modifier in our regex for replace, so all occurrences of 789 will be replaced
   in a single iteration instead of just the first. This means our while loop requires less iterations than if we hadn't use the g
   pattern modifier.
2) When turning the string back into an array we use the spread operator inside an array instead of split('').
3) When we map, we can convert to a number object easily by using the Number() method in a shorthand form, the same way we'd use map(&:to_i)
   in Ruby.
*/

function hungrySeven(arr){
  let str = arr.join('');
  while (/789/.test(str)) {
    str = str.replace(/789/g, '897');
    console.log('replaced')
  }
  return [...str].map(Number);
}