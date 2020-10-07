/*
CLASSES

MS. 27/06/20. A class is like a blueprint that describes a particular object in a non-specific way. In our class, we define certain 
properties of that object, then we are able to create instances of that object where we pass in paramaters which provide the specifics of 
each property of that object. For example, a User class may have properties such as name, email and status (online or offline defined using 
booleans). Each time we create a new user - or instance of the User class - we give a specific name and email and perhaps a default status.

JavaScript is not a class-based language, it is a prototype-based language, but in ES6, classes were introduced primarily to provide
syntactic sugar over JavaScript's existing prototype model. Under the hood, classes do exactly the same thing as prototypes, the only
difference is the syntax.
*/

/*
CLASS EXAMPLE

Based on the Codewars 'Hex class' kata (6kyu), here we create a hex class where the sole property is the decimal value of the hex object. 
The hex class will contain various methods. The methods contain the code I used to pass the challenge.
1) A class is initiated with the 'class' keyword, a capitalized name and code encased in curly braces.
2) A constructor() method is where the properties of the object are defined, just like an initialize method in Ruby. It is best practice
   to always create a constructor() method, in fact, if you don't create one, JavaScript will create an invisible and empty constructor()
   method. In our constructor() method here, the sole property of our hex object is a number that is its decimal representation.
3) 'this' refers to the instance of the object, inside our constructor() method we set this.decimal equal to the parameter we pass in
   (decimal) when we create a new instance of the object.
4) Our valueOf() function simply returns the decimal number - only the number - of our input. If we return the instance itself, it returns
   an object where the parameter name of our constructor() is the key and the paramter itself (the number) is the value.
5) Our toString() function converts the decimal number to its hexadecimal representation with 0x at the start, likewise, the toJSON()
   function does the same.
6) Our plus() function takes a parameter, a number, and adds the number of our hex object to this number, returning a new hex object.
7) Our minus() function takes a parameter, a number, and subtracts the number from the number of our hex object, returning a new hex
   object.
8) We then have a static method. A static method is created using the 'static' keyword and can be called on the class itself, but cannot be
   called on an instance of the class. It can also be called on any object we pass to it, other than an instance of the class.
9) Our static method is a parse() method, which takes a hex character - e.g. ff, 0xb0, 91, 10 - and converts it to its decimal 
   representation.
10) In our parse() method, we first remove any 0x which may exist at the front of the hex character using the replace method.
11) We then initialize a variable called left, which will start off as the highest index of the hex character string.
12) We then split the hex character into an array of characters and call the reduce method on it, passing in only the accumulator and
    current character as parameters. We set the default value of our accumulator to 0.
13) For the reduce block, we use the extended arrow function syntax, which allows use to place multiple lines within the block.
14) We increment the accumulator by the decimal representation of the current character, multipled by 16 to the power of left, then we
    decrement left by 1. For example, if hexChar is '0xFF', our first character will be 'F', this to decimal is 15, 15 * (16 ** 1) = 240;
    then our next character is also 'F', but left is now 0, 15 * (16 ** 0) = 15 * 1 = 15; 240 + 15 = 255. 255 is the decimal representation
    of 'ff'.
15) The value of our reduce method is stored in a variable dec, we return dec.
16) Note, even with the 0x prefix, we can pass in the hex character to the parseInt method and quickly get the decimal representation e.g.
    console.log(parseInt('0xFF', 16)) // 255.
*/

class HexC {
  
  constructor(decimal) {
    this.decimal = decimal;
  }

  valueOf() {
    return this.decimal;
  }

  toString() {
    return `0x${this.decimal.toString(16).toUpperCase()}`;
  }

  toJSON() {
    return `0x${this.decimal.toString(16).toUpperCase()}`;
  }

  plus(n) {
    return new HexC(this.decimal + n);
  }

  minus(n) {
    return new HexC(this.decimal - n);
  }
  
  static parse(hexChar) {
    hexChar = hexChar.replace(/^0x/, '');
    let left = hexChar.length - 1;
    let dec = hexChar.split('').reduce((s,c) => {
      s += parseInt(c, 16) * (16 ** left);
      left--;
      return s;
    }, 0);
    return dec;
  }

}

/*
PROTOTYPE

When we create a class in JavaScript, under the hood, that class is actually still using the prototype model. Therefore, in Javascript,
classes are merely a class syntax for the prototype model, in reality, classes don't exist in JavaScript.

In JavaScript, every object inherits properties and methods from a prototype. Date objects inherit from Date.prototype, Array objects
inherit from Array.prototype, User objects inherit from User.prototype. Therefore, all built-in and custom objects inherit properties and
methods from a prototype.
*/

/*
PROTOTYPE EXAMPLE

Just as we built the Hex class using the class syntax, here we will build the same Hex class using the prototype model directly.
1) Just as we need a constructor() method to define the properties of an object when we create a class, we need a constructor function
   to define the properties of an object when we use the prototype syntax, this is called an object contructor.
2) It is convention to capitalize the name of an object - same as with classes. No semi-colon is needed after the closing curly brace for 
   the object constructor.
3) When using the prototype model, we can place methods inside the object constructor, however, it is better not to do so. Instead, it is
   better - and more common practice - to add methods to the object using the prototype property.
4) The prototype property of any object can be accessed using ObjectName.prototype e.g. Hex.prototype.
5) When we add the toString and toJSON functions to the Hex prototype, because they both do the same thing, we make them equal to each
   other, allowing us to avoid duplication.
6) All functions added to the object prototype contain a semi-colon after the closing brace, this is convention.
7) Finally, we create the parse() function using the arrow function syntax.
*/

function HexP(decimal) {
  this.decimal = decimal;
}

HexP.prototype.valueOf = function() {
  return this.decimal;
};

HexP.prototype.toString = HexP.prototype.toJSON = function() {
  return '0x' + this.decimal.toString(16).toUpperCase();
};

HexP.prototype.plus = function(n) {
  return new Hex(this.decimal + n);
};

HexP.prototype.minus = function(n) {
  return new Hex(this.decimal - n);
};

HexP.parse = (hexChar) => parseInt(hexChar, 16);