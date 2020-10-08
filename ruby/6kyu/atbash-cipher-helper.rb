=begin
Codewars. 22/07/20. 'Atbash Cipher Helper'. 6kyu. The Atbash cipher is a simple substitution cipher originally known to be implemented using 
the Hebrew alphabet. The Atbash cipher is particularly well-known for its use in the Bible. It was in use as early as 500BC by scribes 
writing the Book of Jeremiah. In the Atbash cipher, the first letter of the alphabet is substituted with the last letter, the second letter 
with the second to last letter, and so on. Here we create a helper that can take any alphabet and perform atbash encryption and
decryption. Here is the solution I developed to solve the challenge.
1) We define our class AtbashCipher with the usual PascalCase naming convention.
2) We create our initialize method, which will take an alphabet. Inside our initialize, we store the alphabet in an instance variable
   thereby making it accessible to all methods in our AtbashCipher class.
3) In our encode method, which takes a string as a parameter, we call the tr method on the string. The tr method takes 2 arguments, the
   first is the 'replace from' argument, which is the character in the string that we are going to substitute. The second argument is the
   'replace to' argument, every character in replace from is substituted with the character in the corresponding index position in
   replace to.
4) We also have a decode method, but when we decode our atbash encrypted string, we are performing the exact same process as when
   encoding, so we can use the alias keyword. The first argument for alias is the name of the new method and the second argument is the
   name of the method we are copying.
=end

class AtbashCipher
  def initialize(abc)
    @abc = abc
  end
  
  def encode(str)
    str.tr(@abc, @abc.reverse)
  end
  
  alias decode encode
end