/*
Codewars. 26/06/20. 'Arrays and hex color codes'. 6kyu. We are given an array containing 3 sub-arrays. Each sub-array contains between 3 and
10 hex colour codes. For each hex color code we must determine what the strongest colour is, for example, for 'FFA07A' the strongest
colour is red becase if we break the red, green and blue components into their decimal representations we get FF = 255, A0 = 160, 71 = 122.
Once we have done this for all colour codes in the sub-arrays, we must return the majority colour and the minority colour of each sub-array, 
there will always be 1 minority colour and more than 1 majority colour. For example,  if our input is [[ "FFA07A","FA8072","8DC4DE" ], 
["7FFF00","ADFF2F", "FF0000","00FF7F","00FF7F"], ["ADD8E6","6B8E23","9ACD32","32CD32","00FF00"]], our function should return
'Red+Blue,Green+Red,Green+Blue'. Here is the solution I developed to solve the challenge.
1) We define our function getColorsMS, which takes an array containing 3 sub-arrays, each sub-array containing 3-10 hex colour codes.
2) We map over the sub-arrays, then for each sub-array, we map over the hex RGB colour codes inside them. For each colour code, we split
   it after every 2 characters, giving us an array of hex values for red, green and blue. We then map over the array of RGB hex values and
   convert each of them to their decimal representation. We store this in a variable called decimals.
3) We now have an array of 2 sub-arrays, where each sub-array holds 3 to 10 sub-arrays - instead of colour codes - holding decimal
   representations of red, green and blue hex values.
4) We map over decimals' sub-arrays, then map over each array inside the sub-arrays. For each rgb sub-array, we convert it to the index
   position of the element with the highest decimal number i.e. the strongest colour i.e. the strongest colour's index position. We store
   this in a variable called indices.
5) indices is an array where each sub-array holds the index position of the strongest colour from our original input array. We map over
   the sub-arrays, then map inside each sub-array, and convert each index position into its respective colour name. We then sort each
   sub-array. We store this in a variable called colours.
6) colours is an array where each sub-array holds the strongest colour from each colour code from our original input. For the first time,
   we don't need a nested map block, we map over each sub-array and if its first element is equal to its second element, these are the
   majority colour, and the minority colour will be the last element in the sub-array. Therefore, using string interpolation we put the
   first element + the last element. If the first element is not equal to the second element, the first element is the minority colour,
   and every other element is the majority colour, so using string interpolation we put any element we want + the first element.
7) We use join() with no parameter, which joins our sub-arrays with commas in between them.
8) We now have a string in the required format so we return it. 
*/

function getColorsMS(hexArr) {
  let decimals = hexArr.map(sub => sub.map(rgb => rgb.match(/../g).map(c => parseInt(c, 16))));
  let indices = decimals.map(sub => sub.map(rgb => rgb.findIndex(dec => dec == Math.max(...rgb))));
  let colours = indices.map(sub => sub.map(i => i == 0 ? 'Red' : i == 1 ? 'Green' : 'Blue').sort());
  return colours.map(sub => sub[0] == sub[1] ? `${sub[0]}+${sub[sub.length - 1]}` : `${sub[sub.length - 1]}+${sub[0]}`).join();
}