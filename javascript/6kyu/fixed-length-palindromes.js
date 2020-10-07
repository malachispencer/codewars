/*
Codewars. 28/08/20. 'Fixed Length Palindromes'. 6kyu. Four digit palindrome sequences start with [1001, 1111, 1221, 1331, 1441, 1551...] and
the palindrome at position 2 is 1111. Here we create a function which returns the y-position palindrome in an x-digit sequence. Here is the
solution I developed to solve the challenge.
1) We first create a constant array called twos which stores all 2 digit palindromes, the index positions of the palindromes correspond to
   their ordinal positions in the 2 digit sequence. For example, 22 is in position 2 in the 2 digit sequence and is in index position 2 in
   the array.
2) We handle 2 digit palindromes seperately because they constitute somewhat of an edge case, the only case where all digits need to be
   changed to move through the sequence.
3) We then create a constant object called starts which stores the first palindrome - in the form of an array of characters - for each 
   sequence above 2 digits. Our sequences in the tests go up to 12 digits.
4) We also create a constant object called succ, succ is a reference to the succ method in Ruby. In the succ object, a number is a property
   and its value is its successor. This means we don't need if statements when we have to increment 9 to 0.
5) Now we define our function palindromeMS, which takes the number of digits of the palindrome sequence, len, and the position of the
   palindrome in that sequence we want to return. len never goes above 12 and pos never goes above 20 in the tests.
6) The first thing we do is handle our edge case, if len is 2, we return the palindrome from twos in the corresponding index position of
   pos.
7) For all other cases, in a variable called drome, we store the starting palindrome for the given len.
8) We then find the middle index of all len-digit palindromes by dividing the length of drome by 2 and then flooring the result. For
   example, if len is 3, 3 / 2 = 1.5, then rounded down is 1. drome for this example would be ['1', '0', '1'] so mid with give us '0',
   the exact middle index. This is the case for all odd length palindromes.
9) On the other hand, if len is an even number, the middle of our palindrome will consist of 2 numbers. Now if len were 6, mid would be
   3 / 2 = 3. drome[mid] would be the 4th element in the 6 element array but we'd also need the 3rd element to act as a mid. Therefore,
   when len is even, mid will be a 2 element array consisting of the original mid - 1 and mid. If len is odd, mid will simply be an array
   consisting solely of original mid.
10) As we plan to increment the middle digits, once we get to 9, the digits that surround the middle digits will also need to be
    incremented. For example, 10901 (odd len) will become 11011, 109901 (even len) will become 110011.
11) Therefore, we create a variable called before, which is the index position just before the first middle element, in the case of an
    odd palindrome, this will be before the first and only middle element, in the case of an even palindrome, this will be before the
    first of two middle elements.
12) We also create a variable called after, which is the index position just after the last middle element, in the case of an odd
    palindrome, this is just after once again the last/only middle element, in the case of an even palindrome, this will be the index
    position after the last of two middle elements. By using [mid.length - 1] we get both lasts with the same code.
13) Now we create a for loop and our iteration variable starts at 1, because we want it to be related to pos, which is an ordinal number not
    an index number. Thus the for loop runs as long as i is less than pos. Additionally, due to starts, we already have the palindrome in
    position 1. Thus if pos were 1, the for loop wouldn't even run.
14) On each iteration of our for loop, we map over drome to change the middle element(s) and when the middle element(s) is/are 9, to also
    change the elements which surround the middle element(s).
15) Thus inside our map callback, we check if the current index position is before and the next element is 9, if so, the element in
    drome[before] gets replaced with its value from succ, i.e. its successor.
16) Likewise, if the current index position is after and the previous element is 9, the element at drome[after] gets replaced with its
    successor.
17) For all iterations, if the current element's index position is included in the mid array i.e. it's a middle element, it gets replaced
    with its successor.
18) It is important to note that during the mapping, we encounter before first, then the middle elements, then after. This means before
    and mids get changed before we get to after, bearing this in mind, you'd think it wouldn't work to change after if the previous
    element is 9, because it has already been changed to 0. However, the elements in drome are not actually changed until after the map
    method has finished, as confirmed by printing drome before, during and after mapping.
19) Hence we have essentially used our succ object to increment our palindrome as an array, without using integers, or addition, or brute 
    forcing every single number then checking if it's a palindrome.
20) Once i is equal to pos, we break out of our for loop, join the palindrome array into a string, convert it to an integer and return it.
21) NOTE, this solution works for all 2, 3 and 4 digit palindromes. But once we get to 5 digit palindromes, it has limits, for example,
    palindromeMS(5, 100) is correctly 19991, but then if we do palindromeMS(5, 101) we get 10001 instead of 20002. This is because the
    algorithm changes at most 3 digits in an odd palindrome and at most 4 digits in an even palindrome. Thus we'd need a more sophisticated
    or effecient algorithm to handle cases where pos is a very high number.
*/

