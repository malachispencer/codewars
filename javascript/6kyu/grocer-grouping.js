/*
Codewars. 03/07/20. 'Grocer Grouping'. 6kyu. We are given a string of foods and their category, the category comes first, followed by an
underscore, followed by the food. We must parse this string and return all fruits, meat, other and vegetables on a line each. Any empty
category must still exist on a line. Here is the solution I developed to solve the challenge.
1) We define our function grocerGroupingMS, which takes a string of categories and foods as its argument.
2) We create an object where the keys are the categories of our desired ouput, and the values are intially empty arrays, which we will add
   foods to.
3) Because each food is seperated by a comma, we split the string into an array at the commas, then we iterate over each food using forEach.
4) Inside our forEach loop, we extract the category of the current food using the replace method, and we extract the food name using the
   replace method.
5) Some foods in the input string have categories such as 'drink' and 'canned', foods belonging to these categories are to be placed in
   'other'. Therefore, we first check if the category of the current food we are iterating over is a key in our object, if it is, we use
   the push method to add the food to that category, if it's not, we use the push method to add that food name to the 'other' category.
6) Now we have an object with categories as keys and the foods from the string belonging to those categories as values.
7) We use the Object.entries() method to convert the object into an array where each sub-array holds the key as its first element and
   the value (our string of foods) as its second element. 
8) We then map over the array and for each group, we leave the keys as they are, but the values we sort(). We then join the group delimited
   by a colon.
9) Finally, we join each group into a string, delimited by a new line. Now we have our categories - and the categories foods - each on a
   seperate line in a string.
*/

function grocerGroupingMS(input) {
  let obj = {fruit: [], meat: [], other: [], vegetable: []};
  input.split(',').forEach(f => {
    let ctgry = f.replace(/^(.+)(?=_).+$/, '$1');
    let food = f.replace(/^.+(?<=_)(.+)$/, '$1');
    obj[ctgry] != null ? obj[ctgry].push(food) : obj['other'].push(food);
  });
  return Object.entries(obj).map(g => [g[0],g[1].sort()].join(':')).join('\n');
}