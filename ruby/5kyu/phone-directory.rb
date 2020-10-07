=begin
Codewars. 26/05/20. 'Phone Directory'. 5kyu. Here we create a method that takes a phonebook in the form of a multiline string - where each 
line contains a contact - and a phone number. Sometimes the line can be cluttered with irrelevant non-alphanumeric characters. The phone 
number is always in the format +X-ABC-DEF-GHIJ where X can be 1 or 2 digits. The contact name is always between < and >. Our method must 
take this phonebook and return the contact of the phone number in a clean string in the following format: 
"Phone => 1-541-754-3010, Name => J Steeve, Address => 156 Alphand St." Here is the solution I developed to solve the challenge.
1) We define our method phonebook_ms, which takes the multiline string phonebook and a phone number as its arguments.
2) First we clean the entire phonebook, removing all clutter using gsub, using the tr method we turn underscores into spaces, then we split
   the string at every newline.
3) We call reject on the array of lines and delete all lines which do not contain the input phone number, with a + at the beginning of it.
4) Now we handle our error checking. If the array of the phone number contact is empty, we return "Error => Not found: #{n}". If the array
   has more than 1 line, that means we have 2 contacts for the same phone number, so we return "Error => Too many people: #{n}".
5) Now we join the contact back into a string.
6) We then extract the name of the contact from the string using string slicing with a regex. In our regex, (?<=\<) matches the space
   after "<", (?=\>) matches the space before ">" and (.+) is all the characters in between, which is the name. Using gsub we then remove
   the name from the original string <.+> including the symbols.
7) We then remove the phone number the original string using gsub and our regex \+\d{1,2}-\d{3}-\d{3}-\d{4}, which matches the phone
   number. We then remove consecutive spaces (\s)\s* from the string by keeping only CG1. Finally, we strip! the string to remove leading
   or trailing whitespace. Now the original string contains only the address.
8) Using string interpolation, we return the contact's phone number, name and address in the specified format.
=end

def phonebook_ms(s,n)
  s = s.gsub(/[^a-z0-9\+\-\.\<\>\n\s\'\_]/i, '').tr("_", " ").split(/\n/)
  s.reject! {|l| !l.match(/\+#{n}/)}
  return "Error => Not found: #{n}" if s.empty?
  return "Error => Too many people: #{n}" if s.size > 1
  s = s.join ; nm = s[/(?<=\<)(.+)(?=\>)/] ; s.gsub!(/<.+>/, '')
  s.gsub!(/\+\d{1,2}-\d{3}-\d{3}-\d{4}/, '').gsub!(/(\s)\s*/, '\1').strip!
  "Phone => #{n}, Name => #{nm}, Address => #{s}"
end

=begin
Here is refined version of a solution submitted by another Codewars user.
1) We call the scan method on s to generate an array of the lines which contain our input phone number. In our regex, ^ asserts the start of
   the line; .* matches 0 or more of any character; \+ matches the + before the phone number; #{n} matches the phone number; .* matches 0 or
   more of any characters after the phone number and $ asserts the end of the line. We store this in a variable c, for contact.
2) We then handle our error checking, in the case that more than one contact is found for the phone number, or no contact is found for the
   phone number.
3) We then join the array of a contact into a string.
4) Now we extract the address from the string by calling gsub. In our regex, [^ ]*#{n}[^ ]* matches the phone number and 0 or more of any 
   non-space characters around it, so this will eventually remove the phone number and any characters around it then stop at spaces; we then
   use an or operator in our regex; <.+> matches the name and the symbols around it; we then use another or operator; [,;\/] matches any
   one of these characters, which are clutter. All of these, we remove from the string.
5) Now we sanitise the address some more by replacing any instance of 1 or more spaces or 1 or more underscores, with a single space. We
   then strip it to remove any leading or trailing whitespace. The address is stored in a variable a.
6) Using string interpolation, we then return our phone number, name and address in required format.
7) To slice the name from the string, we use regex string slicing c[/<(.+)>/, 1], the 1 extracts capture group 1 in our regex, which is the
   characters in between the symbols, the name.
=end

def phonebook(s,n)
  c = s.scan(/^.*\+#{n}.*$/)
  return "Error => Too many people: #{n}" if c.size > 1
  return "Error => Not found: #{n}" if c.empty?
  c = c.join ; a = c.gsub(/[^ ]*#{n}[^ ]*|<.+>|[,;\/]/,'').gsub(/[\s_]+/, ' ').strip
  "Phone => #{n}, Name => #{c[/<(.+)>/, 1]}, Address => #{a}"
end