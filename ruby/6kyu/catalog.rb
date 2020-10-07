=begin
Codewars. 26/05/20. 'Catalog'. 6kyu. We are provided with an extract of a caatalog in the form of a multiline string, where each line 
contains a product's name, price and quantity e.g. "<prod><name>screwdriver</name><prx>5</prx><qty>51</qty></prod>". We must create a method 
that takes the extract and a specific product e.g. "saw" and returns all the products of this type in the catalog, in the form 
"table saw > prx: $1099.99 qty: 5\nsaw > prx: $9 qty: 10\nsaw for metal > prx: $13.80 qty: 32". There is a blank line between two lines in 
the catalog, products must be returned in the order they are encountered. Here is the solution I developed to solve the challenge.
1) We create 3 constants PROD, PRICE AND QTY where we store our regular expressions we will use to slice out these portions of the
   catalog. We can see all our regular expressions place as few surrounding characters as possible that are required to isolate the product
   name, price and quantity from each line/product in the string.
2) We define our method catalog_ms, which takes the catalog extract and the product type.
3) We call scan on the catalog to generate an array of all the lines/products that match our input product. In our regex, ^ asserts the
   start of the line; .* is 0 or more characters which are followed by our input product; which is then followed by 0 or more characters up
   to the end of the line $.
4) If our array is empty, there are no products matching our input product, so we return nothing.
5) If our array has one or more products, we map over them and for each line/product, we convert it into the specified format using string
   interpolation and string slicing. In our string slicing, 1 gives us capture group 1, the (.+) in all our constant regular expressions
   for product name, price and quantity.
6) We then join the string delimited by newlines. Our string is returned in the required format.
=end

PROD = /.*>(.+)<\/n.*/ ; PRICE = /.*>(.+)<\/prx.*/ ; QTY = /.*>(.+)<\/q.*/

def catalog_ms(c,p)
  ps = c.scan(/^.*#{p}.*$/) ; return "Nothing" if ps.empty?
  ps.map {|p| "#{p[PROD, 1]} > prx: $#{p[PRICE, 1]} qty: #{p[QTY, 1]}"}.join("\n")
end

=begin
Here is another solution, where I've joined my regex into one and made a small alteration to it. This solution is inspired by that of
another Codewars user.
1) We create our regular expression, where we CG1 grabs the product name, CG2 grabs the price and CG3 grabs the quantity from each line of
   the string.
2) The key difference in this regex from my original is (.*#{p}.*) CG1 where we match the input products specifically. The flexibility of
   having 0 or more characters at both sides of p is that for example if our input product is "saw", we can match "saw", "table saw" and
   "saw for metal".
3) Calling the scan method on the catalog, we use this regex, which produces an array of arrays where each sub-array is for a single
   line/product and each sub-array holds the product name, price and quantity.
4) We then map over these 3 elements of each sub-array and format each string with the required format, using string interpolation.
5) We then join this array back into a string delimited by newlines and store this in the variable prods.
6) If prods is empty, we return nothing, otherwise we return prods.
=end

def catalog(c,p)
  rgx = /^.*>(.*#{p}.*)<\/n.*>(.+)<\/prx.*>(.+)<\/q.*$/
  prods = c.scan(rgx).map {|pn,pr,qt| "#{pn} > prx: $#{pr} qty: #{qt}" }.join("\n")
  prods.empty? ? "Nothing" : prods
end