=begin
Codewars. 05/05/20. '#Hashtag'. 5kyu. Here we create a method that takes a string 
and returns only the words that have 1 or more # symbols at the beginning, returning 
the words without the # symbol. Here is the solution I used to solve the challenge.
1) We define our method get_hashtags_ms, which takes a string of a "social
   media post" as an argument.
2) We split the string into an array of words.
3) We call the grep method, which is like the select method, returning an
   array of all elements which match our pattern. Our regex matches for every
   word that starts with one or more hashtags.
4) In our regex, \A asserts position at the start of the string, \Z asserts
   position at the end of the string.
5) (\#)+ is capture group 1, matching for 1 or more occurences of a hashtag, +
   being the 1 or more quantifier.
6) ([a-zA-Z]+) is capture group 2, any series of letters which follow 1 or more
   hashtags.
7) In our block we return $2 (capture group 2), which with grep gives us an
   array of words that originally started with 1 or more hashtags.
8) When we call $1 we get 1 hashtag from every word that started with 1 or more
   hashtags, so if there was 3 we don't get 3, we get 1. If we want to get all
   the preceding hashtags we simply do (\#+)+, placing a 1 or more quantifier
   inside the hashtag capture group.
=end

def get_hashtags_ms(post)
  post.split.grep(/\A(\#)+([a-zA-Z]+)\Z/) {$2}
end
