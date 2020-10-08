=begin
Codewars. 16/05/20. 'Vowel Shifting'. 6kyu. Here we create a method that takes 
a string and shifts all vowels n positions to the right if n is positive and n 
positions to the left if n is negative. By position we mean the position of the 
vowel if it were in a string of all the vowels within the string, so basically 
if we shifted by 1, each vowel would be shifted to the position of the next vowel. 
Hence non-vowels are unchanged. Here is a refactored version of the solution I 
developed to solve the challenge.
1) We define our method vowel_shift_ms, which takes a string and an integer as
   its argument.
2) We return s if the string is nil (or empty).
3) Using the scan method and a regex, we grab all the vowels from the string,
   turning them into an array of characters and we store this in a variable
   called v.
4) We call rotate(-n) on v. When given a positive integer, the rotate method
   shifts to the left, so to reverse this we place a negative symbol before n,
   now positive n will shift to the right. If n is negative --n will become +n
   and so negative n input will shift to the left.
5) We call gsub on the original string and every vowel that is encountered, we
   extract the first element from v and make this the new value in s. This
   replaces all the vowels in s with their shifted counterparts.
6) In the non-refactored original solution I passed with, I had a line to
   handle strings that contained all vowels:
   return s.chars.rotate(-n).join if /^[aeiou]+$/i === s. It turns out this
   line was unnecessary because if it's all vowels, v would replace s anyway.
=end

def vowel_shift_ms(s,n)
  return s if s.nil? ; v = s.scan(/[aeiou]/i).rotate(-n) ; s.gsub(/([aeiou])/i) {v.shift}
end
