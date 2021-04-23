=begin
----------------------------PROMPT----------------------------------
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.

-----------------------------INPUT----------------------------------
- A new triangle with integer inputs for three sides

----------------------------OUTPUT----------------------------------
- An output indicating whether the triangle is equilateral, isosceles, or scalene

-----------------------------RULES----------------------------------
Explicit:
- All sides must be of length > 0
- Sum of the lengths of any two sides must be greater than the length of the third side

Implicit:
- Should also output an error if the following occur:
    - Does not have 3 sides
    - One side is <= 0
    - Sum of length of any two sides is not greater than the length of the third side

-------------------------DATA STRUCTURES----------------------------
- Likely don't need more than an array

----------------------------ALGORITHM-------------------------------
- Initialize new triangle object with 3 sides

=end

class Triangle
  attr_reader :sides
  
  def initialize(*sides)
    @sides = sides
    valid?(@sides)
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid?(sides)
    raise(ArgumentError, 'Triangles only have 3 sides') if sides.size != 3
    raise(ArgumentError, 'One side is <= 0') if sides.min <= 0
    unless sides[0] + sides[1] > sides[2] &&
           sides[0] + sides[2] > sides[1] &&
           sides[1] + sides[2] > sides[0]
      raise(ArgumentError, 'Not a valid triangle')
    end
  end  
end

t1 = Triangle.new(3, 4, 5)
p t1
# t2 = Triangle.new(1, 2)
# p t2
# t3 = Triangle.new(0, 1, 1)
# p t3
# t4 = Triangle.new(1, 1, 4)
# p t4
p t1.kind