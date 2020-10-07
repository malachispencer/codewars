/*
Codewars. 22/06/20. 'Convert A Hex String To RGB'. 5kyu. When working with colour values it can be sometimes useful to extract the
individual red, green and blue component values for a colour. Here we create a function that accepts a case-insensitive hexadecimal colour
string as its parameter e.g. '#FF9933' and returns an object with the structure {r: 255, g: 153, b: 51} where r, g and b range from
0 through 255. The function does not need to support the shorthand form of hexadecimal notation i.e. '#FFF'. Here is the solution I
developed to solve the challenge. This is the first 5kyu kata I've solved in JavaScript.
1) We define our function hexToRGBMS, which takes a hex string as its argument.
2) We first split the hex string into it's component colour parts by using the match method and creating an array of every two word
   characters, thus the hash symbol at the start will be ignored.
3) We then map over the array of hex colour components and convert them to decimal using the parseInt method. We pass 16 into the second
   (radix) parameter to specify that we are converting the string from hex to decimal.
4) We then return the object of our colour components.
*/

function hexToRGBMS(h) {
  h = h.match(/\w\w/g);
  h = h.map((c) => parseInt(c, 16));
  return {r: h[0], g: h[1], b: h[2]};
}

/*
Here is a one-line solution, which uses the parseInt method of conversion.
1) Inside an object, we make each key the colour component, and each value the decimal representation of the hex substring.
2) We use the slice method to extract each colour component from the hex string.
*/

function hexToRGB(h) {
  return {r: parseInt(h.slice(1,3), 16), g: parseInt(h.slice(3,5), 16), b: parseInt(h.slice(5,7), 16)}
}

