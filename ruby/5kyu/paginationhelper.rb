=begin
Codewars. 22/07/20. 'PaginationHelper'. 5kyu. Here we create a Pagination Helper class, which is a utility class used to query paging
information related to an array. The class takes in an array of items and an integer denoting how many items to each page. It contains
various methods. Here is the solution I developed to solve the challenge.
1) When defining a class in Ruby, we use the class keyword, and the convention is to name the class in PascalCase. PascalCase is different
   from camelCase.
2) We create our initialize method, which will take in the properties of our class object, the array of items and the items per page.
3) Inside our initialize method, we store our class properties in instance variables, which makes these inputs accessible in all the
   methods of our class.
4) Our first method is item_count, it takes in no arguments and simply returns the amount in items in our collections array.
5) We then have page_count, this method returns how many pages our array has. We find this by simply dividing our array length by our
   items per page and if there is remainder, we have another page with less than @ipp items so we add 1. For example, if our array has 8
   items and we have 3 items per page, 3 goes into 8 twice, then we have 2 items remaining, so we have 3 pages.
6) page_item_count find how many items are in a given page that we pass to it as an argument. The argument is the page_index, so if we 
   have 3 pages we will pass 0, 1 and 2 are valid page indices to pass.
7) Thus we use the each_slice method to slice the array into seperate pages, each page will have @ipp amount of items, but if @arr.length
   divided by @ipp produces remainder, the last slice will have the remainder amount of items. We simply use bracket notation and pass in
   page_index then take its length, if we get an error, that's because we passed an invalid index, so in that case we use rescue to
   return -1 if we get an error.
8) Our final method is page_index, which takes an item index for the array, and returns what page that item is on.
9) First we handle our error checking, so if item_index is greater than or equal to the length of the array, or if item_index is a negative
   number, we return -1.
10) Otherwise, we divide item_index by @ipp, which gives us the page the item is on.
11) When creating a class object instance, we use ClassName.new(property1, property2...).
=end

class PaginationHelper
  def initialize(collection, items_per_page)
    @arr = collection
    @ipp = items_per_page
  end
  
  def item_count
    @arr.length
  end
  
  def page_count
    (@arr.length % @ipp != 0 ? 1 : 0) + @arr.length / @ipp
  end
  
  def page_item_count(page_index)
    Array(@arr.each_slice(@ipp))[page_index].length rescue -1
  end
  
  def page_index(item_index)
    return -1 if item_index >= @arr.length || item_index.negative?
    item_index / @ipp 
  end
end