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
Single string of numbers
#slices method accepts single integer of the n-digit series requested

----------------------------OUTPUT----------------------------------
Nested array of all n-digit series possible with the given string

-----------------------------RULES----------------------------------
Explicit:
- If a series larger than the digit string is requested, throw an ArgumentError

Implicit:
- Requested series sizes will all be > 1
- All input strings will consist only of digits 0-9


-------------------------DATA STRUCTURES----------------------------
Arrays, baby

----------------------------ALGORITHM-------------------------------
class Series
#initialize
    - Save string as instance variable
#slices
    - Raise ArgumentError if requested slice is larger than string length
    - Create emtpy result array
    - Subtract series slice size from string size
    - Iterate the difference + 1
        - Start from the first element and take a slice of the string
        - Shovel the slice into the result array
    - Return result array

=end

class Series
  attr_accessor :digit_str
  
  def initialize(digit_str)
    @digit_str = digit_str
  end
  
  def slices(slice_size)
    raise ArgumentError.new if slice_size > digit_str.length
    digit_str.chars.map(&:to_i).each_cons(slice_size).to_a
  end
end

# p Series.new('01234').slices(4)