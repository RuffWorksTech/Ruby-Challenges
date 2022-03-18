=begin
----------------------------PROMPT----------------------------------
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.

-----------------------------INPUT----------------------------------
Three arguments representing three side lengths

----------------------------OUTPUT----------------------------------
String representing the type of triangle

-----------------------------RULES----------------------------------
Raise an argument error if any side length <= 0
Raise an agrument error if number of sides != 3
Raise an argument error if sum of any two sides is not larger than the remaining side

Raise argument error if inputs don't describe a valid triangle

-------------------------DATA STRUCTURES----------------------------
Array might be helpful to store side lengths

----------------------------ALGORITHM-------------------------------
Triangle class
- Constructor method takes in three arguments, organizes into array

- Invalid triangle method tests if the sides make valid triangle
    - Check if number of sides == 3
    - Check if all sides >= 0
    - Check if any two sides must be larger than the length of the remaining side

- `Kind` method reports which kind of triangle it is with a string output
    - If all sides are the same value, return 'equilateral'
    - If two sides are the same value, return 'isosceles'
    - Else return 'scalene'

=end

class Triangle
  def initialize(s1, s2, s3)
    @triangle = [s1, s2, s3]
    raise ArgumentError unless valid_triangle?
  end

  def kind
    if 
      @triangle.uniq.size == 1
      'equilateral'
    elsif 
      @triangle.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end
  
  private
  
  def valid_triangle?
    @triangle.size == 3 &&
    @triangle.all? { |side| side > 0 } &&
    @triangle[0] + @triangle[1] > @triangle[2] &&
    @triangle[0] + @triangle[2] > @triangle[1] &&
    @triangle[1] + @triangle[2] > @triangle[0]
  end

end