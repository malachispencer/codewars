/*
Codewars. 15/06/20. 'Touch Typing'. 6kyu. We are given a string which can include lower case letters, digits and spaces. We must create a
function which returns a string of 'L' and 'R' characters denoting which hands were used to type each character. On each row of the
keyboard, the digits up to and including 5, the letters up to and including 't', the letters up to and including 'g', the letters up to and
including 'b', should be typed with the left hand. All other letters and digits should be typed with the right hand. For spaces, if the
previous character was typed with the left hand, it should be typed with the right hand and visa versa. 1 or more spaces at the front of
the string should be typed with the left hand. Here is the solution I developed to solve the challenge.
1) We first store the all the left hand typed letters and digits in a constant object called tt.
2) We define our function touchTypeMS, which takes a string of letters, digits and spaces as its argument.
3) First we call the replace method on the string, and match for not spaces in our regex. We create a block for each match and call our
   block variable c for character. If the character is included - not equalling undefined - in our object, we replace the charactr with
   its value in the object i.e. 'L'. All other cases will be replaced with 'R'.
4) Now we have to take of spaces. First we call replace and match any 'R' (non-capturing) followed by a space, we replace the space with an
   L. We do the same for any 'L' followed by a space, replacing the space with an 'R'.
5) The kata doesn't include any cases where there are multiple spaces in between characters, but my function would be need a bit more to
   handle such cases, although a rule would need to be defined for such cases.
6) The only thing left would be any spaces at the start of the string, so we replace any remaining spaces with 'L'. 
*/

const tt = {1: 'L', 2: 'L', 3: 'L', 4: 'L', 5: 'L', q: 'L', w: 'L', e: 'L', r: 'L', t: 'L',
            a: 'L', s: 'L', d: 'L', f: 'L', g: 'L', z: 'L', x: 'L', c: 'L', v: 'L', b: 'L'}

function touchTypeMS(s) {
  return s.replace(/(\S)/g, c => tt[c] != undefined ? tt[c] : 'R').
    replace(/(?<=R)(\s)/g, 'L').replace(/(?<=L)(\s)/g, 'R').
      replace(/(\s)/g, 'L')
}


/*
Here is another solution, similar to mine, which doesn't store any values in an object.
1) We call the replace method and place all the left typed character in an 'or range' box, replacing any instance of them with an 'L'.
2) We replace any instance of a right typed character with an 'R'.
3) Any instance of an L followed by a space is replaced with 'LR'.
4) Any instance of an R followed by a space is replaced with 'RL'.
5) Any remaining spaces will be spaces at the front of the string, so all remaining spaces are simply replaced with an 'L'.
6) Like my solution, this solution would need more to handle multiple spaces between characters, but a rule would need to be defined for
   such cases.
*/

function touchType(s) {
  return s.replace(/[1-5qwertasdfgzxcvb]/g, 'L').
    replace(/[6-90yuiophjklnm]/g, 'R').
      replace(/(L )/g,'LR').
        replace(/(R )/g,'RL').
          replace(/ /g, 'L')
}

/*
Here is a solution which uses a for loop instead of regular expressions.
1) In a string called left, we store all the left typed letters and digits.
2) We initialize an empty string called typed, where we will store the new string of 'L' and 'R' characters.
3) We create a for loop which will allows us to iterate the string.
4) If the current character is a space, if the previous character of the string is included in left, we add 'R' to the new string. If not,
   we add 'L' to the string. This conditional ensures that spaces are replaced with the opposite of their preceding character, and it
   ensures that if the string starts with 1 or more spaces, these spaces will be replaced with an 'L' because undefined or a space are not
   included in the original string.
5) If the the current character is not a space i.e. it's a letter or digit, if the letter or digit is included in left, an 'L' is added to
   the new string, if not, an 'R' is added to the new string.
6) We return the new string.
*/

function touchTypeX(s) {
  let left = '12345qwertasdfgzxcvb';
  let typed = '';
  
  for (let i = 0; i < s.length; i++) {
    if (s[i] === ' ') {
      typed += left.includes(s[i-1]) ? 'R' : 'L';
    } else {
      typed += left.includes(s[i]) ? 'L' : 'R';
    }
  }
  return typed;
}

/*
Here is another solution, which uses the map method.
1) We store the left typed in a constant variable called left.
2) We split the string into an array of characters.
3) In JavaScript, the map method doesn't ever change the original array, like it's capable of doing in Ruby, instead it returns a new
   array.
4) We call the map method on the array of characters. If the current character is a space, we then check if the previous element was a
   left character, if so, the space in the new array becomes 'R', if not, it becomes an 'L'. Once again, this ensures that a space is
   replaced with the opposite of the preceding character, or an 'L' if it's start of the string or preceded by another space.
5) Now onto our else condition, of the element not being a space, we then check if that element is left typed character, if so, it's
   replaced with an 'L', if not, it's replaced with an 'R'.
6) We join the array of 'L' and 'R' characters into a string and this is returned.
*/

const left = '12345qwertasdfgzxcvb';

function touchTypeZ(s) {
  return s.split('').map((c,i) => c === ' ' ? left.includes(s[i-1]) ? 'R' : 'L' : left.includes(s[i]) ? 'L' : 'R').join('')
}