/*
Codewars. 14/07/20. 'Formatting a number as price'. 5kyu. Here we create a function that takes a number and converts it to a price format.
Every 3 numbers from right to left from the decimal point should have a comma seperating them. Cents should have 2 decimal characters, as in
any price. For example, 13253.5123 should return '13,253.51'. Here is the solution I developed to solve the challenge.
1) We define our function numberToPriceMS, which takes a number as an argument.
2) First we handle our error checking, we our input is a string, we return 'NaN'.
3) We make num a string so we can perform our parsing.
4) We create a variable called negative, which we initially set to false.
5) If our number includes a minus symbol, we set negative equal to true.
6) Now we check if our input number doesn't contain a decimal point and cents, if so, we add a decimal point and 00 cents to num.
7) Now we make the cents portion of our input, by calling replace on num and deleting all characters apart from the decimal and the numbers
   after it. Then for the cases where cents is currently .1 or .5, we add a 0. But we also may have cases which were .129, which will now
   be .1290, we use the slice method to keep only the first 3 characters, so in this case that will be .12.
8) Now we set dollars equal to the decimal and numbers after it deleted from num, so we only have the numbers before the decimal point.
9) If dollars contains 3 or less digits, it won't need any commas, so we return dollars + cents.
10) Finally, we perform our comma formatting. We split dollars into an array of characters, reverse all the characters, then join it back
    into a string. We then call the match method generating an array of 3 digits and then when it cannot be 3 digits, 1 or 2 digits. We 
    join this array into a string delimited by commas, so now our commas are in place. Now we split into an array of characters again,
    reverse the array and join it back into a string.
11) If negative is true, we return dollars and cents with a minus symbol at the front, if not, we return dollars and cents.
*/

function numberToPriceMS(num) {
  if (typeof num === 'string') {return 'NaN';}
  num = String(num);
  let negative = false;
  if (num.includes('-')) {negative = true;}
  if ((/^-?\d+$/).test(num)) {num = num + '.00';}
  let cents = (num.replace(/.+(?=\.\d+)/, '') + '0').slice(0, 3);
  let dollars = num.replace(/(?<=\d+)\.\d+/, '');
  if (dollars.match(/\d/g).length < 4) {return dollars + cents;}
  dollars = [...dollars].reverse().join('').match(/\d{1,3}/g).join(',').split('').reverse('').join('');
  return negative ? '-' + dollars + cents : dollars + cents;
}

/*
Here is a very clever solution that uses no regular expressions, submitted by a Codewars user.
1) We use the isNaN method to check if the input is not a number, this doesn't work if passed an empty string so we also check is the
   input is an empty string, if so, we return NaN as a string.
2) We create a variable called sign, if num is a negative number, the sign is a minus symbol, if not, sign is an empty string.
3) Now we set num equal to its absolute value, then we use toFixed method. To toFixed method converts a number to a string while rounding
   it to a specified number of decimals. Since the longest decimals in our tests is 3 (.129), we round to 3 decimal places, which returns
   the same in this case. But for cases where num had .1 or no decimals at all, we now have .100 or .000.
4) We use the slice method to delete the last character from num, now our number has 2 decimals.
5) We split num into an array of characters because we are about to add in our commas.
6) We create a for loop where we will add in our commas. We set i equal to 6 places from the end of num, so the first place our comma will
   go is past our decimals and decimal point, and past the last 3 dollar digits i.e. from right to left, the first 3 dollar digits from
   the decimal point. Our for loop runs as long as i is greater than 0. So for example, if num at this point is '-5.00', the for loop won't
   even run because there are not enough elements. On each iteration, i decrements by 3.
7) On each iteration of our for loop, we use the splice method to add commas to our num array of characters.
8) We return sign concatenated to the front of num joined back into a string.
*/

function numberToPrice(num) {
  if (isNaN(num) || num === '') {return String(NaN);}
  let sign = num < 0 ? '-' : '';
  num = Math.abs(num).toFixed(3).slice(0,-1).split('');
  for (let i = num.length - 6; i > 0; i -= 3) {
    num.splice(i, 0, ',');
  }
  return sign + num.join('');
}