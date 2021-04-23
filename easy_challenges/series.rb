=begin
----------------------------PROMPT----------------------------------
Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

012
123
234
Likewise, here are the 4-digit series:

0123
1234
Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.

-----------------------------INPUT----------------------------------
New Series objects instantiate with string of integers

----------------------------OUTPUT----------------------------------
Nested array of the requested series of consecutive numbers

-----------------------------RULES----------------------------------
Explicit:

Implicit:
- Series never exceed the string length
- Requests for slices larger than the string length raise an ArgumentError

-------------------------DATA STRUCTURES----------------------------
Array

----------------------------ALGORITHM-------------------------------
class Series
#initialize
- instantiates with given numerical string

#slices
- raise ArgumentError if requested slice is larger than given string
- Split numerical string into characters, convert to integers, iterate with new object
  - Break if the current element == string size - slice
  - Place slice into new array
- Return new array

=end
require 'pry'
class Series
  attr_reader :digit_str
  
  def initialize(digit_str)
    @digit_str = digit_str
  end
  
  def slices(n)
    raise ArgumentError if n > digit_str.length
    digit_arr = digit_str.chars.map(&:to_i)

    slices_arr = []
    digit_arr.each_with_index do |num, idx|
      break if idx > digit_arr.size - n
      slices_arr << digit_arr[idx, n]
    end
    slices_arr
  end
end

# p Series.new('01234').slices(4)