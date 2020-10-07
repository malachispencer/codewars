=begin
Codewars. 06/06/20. "Codwars or Codewars?". 6kyu. Here we create a method that accepts a URL as a string and determines if it would result
in a request to codwars.com. The URLs are all valid but may or may not contain a scheme, they may or may not contain subdirectories, and 
they may or may not contain query strings. The subdomain may be "codewars.com" in a URL with a codwars domain and visa versa e.g. 
"http://codewars.com.codwars.com". The directory in the path may contain "codewars.com" and visa versa e.g. 
"https://this.is.an.unneccesarily.long.subdomain.codwars.com/katas.are.really.fun.codewars.com/". The query string may also contain
"codewars.com" or "codwars.com". Here is the solution I developed to solve the challenge.
1) We require the the URI (Univeral Resource Identifier) library from Ruby's built-in URI class, which allows us to parse URLs. A URL
   (Uniform Resource Locator) is a specific type of URI which normally locates an existing resource on the Internet.
2) A URL consists of a scheme, a host (which may include a port number), a path and a query string.
   1) Format: scheme://host:port/path?query
   2) Example without port: http://www.codewars.com/path?this=is&a=querystring
   3) Example with port: http://www.example.com:1030/software/index.html?this=is&a=querystring
2) We define our method codwars_ms?, with takes a string URL. The Ruby developer convention is to place a question mark at the end of 
   methods which return true or false.
3) Using the URI.parse method with the string URL passed in, we check if the URL doesn't contain a scheme, if not, we add one to it. 
   Taking this step will allow us to extract the host much easier.
4) Using the host method from the URI class, we extract the host from the url. Now the scheme, path and querystring have all been removed
   from the URL, making it much easier for us to use a regex to check whether it's a codwars domain.
5) In a URL, the host consists of the subdomain, domain name and the top level domain, here are 2 examples:
   1) freedomplatform.londonreal.tv: freedomplatform (subdomain), londonreal (domain), .tv (TLD).
   2) www.codewars.com: www. (subdomain), codewars (domain), .com (TLD).
6) Using the case equality operator, we then use a regex to check whether the URL will result in a request to codwars.com. If so, our
   method will return true, if not, it will return false.
7) In our regex, ^ asserts the start of the string; (www\.|.+\.)? matches 0 or 1 of either "www." or 1 or more characters followed by a
   dot, these are the potential subdomains; the subdomain - or nothing - should be followed by codwars.com at the end of the string, which 
   we match with (codwars\.com)$.
=end

require "uri"

def codwars_ms?(url)
  url = "http://#{url}" if URI.parse(url).scheme.nil?
  host = URI.parse(url).host
  /^(www\.|.+\.)?(codwars\.com)$/ === host
end

=begin
Here is another method which solves the challenge solely with a regex and the case equality operator.
1) ^ asserts the start of the string.
2) (https?:\/\/)? matches 0 or 1 scheme. Because the scheme could be http:// or https://, inside this capture group we place a 0 or 1
   quantifier after s (s?).
3) ([a-z]+\.)* matches the subdomain, which can be 1 or more groups of letters followed by a dot. Because a subdomain may not even exist,
    we place a 0 or more quantifier after the capture group.
4) codwars\.com matches the domain name and top level domain.
5) ([?\/]|$) matches either the beginning of a querystring or the beginning of a path, or the end of the string. This comes straight after
   codwars.com.
=end

def codwars?(url)
  /^(https?:\/\/)?([a-z]+\.)*codwars\.com([?\/]|$)/ === url
end