=begin
Codewars. 23/05/20. "Salesman's Travel". 6kyu. Here we create a method that
takes a long list of addresses in a string and a zip code (also in string
format), and returns a list of only the addresses in the zip code in the
following format:
zipcode: street and town, street and town,.../house number/house number...
For example, the input ("123 Main Street St. Louisville OH 43071,432 Main Long
Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432",
"OH 43071") should return "OH 43071:Main Street St. Louisville,Main Long Road
t. Louisville/123,432". Here is the solution I developed to solve the
challenge.
1) We define our method travel_ms, which takes a list of addresses, r, and a
   zip code, z, both in string form.
2) If z is empty, no addresses will be found that match it so we return ":/",
   the characters which normally go after our zip code (:) and before our set
   of house numbers (/).
3) When z is not empty, we split the addresses by the comma because each
   address is separated by a comma.
4) On our array of addresses we then call the reject method and delete any
   addresses which aren't in the input zip code.
5) With the match method, our use of the $ in our regex #{z}$ ensures that if
   our zip is for example "OH 430", we remove cases that are "OH 43071",
   because it must match "OH 430" at the end of the string.
6) We then join the addresses back into a string, with a comma delimiting
   each address.
7) Now we call gsub and remove the zip code and the space preceding it from
   each address (\s#{z}).
8) Now r is a string of the addresses which are in our zip code. But we may
   have cases where no addresses matched our zip code, if so, we return
   "#{z}:/".
9) Now if we found addresses, we generate an array of the house numbers by
   using the scan method on r and matching all sets of digits (\d+), we then
   join this array of house numbers into a string delimited by commas, as in
   our final ouput house numbers need to be separated by commas. We store this
   all in a variable d.
10) We now update the r variable, removing the house numbers and the space
    which follows them using gsub and a regex (\d+)(\s).
11) Finally, using string interpolation, we return a string with the zipcode
    at the start, followed by a colon, followed by the streets and towns,
    followed by a forward slash, followed by the string of house numbers
    separated by commas.
=end

def travel_ms(r,z)
  return ":/" if z == ""
  r = r.split(",").reject {|a| !a.match(/#{z}$/)}.join(",").gsub(/(\s#{z})/, '')
  r == "" ? "#{z}:/" : d = r.scan(/(\d+)/).join(",") ; r.gsub!(/(\d+)(\s)/, '')
  "#{z}:#{r}/#{d}"
end

=begin
Here is another solution, developed by myself using a regex adapted from
another Codewar's user's solution. The original regex was
(/(\d+)\s(.+)\s([A-Z]{2}\s\d{5})/).
1) We create an empty array hn, where we will store all the house numbers of
   the addresses in the zip code.
2) We create an empty array st, where we will store all the street and towns
   of the addresses matching our input zip code.
3) We then split the addresses by the comma, so now we have an array of
   addresses.
4) We iterate over each address and parse it using a regex. In our regex, (\d+)
   is CG1 which matches our house number, for each address we add this to hn;
   \s is the space after the house number; (.+) is CG2, the street and town,
   for each address we add this to st; \s is the space after the street and
   town; (#{z})$ is the zip code in our input at the end of string, this
   ensures that we only grab house number's and street and town's from
   addresses which are in the input zip code.
5) Using string interpolation, we then format our new string list, with the
   zip code first, followed by a colon, followed by the street and towns
   joined by a comma, followed by a forward slash, followed by the house
   number's joined by a comma.
6) Our method here handles our error checking cases.
=end

def travel_ms_x(r,z)
  hn = []
  st = []
  r.split(',').each {|a| a.gsub(/(\d+)\s(.+)\s(#{z})$/) {hn << $1 ; st << $2}}
  "#{z}:#{st.join(",")}/#{hn.join(",")}"
end
