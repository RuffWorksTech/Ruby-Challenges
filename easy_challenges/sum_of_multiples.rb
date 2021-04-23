=begin
----------------------------PROMPT----------------------------------
Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

-----------------------------INPUT----------------------------------
A set of one or more numbers and a number to go to

----------------------------OUTPUT----------------------------------
The sum of all of the multiples of the list of numbers

-----------------------------RULES----------------------------------
Explicit:
- If numbers are not includes, use the default set of 3 and 5

Implicit:
- The #to method is a class method but can also be called by instances

-------------------------DATA STRUCTURES----------------------------
Array to hold set of numbers

----------------------------ALGORITHM-------------------------------
class SumOfMultiples
- Can optionally take a set of one or more numbers, otherwise uses [3, 5]

#to method (class method)
- iterate through set of
  - Iterate up to the give number - 1
    - Push the number into a temp array if it is a multiple of the number
- Return the summed array

=end

require 'pry'

class SumOfMultiples
  attr_reader :set
  
  def initialize(*set)
    @set = set.empty? ? [3,5] : set
  end

  def to(limit)
    set.each_with_object([]) do |num, arr|
      1.upto(limit - 1) do |n|
        arr << n if (n % num).zero?
      end
    end.uniq.sum
  end

  def self.to(limit)
    SumOfMultiples.new().to(limit)
  end
end

p SumOfMultiples.to(10) == 23
p SumOfMultiples.to(100) == 2_318
p SumOfMultiples.new(4, 6).to(15) == 30
p SumOfMultiples.new(7, 13, 17).to(20) == 51
p SumOfMultiples.new(5, 6, 8).to(150) == 4419