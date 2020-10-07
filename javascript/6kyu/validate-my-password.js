/*
Codewars. 12/06/20. "Validate my Password". 6kyu. A valid password must be more than 3 characters but less than 20 characters, must
contain only alphanumeric characters and must contain at least one letter and at least one number. Here we create a function which
validates passwords. Here is the solution I developed to solve the challenge.
1) We define our function validPasswordMS, which takes a password in the form of a string as its argument.
2) We call the test method method on the password. The test method returns true if the string we pass in matches the regex object it's
   called on and false if not. If it returns true we return "VALID", if not we return "INVALID".
3) The regex explained:
   1) ^ asserts the start of the string.
   2) (?=[a-z0-9]{4,19}$) verifies whether the string contains 4-19 letters or numbers up to the end of the string. The lookahead assertion
      means that these characters should be just after the start of the string ^ and it also ensures that we have so far matched no
      characters.
   3) (?=[0-9]*[a-z]) verifies whether the string contains at least one letter. In our regex, we are still at the beginning of the string
      because we have matched no characters. So this patterns asks do we have 0 or more numbers at the start of the string, followed by a
      letter?
   4) (?=[a-z]*[0-9]) verifies whether the string contains at least one digit. We are still at the beginning of the string due to our use
      of lookaheads, so this pattern asks do we have 0 or more letters at the beginning of the string, followed by a digit?
   5) .+ At this point, if the string matches all our lookahead patterns, it meets our condition of a valid password, so we can go ahead 
      and grab all of the characters in it. If any of our lookahead patterns were not matched, test would already have returned false.
   6) i is the pattern modifier which makes our search case-insensitive.
4) The .+ part of our regex is not even actually needed, as we do not need to extract the actually password if it's valid, we only need to
   check if it's valid. If we were for example using the match method to extract valid passwords, then we would need that portion of the
   regex.
*/

function validPasswordMS(p) {
  return /^(?=[a-z0-9]{4,19}$)(?=[0-9]*[a-z])(?=[a-z]*[0-9]).+/i.test(p) ? "VALID" : "INVALID";
}

/*
Here is another solution which breaks the problem down in a more step by step approach.
1) In a variable called lenValid, we store the boolean value of a regex which checks if the string contains 4-19 letters or numbers from
   beginning to end. If it contains any special characters or spaces, this value will be false.
2) In a variable called abcValid, we store whether the string contains at least one lower or upper case letter.
3) In a variable called numValid, we store whether the string contains at least one number.
4) If all 3 variables contain true, we return "VALID", if at least one of them contains false, we return "INVALID".
*/

function validPassword(p) {
  let lenValid = /^[a-z0-9]{4,19}$/i.test(p);
  let abcValid = /[a-z]/i.test(p);
  let numValid = /\d/.test(p);
  return lenValid && abcValid && numValid ? "VALID" : "INVALID";
}