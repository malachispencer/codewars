=begin
22/04/20. From the 6kyu "CamelCase Method" Codewars challenge, here is a custom
method added to the string class that allows you to camel case any string, even
if it contains punctuation.
=end

class String
  def camelcase
    self.split.map(&:capitalize).join
  end
end
