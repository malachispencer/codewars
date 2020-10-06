/*
Codewars. 12/06/20. 'Breaking search bad'. 6kyu. Here we create a function which takes a search term string and returns all movie and TV
show titles from an array which match the search term. Here is the solution I developed to solve the challenge.
1) We define our method searchTitlesMS, which takes a search term string as its argument.
2) In JavaScript, the filter method is the equivalent of Ruby's select method. It's called on an array and returns an array of all elements
   that pass the test implemented by the provided function.
3) We call the filter method on the titles array, we only pass in elements (t) as the method's parameter. If the lower cased element in
   the array includes our search term, it is passed to our new array.
4) We return the new array with the movie titles which include our search term.
*/

function searchTitlesMS(s) {
  return titles.filter((t) => t.toLowerCase().includes(s));
}

/*
Here is another solution, in extended form, of which we'll see a shorter form after.
1) We create a regular expression object using the RegExp() constructor. In the pattern argument we place the search term and in the
   modifiers argument we make our pattern case-insensitive. We store this in a variable regex.
2) We call the filter method on the titles array. Inside the filter method, we pass in a callback function, which must be called
   function, it cannot be called anything else. The sole paramter we pass in is the element, which we call title, this can be called
   anything we like, it's the same as a block variable in Ruby.
3) A callback function is executed one time for each element in the array.
4) The test method in JavaScript is called on a RegExp object and tests for a match in a string, returning true if a match is found in the
   string, false if not.
5) We call the test method on our regex and pass in the title. So for each title/element in the array, test returns true if our regex
   pattern is found in the string, and false if not. If the title/string returns true, it is added to our new array produced by filter.
6) When we create a callback function inside our method in this manner, it's required that inside the callback we use a return statement.
7) Our array of matching titles is returned.
*/

function searchTitles(s) {
  let regex = new RegExp(s, 'i');
  return titles.filter(function(title) {
    return regex.test(title);
  });
}

/*
Here is the shorter version of the above solution.
1) Here we use an arrow function, which allows us to write much sorter function syntax.
2) If we have only one statement inside our arrow function, as we do here, there is no need for us to use curly braces and the return 
   keyword.
3) If we have parameters, we can place them inside brackets e.g. (element, index, array) =>. However, as in our case, if we need only one
   paramter - the element - we do not need to use brackets e.g. t =>.
*/

function searchTitlesX(s) {
  let search = new RegExp(s, 'i');
  return titles.filter(t => search.test(t));
}