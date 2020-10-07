/*
Codewars. 02/07/20. 'Making Change'. 6kyu. Here we create a function that determines the minimum number of coins needed to make change for
a given amount in American currency. Coins used will be half dollars (50c), quarters (25c), dimes (10c), nickels (5c) and pennies (1c).
The argument passed in will be an amount in cents. The return value should be an object, coins that are not used should not be included in
the object. If the amount passed in is 0, an empty object should be returned. Here is the solution I developed to solve the challenge.
1) We create an object which holds the denominations starting from the biggest (half dollar) to the smallest (pennies). We will use this to
   find the biggest coin that can fit into the amount.
2) We define our function makeChangeMS, which takes an amount in cents as its argument.
3) We initialize an empty object called change where we will store the change breakdown.
4) We are going to use a successive division method, so we create a while loop which runs as long as amount is greater than or equal to 1,
   meaning we have a coin which fits into it.
5) First we find the max coin that can fit into amount. We convert the coins object to an array of its values, then we return the first
   value which is less than or equal to amount.
6) We then find how many times maxCoinVal fits into amount. We divide amount by maxCoinVal then floor the result using the double tilde
   operator. For example, if amount is 91 and we divide it by 50 (maxCoinVal), we'll get 1.82, we have to floor this result to 1 because
   50 fits into 90 only once, it can't be ceiled because 50 cannot fit into 91 twice.
7) We then set the amount equal to the remainder to amount divided by maxCoinVal.
8) Now we have to add to our change object, but we need to extract the symbol of maxCoinVal so we we use the Object.keys() method to create
   an array of the keys in coins, then we return the key whose value inside coins is equal to maxCoinVal. We store this in maxCoin.
9) We create an element inside our change object, making maxCoin the key and quotient (the amount of times it fits into amount) the value.
10) This process repeats until amount is less than 1, when we have no coin which can fit into it.
11) We return the object with the change breakdown.
*/

const coins = {H: 50, Q: 25, D: 10, N: 5, P: 1};

function makeChangeMS(amount) {
  let change = {};
  while (amount >= 1) {
    let maxCoinVal = Object.values(coins).find(c => c <= amount);
    let quotient = ~~(amount / maxCoinVal);
    amount %= maxCoinVal;
    let maxCoin = Object.keys(coins).find(c => coins[c] === maxCoinVal);
    change[maxCoin] = quotient;
  }
  return change;
}

/*
Here is another solution, submitted by a Codewars user.
1) We initialize our change breakdown object, with each denomination initially holding a zero.
2) We set the half dollar denomination equal to the floor of amount divided by 50.
3) We set the quarter denomination equal to the initial amount, modulo 50, divided by 25 then rounded down.
4) We set the dime denomination equal to the initial amount, modulo 50, modulo 25, divided by 10 then rounded down.
5) We set the nickel denomination equal to the initial amount, modulo 50, modulo 25, modulo 10, divided by 5 then rounded down.
6) We set the penny denomination equal to the initial amount, modulo 50, modulo 25, modulo 10, modulo 5, divided by 1 then rounded down.
7) Now we have a denominations object, but we may have denominations with zeros as their values, but if a coin is not part of our change,
   we don't want that coin in our object. So we use a for in loop to iterate over the keys of our change object. 
8) Using the logical NOT operator (!) - which in our use (!change[k]) returns true if the value of the denomination is 0, undefined, null,
   NaN or an empty string - we delete any key-value pairs that have a 0 as the value. We use the delete operator to delete the key-value
   pair.
9) We return the change breakdown object.
*/

function makeChange(amount) {
  const change = {'H': 0,'Q': 0,'D': 0,'N': 0,'P': 0};
  change['H'] = ~~(amount / 50);
  change['Q'] = ~~(amount % 50 / 25);
  change['D'] = ~~(amount % 50 % 25 / 10);
  change['N'] = ~~(amount % 50 % 25 % 10 / 5);
  change['P'] = ~~(amount % 50 % 25 % 10 % 5 / 1);
  for (k in change) {
    if (!change[k]) {delete change[k];} 
  }
  return change;
}