const twos = [null, 11, 22, 33, 44, 55, 66, 77, 88, 99];

const starts = {
                3: ['1','0','1'], 
                4: ['1','0','0','1'], 
                5: ['1','0','0','0','1'], 
                6: ['1','0','0','0','0','1'], 
                7: ['1','0','0','0','0','0','1'], 
                8: ['1','0','0','0','0','0','0','1'], 
                9: ['1','0','0','0','0','0','0','0','1'],
               10: ['1','0','0','0','0','0','0','0','0','1'],
               11: ['1','0','0','0','0','0','0','0','0','0','1'],
               12: ['1','0','0','0','0','0','0','0','0','0','0','1']
               };

const succ = {0: '1', 1: '2', 2: '3', 3: '4', 4: '5', 5: '6', 6: '7', 7: '8', 8: '9', 9: '0'};

function palindromeMS(len, pos) {
  if (len === 2) {return twos[pos];}

  let drome = starts[len];
  let mid = Math.floor(drome.length / 2);
  len % 2 === 0 ? mid = [mid - 1, mid] : mid = [mid];
  let before = mid[0] - 1;
  let after = mid[mid.length - 1] + 1;

  for (let i = 1; i < pos; i++) {
    drome = drome.map((d,pi,arr) => {
      if (pi === before && arr[pi+1] === '9') {return succ[d];}
      if (pi === after && arr[pi-1] === '9') {return succ[d];}
      return mid.includes(pi) ? succ[d] : d;
    });
  }

  return +drome.join('');
}


/*
Here is a much shorter solution which uses mathematical ingenuity in order to solve the challenge.
1) We first do 10 to the power of half the length of the array, rounded up, then subtracted by 1. If the len is an even number, this gives
   us exactly half the number of digits, if len is an odd number, this gives a rounded up half - i.e. the bigger half - of the amount of
   digits we need. With both odd and even we get at least the first correct digit.
2) Then, to put the correct middle digits in the number there is a pattern, that is pos - 1 can give us the middle digits. For example,
   for palindrome(5, 19), pos - 1 = 18 and our answer is 18. For palindrome(6, 20), pos - 1 = 19 and our answer is 119911. Thus we add
   pos - 1 to the number we already have, getting 100 + 18 = 118 for our former example and 100 + 19 = 119 for our latter example.
3) Finally, we convert the digit to a string and store the left half of our palindrome in a variable called left.
4) When we do Math.floor(len / 2), for odd length palindromes, we get the length of the smaller half of the palindrome, for even length
   palindromes we simply get the other half.
5) Thus in variable called right, we slice left from 0 up to the lower middle index. For example, for palindrome(5, 19), left = 118 and
   the slice = 11 because len / 2 = 5 / 2 = 2.5, then rounded down = 2. For palindrome(6, 20), left = 119 and the slice = 119 because
   len / 2 = 6 / 2 = 3.
6) We then split right into an array of characters, reverse it and then join it back into a string.
7) We concatenate left and right together, convert the string to an integer and then return it.
8) This is a superior solution to mine because it will easily work for larger length palindromes e.g. 13 and 14, of course up until we
   reach the integer limit for JavaScript. Additionally and most importantly, it will also work for much larger pos numbers. For example,
   palindrome(5, 900) correctly returns 99999. We can know this is correct because pos - 1 = 899 + 100 = 999 so the left half is correct
   and thus the right half will become 99. Even when we do palindrome(5, 901) we correctly get 100001, so it carried over into a 6 digit
   palindrome.
*/

function palindrome(len, pos) {
  let left = Math.pow(10, Math.ceil(len / 2) - 1) + (pos - 1) + '';
  let right = left.slice(0, Math.floor(len / 2)).split('').reverse().join('');
  return +(left + right);
}

/*
Here is a variation of the mathematical solution.
*/

function palindromeX(len, pos) {
  let left = (10 ** Math.floor((len - 1) / 2) + pos - 1).toString();
  let right = [...left].reverse().join('').slice(len % 2);
  return Number(left + right);
}