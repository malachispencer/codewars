/*
Codewars. 09/06/20. "Welcome!" 8yu. Here we must create a database where a language and its version of welcome are stored. Then we must 
create a function that takes a language as its argument and returns the welcome greeting of that language. If the language is not stored in 
our database, we return the English welcome. Here is the solution I developed to solve the challenge.
1) We define our method greet, which takes a language as its argument.
2) In JavaScript, an object is one of the 8 data types, but one type of object is actually also called an object, which is what we know as
   a hash in Ruby. An array is another type of the object data type in JavaScript.
3) In a const variable, we store our database in an object (hash in Ruby). We store it in a const because we don't want our database being
   reassigned. A const object can still be have its elements changed however. If a primitive value - number, string, boolean etc - is 
   stored in a const however, its value cannot be changed.
4) In our database object the keys are the language and the values are "welcome" in that language.
5) This was not required in the kata, but here we convert the input language to all lower case using the toLowerCase() method, the brackets
   are necessary.
6) To access the value of an object, just like in Ruby we can use the hash[key] syntax. So first we check if the input language exists in
   our hash, if it doesn't, it will be equal to undefined. If it does exist, we return the value of the language.
7) Otherwise, we return the english welcome. Another way to return an object value is to use the hash.key syntax.
8) As we can see, in JavaScript, if blocks are written with a similar syntax to functions, using parentheses and curly braces.
*/

function greetMS(language) {
  const database = {english: 'Welcome', czech: 'Vitejte', danish: 'Velkomst', dutch: 'Welkom',
              estonian: 'Tere tulemast', finnish: 'Tervetuloa', flemish: 'Welgekomen',
              french: 'Bienvenue', german: 'Willkommen', irish: 'Failte', italian: 'Benvenuto',
              latvian: 'Gaidits', lithuanian: 'Laukiamas', polish: 'Witamy',
              spanish: 'Bienvenido', swedish: 'Valkommen', welsh: 'Croeso'};

  language = language.toLowerCase();

  if (database[language] != undefined){
    return database[language];
  } else {
    return database.english;
  }
}

/*
Here is another solution, similar to that of another Codewars user.
1) We create our database object outside of the function, just like we would have in Ruby. A variable delcared outside of a function has
   global scope so we can access it inside of the function.
2) Once again, not necessary in the kata, but we turn our input to lower case.
3) We then return the value from the object corresponding to our language, then using the or operator ||, we return the english greeting
   if the input doesn't exist in the database.
*/

const database = {english: 'Welcome', czech: 'Vitejte', danish: 'Velkomst', dutch: 'Welkom',
                  estonian: 'Tere tulemast', finnish: 'Tervetuloa', flemish: 'Welgekomen',
                  french: 'Bienvenue', german: 'Willkommen', irish: 'Failte', italian: 'Benvenuto',
                  latvian: 'Gaidits', lithuanian: 'Laukiamas', polish: 'Witamy',
                  spanish: 'Bienvenido', swedish: 'Valkommen', welsh: 'Croeso'};

function greet(language) {
  language = language.toLowerCase();
  return database[language] || database.english
}