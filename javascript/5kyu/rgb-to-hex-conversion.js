/*
Codewars. 22/06/20. 'RGB To Hex Conversion'. 5kyu. Given RGB decimal values, we must create a function that returns a hexadecimal
represenation of those RBG decimal values. Valid decimal values for RGB are 0-255, thus any values which fall outside that range must be
rounded to the closest valid value. Here is a refined version of the solution I developed to solve the challenge.
1) We define our function rgbToHexMS, which takes RGB decimal values its arguments.
2) We place r, g and b in an array, then map over the array.
3) If the colour component is less than or equal to 0, we convert it to '00'. If the colour component is greater than or equal to 255, we
   convert it to 'FF'. This handles the invalid cases, lower and upper bound cases. 
4) Otherwsie, we use toString(16) in order to convert decimal values from 1 to 254 to their hexadecimal representation, then we convert
   the hex to upper case, then we use the padStart() method to pad zeros to the front of the string if necessary.
5) The padStart() method takes a width as its first argument and the value we wish to pad the start of the string with as its second
   argument, if the string is less than the desired width, it pads the string with the value.
6) Finally, we join the array into a hexadecimal string.
*/

function rgbToHexMS(r, g, b) {
  return [r, g, b].map((c) => c <= 0 ? '00' : c >= 255 ? 'FF' : c.toString(16).toUpperCase().padStart(2, '0')).join('')
}

/*
Here is another solution I developed, which uses a helper function and doesn't place the decimal values in an array.
1) We create a helper function inside our main function called decToHex, which takes an RGB decimal value.
2) Inside our helper, we use the ternary operator. If the decimal is less than or equal to 0, we return '00'. If the decimal is greater
   than or equal to 255, we return 'FF'. Otherwise, we convert the RGB decimal to hex using toString(16), we uppercase it, then using
   string interpolation we add a 0 to the front of it to pad 1-15 hex values. Then using the slice method, we keep only the last 2
   characters, because for decimals above 15, there will already be 2 characters, they didn't need padding.
3) We return each decimal value converted to hex, concatenated together.
*/

function rgbToHexMSX(r, g, b) {

  function decToHex(c) {
    return c <= 0 ? '00' : c >= 255 ? 'FF' : `0${c.toString(16).toUpperCase()}`.slice(-2);
  }
  
  return decToHex(r) + decToHex(g) + decToHex(b);
}