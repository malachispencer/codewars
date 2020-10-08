=begin
Codewars. 23/07/20. 'Rotation Cipher Cracker'. 6kyu. Here we create a method that rotates a msg 25 times looking for a decoded message, we
are given a substring called contents, if a message contains that substring, it is a decoded message. We must return all decoded messages.
Here is the solution I developed in order to solve the challenge.
1) The rotations of the string involves shifting each character 1 letter forward in the alphabet, so in a constant we store the alphabet,
   then in another constant we store the alphabet shifted 1 letter forward.
2) Inside our method, we create an empty array called decoded, which will store the decoded strings.
3) We create a times loop which runs 25 times. At the start of each iteration, we check if msg contains the contents substring, if so, we
   push msg into decoded. Then using the tr method, we shift each character in message, one letter forward in the alphabet. This process
   runs 25 times, giving us all the possible ways the string could be decoded according to the rotation cipher.
4) We return the decoded array.
=end

ALPHA = 'abcdefghijklmnopqrstuvwxyz'
ALPHA_NEXT = 'bcdefghijklmnopqrstuvwxyza'

def decode_ms(msg,contents)
  decoded = []
  25.times do
    decoded.push(msg) if msg.include?(contents)
    msg = msg.tr(ALPHA, ALPHA_NEXT)
  end
  decoded
end

=begin
Here is a similar solution to mine, which instead uses the tap method and no constants.
1) The tap object yields self to the block, allowing us to perform multiple operations on self then returning self.
2) Our block variable for tap, decoded, represents the array our tap object is.
3) We use the times loop which runs 25 times and again at the start of every iteration we check if contents is included in msg, if so, we
   add msg to decoded.
4) Here, when we use the tr method to shift the letters 1 place forward in the alphabet, we create a range from 'a-z' in the replace from
   argument of tr, and we create a range from 'b-z' and place the 'a' on the end of that range. This ensures that every letter in the
   corresponding index position of the replace to string is 1 letter forward in the alphabet.
5) tap returns self once completed, so our decoded array is returned. 
=end

def decode(msg,contents)
  [].tap do |decoded|
    25.times do
      decoded.push(msg) if msg.include?(contents)
      msg = msg.tr('a-z', 'b-za')
    end
  end
end

=begin
Here is a final solution.
1) We create a new array using the Array.new syntax and populate it with 26 items, with just Array.new(26) these will be nil values.
2) In our block we then specify what we want our array to be populated with in an iterative manner, so on each iteration the array is
   populated with every letter in message shift 1 place forward in the alphabet, the 26th time will bring msg back to its input form.
3) We use the grep method, which is like select with a regex, to generate an array of all the msg strings that contain our contents
   substring.
=end

def decode_x(msg,contents)
  Array.new(26) {msg = msg.tr('a-z', 'b-za')}.grep(/#{contents}/)
end