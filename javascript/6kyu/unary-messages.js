/*
Codewars. 14/07/20. 'Unary Messages'. 6kyu. Here we create functions which are able to send and receive unary messages. Unary is binary
with all zeros. To encode to unary, we receive input as ASCII characters between 32 and 127, we convert each ASCII code to 7-bit binary and
join all binary into one string. Then we must seperate groups of adjacent 0s and 1s. For each group, groups of zeros are converted to
00 + space + 0s the length of the group, groups of ones are converted to 0 + space + 0s the length of the group. All groups are sepated by 
a space. Here is the solution I developed to solve the challenge.
1) For our sendUnaryMS function, the first thing we do is convert our text to an array of characters, then map over them.
2) As we map, we convert the character to its ASCII value, then convert that ASCII value to binary, and pad the start with zeros if
   necessary to make sure each character ultimately forms 7 bits. We join the array into a string and store this in variable binary.
3) We create a variable called chunks, where we store the groups of zeros and ones by using the match method and matching for each
   encountered 1 or more zeros or 1 or more ones.
4) We map over the chunks, if the first character of each chunk is 0 - the rest of them will also be - we convert that chunk to its unary
   representation, 00 + space + 0s the length of the chunk. If the first character of the chunk is not 0, it's 1 and all the chunk is 1,
   so we convert that chunk to 0 + space + 0s the length of the chunk.
5) We join the array into a string, which creates our unary encoded message.
6) For receiveUnaryMS function, we decode an unary message.
7) The first thing we do in our receiveUnaryMS function is create our binary string. We split the unary string into its respective chunks
   using the match method, then we map the chunks and if the first 2 characters in the chunk are 00, we have a chunk of zeros so we simply
   convert that to the 4th character in the chunk all the way to the end of it. If the first two characters are not 00 - they will be '0 ',
   we convert that chunk to 1s the length of the chunk from the 3rd character. We join the array into a string.
8) We then use the match method to seperate each 7 bits, and map over each 7 bits, convert it to its integer representation, which is
   actually an ASCII value between 32 and 127, then we convert that ASCII value to its character form.
9) We join the array into a string, our unary has now been decoded.
*/

function sendUnaryMS(text) {
  let binary = [...text].map(c => c.charCodeAt(0).toString(2).padStart(7,'0')).join('');
  let chunks = binary.match(/1+|0+/g);
  return chunks.map(s => s[0] === '0' ? '00 ' + s : '0 ' + '0'.repeat(s.length)).join(' ');
}

function receiveUnaryMS(text) {
  let binary = text.match(/0{1,2} 0+/g).map(s => s.slice(0,2) === '00' ? s.slice(3) : '1'.repeat(s.slice(2).length)).join('');
  return binary.match(/.{7}/g).map(b => String.fromCharCode(parseInt(b, 2))).join('');
}