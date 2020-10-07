=begin
Codewars. 23/05/20. "Address Book by State". 6kyu. Here we create a method that
takes a list of addresses in the form of a string and returns the addresses
sorted by state. For example, "John Daggett, 341 King Road, Plymouth MA\nAlice
Ford, 22 East Broadway, Richmond VA\nSal Carpenter, 73 6th Street, Boston MA"
should return "Massachusetts\r\n..... John Daggett 341 King Road Plymouth
Massachusetts\r\n..... Sal Carpenter 73 6th Street Boston Massachusetts\r\n
Virginia\r\n..... Alice Ford 22 East Broadway Richmond Virginia". Here is the
solution I developed to solve the challenge.
1) In our strings we have abbreviated states which must be converted to their
   full names, so we create a constant hash called STATES where we store the
   abbreviations as keys and the full names as values.
2) We define our method bystate_ms, which takes a string of addresses, with
   each address separated by a newline.
3) We create an empty hash where the values will be stored in arrays, this is
   where we will group our strings by state.
4) On the string, we then remove all the commas because these are not required
   in our final string.
5) We then call gsub on the string to convert the state abbreviations into
   their full names. In our regex ([A-Z]{2})$ we match 2 capital letters at
   the end of the line, because $ matches end of the line in a multiline string
   and our state abbreviations are right at the end of the line of each
   address. This also ensures any house numbers with 2 uppercase letters - e.g.
   5AA - are not matched.
6) Now our string has no commas and full names of states, split the string at
   every newline to create an array of the addresses.
7) We then iterate over each address and for each address, we call gsub on it
   and match (\w+)$ the state name at the end of the string. Each of the state
   names matched becomes a key in our hash and the string where it was matched
   is added to that key as a value.
8) We have essentially manufactured our own group_by method, the addresses are
   now grouped by the full name of their state.
9) Our final string requires that for each state, addresses are sorted, so
   we call transform_values(&:sort) to sort the addresses in each state.
10) Our final string also requires that the states themselves are sorted, so
    we call sort on our hash, which does so and converts it into an array.
    Now we have an array of arrays where each sub-array holds the state as its
    first element, and an array of addresses in that state as its second
    element.
11) We then map over the array and each sub-array is joined with a carriage
    return, a newline, 5 dots and a space. Now we have an array of addresses
    grouped by state.
12) We join the entire array delimited by a carriage return, a newline and a
    space.
13) Now we have a string in the specified format.
=end

STATES = {"AZ"=>"Arizona", "CA"=>"California", "ID"=>"Idaho", "IN"=>"Indiana",
          "MA"=>"Massachusetts", "OK"=>"Oklahoma", "PA"=>"Pennsylvania", "VA"=>"Virginia"}

def bystate_ms(s)
  h = Hash.new([])
    s.gsub(/,/, '').gsub(/([A-Z]{2})$/) {STATES[$1]}.
      split("\n").each {|a| a.gsub(/(\w+)$/) {h[$1] += [a]}} ; h
        h.transform_values(&:sort).sort.map {|s| s.join("\r\n..... ")}.join("\r\n ")
end

=begin
Here is another solution, submitted by a Codewars user.
1) We delete all the commas from our string using the delete method.
2) We call gsub on the string and in our regex we match all the characters
   preceding the state abbreviation (.+), followed by the state abbreviation
   (..)$ at the end of the line.
3) In our gsub block we add the 5 dots and space to the front of each
   address and then convert the state abbreviation into its full name using
   our constant hash.
4) We then split the string of addresses at every newline, then sort the array
   so now our addresses within each state are sorted.
5) We then call the group_by method on our hash and with a regex inside a
   square bracket index we match the space followed by the state name located
   at the end of each address.
6) Now we have a hash where the key is a space followed by the state, and the
   values are an array of all the addresses in that state, the values are
   sorted. But we call sort to sort the keys.
7) Now we have an array of arrays where each sub-array holds the space and
   state name as its first element, and an array of the addresses in that state
   as its second element. We call join on the entire array with a carriage
   return and a newline, this joins our sub-arrays and then every string in
   the one level array with these delimiters.
8) We now have our string sorted in the required format, we simply call strip
   to remove the leading whitespace at the start of the string.
=end

def bystate(s)
  s.delete(",").gsub(/(.+)(..)$/) {|a| "..... " + $1 + STATES[$2]}.split("\n").sort.group_by {|s| s[/ \w+$/]}.sort.join("\r\n").strip
end
