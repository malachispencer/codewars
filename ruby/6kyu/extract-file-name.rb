=begin
Codewars. 29/05/20. "extract file name". 6kyu. Here we create a method that extracts a file name from a dirty file name string. A dirty
file name consists of a date represented as a long number, followed by an underscore, followed by a file name, followed by an extension,
followed by an extra extension. A clean file name consists only of the file name and first extension. For example, 
"1231231223123131_FILE_NAME.EXTENSION.OTHEREXTENSION" should return "FILE_NAME.EXTENSION" and "773_6and_Wi7lRzUe`F\
\r[1PV673P.P3D.o0`FNG1xncZNrCh]c00]" should return "6and_Wi7lRzUe`F\\r[1PV673P.P3D". Here is the solution I developed to solve the
challenge. In the kata we create a FileNameExtractor class but here I add a file_name method to the string class.
1) We open up the string class.
2) Inside the string class we name our method file_name.
3) If the method is called on an empty string, we return nil. If we didn't do this, our method would return an empty string when called on
   an empty string.
4) If the string it's called on is not empty, we extract the file name using string slicing and a regex.
5) In our regex, ^ asserts the start of the string; \d+ is the set of digits comprising the date at the start of the dirty file name; \_
   matches the underscore just before the file name; then inside a capture group we match one or of any character except newlines .+;
   followed by a dot \.; followed by 1 or more of any character except newlines .+; after the capture group is another dot \.,
   followed by 1 or more of any character .+ at the end of the string $.
6) Our 1 and only capture group is the clean file name, so this is sliced out of the dirty file name.
7) If no clean file name is found in our string, our method returns nil.
=end

class String
  def file_name
    empty? ? nil : self[/^\d+\_(.+\..+)\..+$/, 1]
  end
end