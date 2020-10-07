=begin
Codewars. 29/05/20. "Master File Names". 6kyu. Here we create two methods for the string class, one which determines whether a string is
a valid audio file and one which determines whether a string is a valid image file. Valid audio and image files consist of a file name 
containing only lower or upper case letters, followed by an extension. Here is the solution I developed to solve the challenge.
1) We open up the string class.
2) We name our first method is_audio?.
3) We use the case equality operator to check if the string our method is called on, fits into our regex pattern.
4) In our regex, ^ asserts the start of the string; [a-zA-Z]+ matches 1 or more lower or uppercase letters (the file name); followed by a 
   dot \.; followed by any one of the following audio extensions at the end of the string (mp3|flac|alac|aac)$. Strings with spaces or 
   numbers or special characters in the file name will return false. Strings without any extra tagged onto the extention - e.g. mp34 - will
   return false.
5) We then name our second method is_img?.
6) Our regex for this method follows the exact same pattern as our audio method, only difference being the extensions at the end of the
   string (jpg|jpeg|png|bmp|gif)$.
=end

class String
  def is_audio?
    /^[a-zA-Z]+\.(mp3|flac|alac|aac)$/ === self
  end
  
  def is_img?
    /^[a-zA-Z]+\.(jpg|jpeg|png|bmp|gif)$/ === self
  end
end