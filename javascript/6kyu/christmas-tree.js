/*
Codewars. 02/07/20. 'Christmas tree'. 6kyu. Here we create a function that returns a christmas tree of the correct height. Newlines must to
seperate each level of the tree. Every line must be padded with spaces at both sides of the stars until the length is equal to that of the
last line, which will be all stars and no spaces. Here is the solution I developed to solve the challenge.
1) We define our function christmasTreeMS, which takes a height between 0 and 100 (inclusive) as its argument.
2) If the given height is zero we return an empty string.
3) Otherwise, we create an array - called tree - whose length is equal to height using the Array.from() method. The array is initially 
   filled with undefined values.
4) We then map over the array and fill it with stars using the repeat() method. The repeat() method is called on a string, takes an integer
   and returns a new string with the string it was called on copied the amount of times the number we gave it, it joins these copies
   together.
5) For our christmas tree to be filled with the correct amount of stars, we multiply the index position by 2 then add 1 to it.
6) We now need to know the width all our strings in our array should be, so we can pad each end accordingly. We can simply take the length
   of the last string in the array - i.e. the lowest level of the tree with the widest/most amount of stars - but we also figured that the
   last line of the tree is the height * 2 - 1.
7) We then map over the tree again so we can perform our padding. As we map, we create a variable called pad, which is the width minus
   the length of the lvl we are currently iterating on, divided by 2. So for example, if our height is 5, our width is 9. Level 1 will
   contain 1 star, 9 - 1 = 8 and 8 / 2 = 4, so each side of this level needs to be padded with 4 spaces.
8) Using the repeat method again, we create a string of pad amount of spaces either side of lvl, and prepend and append these spaces to
   lvl. Now each level is padded with the correct amount of spaces and thus each string in the array has a length equal to width.
9) We join the array into a string delimited by new lines. This puts each lvl on a seperate line thereby creating our visual christmas
   tree.
10) We return the christmas tree.
*/

function christmasTreeMS(height) {
  if (height == 0) {return '';}
  let tree = Array.from({length:height}).map((lvl,i) => '*'.repeat(i * 2 + 1));
  let width = height * 2 - 1;
  return tree.map((lvl,i) => {
    let pad = (width - lvl.length) / 2;
    return ' '.repeat(pad) + lvl + ' '.repeat(pad);
  }).join('\n');
}

/*

A beautiful tree, height is 10:

         *
        ***        
       *****       
      *******      
     *********     
    ***********    
   *************   
  ***************  
 ***************** 
*******************

*/