/*
Codewars. 16/06/20. 'IP Validation'. 6kyu. Here we create a function that identifies whether a string is a valid IPv4 address. A valid IPv4
address contains 4 octets each seperated by a dot, containing values between 0 and 255. Leading zeros are invalid. Here is the solution I 
developed to solve the challenge.
1) We define our method isValidIPv4MS, which takes a string IP address which may or may not be a valid IPv4 address as its argument.
2) In a variable called n, we store the number portion of our regex. It denotes that the number can be 0-9, or 10-99, or 100-199, or
   200-249, or 250-255.
3) In JavaScript, we cannot use string interpolation in literal notation regex i.e. //. So insted we create a regex using a constructor
   and use what is called in JavaScript a 'template literal', this is what allows use to use string interpolation. A template literal is
   performed by using backtick quotes.
4) In our regex, we assert the start of the string ^, followed by a number, followed by a dot. To make the dot literal we need to place a
   backslash before it, but because the regex is in quotes, we have to place a backslash before the backslash to make that literal too.
   The dot is followed by the second octect, which is followed by another dot, which is followed by the third octect, which is followed by
   a dot, and finally a fourth octet at the end of the string.
5) We then call the test method on our ipRegex, which will return true if it matches the string, and false if not.
*/

function isValidIPv4MS(s) {
  let n = '([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])';
  let ipRegex = new RegExp(`^${n}\\.${n}\\.${n}\\.${n}$`);
  return ipRegex.test(s);
}

/*
Here is a solution which uses the net module from node.js.
1) We first access the net module using const net = require('net').
2) We then call the net.isIP and pass in the string as its argument. If the string is not a valid IP address, it will return 0, if the
   string is a valid IPv4 address, it will return 4, if the string is a valid IPv6 address, it will return 6.
3) We set conditional that if net.isIP(s) is equal to 4, true is returned, and false if not.
4) We also could have used the net.isIPv4() method, which returns true if the input is a valid IPv4 address and false if not. There exists
   the same method for IPv6 addresses: net.isIPv6().
*/

function isValidIPv4(s) {
  const net = require('net');
  return net.isIP(s) == 4;
}

/*
Here is a solution which uses neither a regex nor a library.
1) First we split the string at the dots into an array, we store the remaining values in a variable called octets.
2) If the length of the array is 4, we know we have 4 octets so this contributes to a true condition.
3) Also, in order to verify a true case we call the every method on the array of octets. 
4) In our every method, if the octet converted to a number, then converted to a string, is the same value and type as the octect before
   conversions, this also contributes to a true condition. This will handle cases where there are leading zeros, spaces or non-digits in
   the octet.
5) If the octet contains letters or symbols, when we convert it to a number it will become NaN, which is simply a value representing
   not a number.
6) The last 2 components of our true condition are that the octet is greater than or equal to 0 (so cannot be a negative number) and is 
   also less than 256.
7) If these four conditions are met, we return true, otherwise, we return false.
8) This method also handles cases where there are leading or trailing dots, or multiple dots between octets.
*/

function isValidIPv4X(s) {
  let octets = s.split('.');
  if (octets.length == 4 && octets.every(e => String(Number(e)) === e && e >= 0 && e < 256)) {
    return true;
  } else {
    return false;
  }
}