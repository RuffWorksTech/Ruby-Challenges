=begin
----------------------------PROMPT----------------------------------
Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

-----------------------------INPUT----------------------------------
Single integer with an optional set of on or more other numbers

----------------------------OUTPUT----------------------------------
Single integer that is the sum of all the multiple of the set of given numbers (or 3 and 5 if no set is given)

-----------------------------RULES----------------------------------
Explicit:
- If no set of numbers is given, use default set of 3 and 5

Implicit:
- There needs be two #to methods: one class and one instance
- Sum all multiples of the numbers up to, but not including the limiting value

-------------------------DATA STRUCTURES----------------------------
To check for multiples, integers can be broken into ranges to iterate through

----------------------------ALGORITHM-------------------------------
SumOfMultiples class
`initialize` method saves input number to class variable
class `to` method
  - Up to (but not including the limiting number) select all values that are multiples of any numbers in the given or default set

=end

require 'pry'

class SumOfMultiples
  def initialize(*set)
    @set = set
  end
  
  def to(given_num)
    (1...given_num).each_with_object([]) do |n, result|
      @set.each do |set_num|
        result << n if n % set_num == 0
      end
    end.uniq.sum
  end
  
  def self.to(given_num)
    SumOfMultiples.new(3, 5).to(given_num)
  end
end

# p SumOfMultiples.to(10) #== 23
# p SumOfMultiples.to(100) #= 2_318
# p SumOfMultiples.new(4, 6).to(15) #== 30
# p SumOfMultiples.new(7, 13, 17).to(20) #== 51
# p SumOfMultiples.new(5, 6, 8).to(150) #== 4419