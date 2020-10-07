=begin
Codewars. 06/06/20. 'Strip Url Params'. 6kyu. Here we create a method that takes a url string and removes all duplicate query strings 
keeping only the first as well as removes any query string parameter specified within the 2nd argument (an optional array). Here is the 
solution I developed to solve the challenge.
1) We define our method strip_url_query_ms, which takes a url and an optional array holding query string parameters that should also be 
   removed (if the array contains any query string parameters).
2) First we slice out the host from the url using a regex and store it in a variable host.
3) In our regex, (.+\..+\.\w+) is the one and only capture group, which extracts the host. .+\. matches one or more of any character
   followed by a dot, this is the subdomain. .+ is the domain name. \.\w+ is the top level domain. After the host name we have \??|$ which
   matches 0 or 1 question marks (denoting the start of the query string) or the end of the string $ (if no query string is the url).
4) Using the scan method, we generate an array of each query string parameter. In our regex, \w\=\d+ matches the likes of "a=1", "b=2",
   "c=33", "d=76" etc.
5) We then call reject on the query string paramter array, for each query string parameter, we check if its first letter is included in
   a string of our parameters to strip (the optional array), if so, that query string parameter is removed from the array.
6) We then call the group_by method on the array and group together all query string paramters which have the same letter.
7) We then call the values method on this hash, now we have an array of arrays where each sub-array holds duplicate query string parameters.
8) We map over the array and keep the first element from each sub-array thereby keeping only the first occurrence of all query string
   parameters, then we join the array delimited by an ampersand, which seperated each query string parameter in the original URL.
9) If the query string is empty, we return the host, if not, using string interpolation, we return the host, plus the question mark denoting
   the start of the query string, plus the query string. 
=end

def strip_url_query_ms(url, ps = [])
  host = url[/^(.+\..+\.\w+)\??|$/, 1]
  qs = url.scan(/\w\=\d+/).reject {|q| ps.join =~ /#{q[0]}/}.
    group_by {|q| q[0]}.values.map(&:first).join("&")
  qs.empty? ? host : "#{host}?#{qs}"
end