/*
Codewars. 06/07/20. 'Bijective Binary'. 6kyu. Here we create two functions, intToBijective, which converts a base 10 integer to its bijective
base 2 representation, and bijectiveToInt, which converts a bijective base 2 number to its base 10 integer representation. Here is the 
solution I developed to solve the challenge.

Standard base 10 integer to bijective base 2:
1) In order to convert a standard base 10 integer to bijective base 2, we can first convert the integer to standard base 2. 
2) If the number in standard base 2 contains all ones, it will be the same in bijective base 2. 
3) If it contains zeros, we work from right to left, if we encounter a 0, we place a 2 in the bijective and decrement all digits to the left 
   by 1. We only decrement the first time a 0 is encountered. 
4) If we encounter a 1 or -1 - -1s can be encountered if a 0 was decremented prior -  we place a 1 in the bijective. 
5) We do this until the bijective is equal to the length it should be, which we can calculate with our starting integer and a formula.
6) If we appended - added to the end - our bijective digits, we must reverse the bijective number and then we have our bijective base 2
   number.
7) This process can be used to convert decimal to other bijective bases too.

The Code:
1) Based on the above process, in our intToBijectiveMS function, we first find what the length of our bijective binary will be by using
   the formula logk((n + 1)(k - 1)) where n represents the integer and k represents the base we are converting to. We must floor the
   result in order to get a whole number - and correct - length. JavaScript has a built-in Math.log2() method which we use in our
   formula.
2) We convert our base 10 integer to standard base 2 using the toString(2) method and store this in a variable binary.
3) Using a regex and the test method, we check if our binary string is all ones from beginning to end, if so, we return the binary string
   as in bijective it will be exactly the same. For example, 3 in standard base 2 is 11 and it is 11 in bijective base 2. Likewise, 15 in
   standard base 2 is 1111 and in bijective it is 1111.
4) If our binary contains zeros, we continue and create an empty array called bijective, where we will store the bijective digits as we
   iterate over our binary string.
5) Because we need to traverse the binary number from right to left, we split it into an array of characters and reverse it. We also map
   over it and convert every digit to a number, to make our life easier.
6) We create a for loop which runs as long as i is less than the length of the bijective, so basically we will iterate the amount of
   elements that are to be in the bijective and thus we will add that amount of elements to bijective.
7) In our for loop, if the current digit in the binary number is 0, first we check if bijective doesn't include a 2, if so, we map over
   the binary number and decrement all digits after the current digit we are on by 1. Then we add a 2 to bijective.
8) If the current digit is not 2 - it can be 1 or -1 - we append a 1 to the bijective array.
9) Once our loop is finished, we reverse the array of bijective digits and join it into a string, then return the bijective base 2
   number string.

Bijective base 2 to standard base 10 intger:
1) The process of converting a bijective base 2 integer back to a standard base 10 integer is much simpler.
2) Working with the digits in the bijective from left to right, but working with the index positions of the digits from right to left,
   we multiply the digit by the base the bijective is in to the power of the corresponding index position.
3) For example, 222 in bijective base 2 is 14 in standard base 10. So the process will be 2 * (2**2) + 2 * (2**1) + 2 * (2**0) = 8 + 4 + 2
   = 14.
4) This process can be used to convert other bijective bases to decimal too.

The Code:
1) Inside our bijectiveToIntMS function, the first thing we do get the max index of bijective's digits and store this in a variable n.
2) We then convert bijective to an array of characters and then call the reduce method on it.
3) In our reduce method, we create a variable called int, which is basically the sum. We increment the sum by the digit converted to a
   number using the + operator, multiplied by 2 to the power of n.
4) We then decrement n by 1 and the process continues until we've traversed the entire bijective array, at which point int is returned from
   our reduce method and the result of our reduce method is returned from our function.
*/

function intToBijectiveMS(int) {
  let bijLength = Math.floor(Math.log2((int + 1) * (2 - 1)));
  let binary = int.toString(2);
  if (/^1+$/.test(binary)) {return binary;}
  let bijective = [];
  binary = binary.split('').reverse().map(Number);
  for (let i = 0; i < bijLength; i++) {
    if (binary[i] === 0) {
      if (!bijective.includes(2)) {binary = binary.map((bit,bi) => bi <= i ? bit : bit - 1);}
      bijective.push(2);
    } else {
      bijective.push(1);
    }
  }
  return bijective.reverse().join('');
}

function bijectiveToIntMS(bijective) {
  let n = bijective.length - 1;
  return [...bijective].reduce((sum,digit) => {
    let int = sum + (+digit) * (2 ** n);
    n--;
    return int;
  },0);
}

/*
Here is another solution, inspired by the shortest solutions on Codewars.
1) In our intToBijective function, we add 1 to our decimal number.
2) We then convert this new number to standard base 2.
3) We split the binary string into an array of characters/bits.
4) We use the slice method to delete the first bit and keep all the rest.
5) Then we map over these bits, for each bit, we convert it from a string to a number and add 1 to it.
6) We join the array back into a string, our base 10 integer is now its bijective base 2 representation.
7) In our bijectiveToInt function, we start off by calling the replae method on the bijective string and we substract 1 from each digit
   in the string.
8) Then we prepend a '1' to start of the new string.
9) The string is now a standard base 2 string, we pass it into the parseInt method and convert it to an integer.
10) We subtract 1 from the integer. Our bijective base 2 number is now its standard base 10 representation.
*/

function intToBijective(int) {
  return (1 + int).toString(2).split('').slice(1).map(bit => +bit + 1).join('');
}

function bijectiveToInt(bijective) {
  return parseInt('1' + bijective.replace(/./g, bit => +bit - 1), 2) - 1;
}