/*
Codewars. 03/09/20. 'PaginationHelper'. 5kyu. Here we create a utility class helpful for querying paging information related to an array.
The object we create contains two properties, collection which actuals as individual items, and itemsPerPage, which is how many items are on
each page. The actual contents of the array are irrelevant. Here is the solution I developed to solve the challenge.
1) We first create our object constructor, which defines the properties of our object. The name of our object - PaginationHelper - is
   capitalized, as is the convention with object names.
2) 'this' refers to the instance of the object, thus we set this.arr to equal the array we pass in when we create an instance of our
   object and we set this.ipp to equal the amount of items per page that we specify.
3) Here we are using the prototype model - JavaScript is a prototype based language, not a class based language - and we can place functions
   inside the object constructor, but it is not recommended to do so. Instead, we add methods to the object using the prototype property.
4) The prototype property of any object can be accessed using ObjectName.prototype e.g. PaginationHelper.prototype, Number.prototype,
   Array.prototype etc.
5) Thus we add an itemCount function to the object, the itemCount function takes no argument and as with all other object methods, it
   is called directly on the object book1.itemCount(). The itemCount function returns the length of the array i.e. how many total items
   there are in the array.
6) In our pageCount function, which also takes no parameters, we return how many pages the array has. This is done by diving the array
   length by the items per page, then rounding up the result if decimals are producted. For example, if our array is [1,2,3,4,5,6,7,8,9]
   and this.ipp = 4, we have 3 pages. 9 / 4 = 2.25, then rounded up = 3. If our array is ['a','b','c','d','e','f','g','h','i','j','k']
   and this.ipp = 3, we have 4 pages. 11 / 3 = 3.67, then rounded up = 4.
7) Our pageItemCount function takes a pageIndex (0 based) as its argument and returns how many items are on this page. 
8) First we call the pageCount function on our object instance (using this) and store the result in pCount. If pageIndex + 1 (to convert
   the index into an ordinal page number) is greater than the amount of pages in the object, we return -1.
9) Now we find out how many pages in the array are full pages. We divide the array length by ipp and then round down the result, which will
   exclude non-full pages.
10) If the pageIndex + 1 (to convert pageIndex to pageNumber) is less than or equal to fullPages, we return the items per page, otherwise
    we return the remainder of dividing array length by ipp. Remember, the remainder will always be less than the array length and can only
    occur at the end of the array, if it does occur.
11) Our final function is a pageIndex function, which takes an itemIndex (0 based) and returns what page that item is on.
12) First we handle the error checking, if the item index is greater than the highest array index, or less than 0, we return -1.
13) Then we simply divide the itemIndex by ipp and floor the result. For example, if our array is [1,2,3,4,5,6,7,8,9] and this.ipp = 4,
    itemIndex(8) will involve doing 8 / 4 = 2. It is correct that 9 is on page 3, which is pageIndex 2.
14) The syntax for creating an object instance is const book = new PaginationHelper([1,2,3,4,5,6,7,8,9], 4).
*/

function PaginationHelper(collection, itemsPerPage) {
  this.arr = collection;
  this.ipp = itemsPerPage;
}

PaginationHelper.prototype.itemCount = function() {
  return this.arr.length;
};

PaginationHelper.prototype.pageCount = function() {
  return Math.ceil(this.arr.length / this.ipp);
};

PaginationHelper.prototype.pageItemCount = function(pageIndex) {
  let pCount = this.pageCount();
  if (pageIndex + 1 > pCount) {return -1;}
  let fullPages = Math.floor(this.arr.length / this.ipp);
  return (pageIndex + 1) <= fullPages ? this.ipp : this.arr.length % this.ipp;
};

PaginationHelper.prototype.pageIndex = function(itemIndex) {
  if (itemIndex > this.arr.length - 1 || itemIndex < 0) {return -1;}
  return Math.floor(itemIndex / this.ipp);
};

/*
Here we create the same object using JavaScript's class syntax. Classes were introduced in ES6 to primarily provide syntactic sugar over
JavaScript's existing prototype model. Under the hood, JS classes do exactly the same thing as prototypes and in fact are using the
prototype model. As stated before, classes do not actually exist in JavaScript, as JavaScript is a prototype-based language, classes merely
provide us with an alternative syntax.
1) Like with the prototype model, the object name is capitalized, but unlike the prototype model, an opening and closing curly brace wrap
   around all functions of the class.
2) The class syntax using a constructor function, where the properties of the object are defined.
3) Our class functions do not require a function keyword.
4) Creating a class instance is the same as in the prototype model i.e. const book = new PaginationHelperC([1,2,3,4,5,6,7,8,9], 4).
*/

class PaginationHelperC {
  constructor(collection, itemsPerPage) {
    this.arr = collection;
    this.ipp = itemsPerPage;
  }

  itemCount() {
    return this.arr.length;
  }

  pageCount() {
    return Math.ceil(this.arr.length / this.ipp);
  }

  pageItemCount(pageIndex) {
    let pCount = this.pageCount();
    if (pageIndex + 1 > pCount) {return -1;}
    let fullPages = Math.floor(this.arr.length / this.ipp);
    return pageIndex + 1 <= fullPages ? this.ipp : this.arr.length % this.ipp;
  }

  pageIndex(itemIndex) {
    if (itemIndex < 0 || itemIndex > this.arr.length - 1) {return -1;}
    return Math.floor(itemIndex / this.ipp);
  }
}