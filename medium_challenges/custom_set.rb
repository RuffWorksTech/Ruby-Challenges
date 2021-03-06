=begin
----------------------------PROMPT----------------------------------
Create a custom set type.

Sometimes it is necessary to define a custom data structure of some type, like a set. In this exercise you will define your own set type. How it works internally doesn't matter, as long as it behaves like a set of unique elements that can be manipulated in several, well-defined ways.

In some languages, including Ruby and JavaScript, there is a built-in Set type. For this problem, you're expected to implement your own custom set type. Once you've reached a solution, feel free to play around with using the built-in implementation of Set.

For simplicity, you may assume that all elements of a set must be numbers.

-----------------------------INPUT----------------------------------
Misc

----------------------------OUTPUT----------------------------------
No stdout unless a method asks for it

-----------------------------RULES----------------------------------
Explicit:
- 


Implicit:
- A set only allows for unique values
- Values can be stored in any order
- All values must be integers

-------------------------DATA STRUCTURES----------------------------
Arrays to store information

----------------------------ALGORITHM-------------------------------
class CustomSet
#empty?
#contains?
#subset?
#disjoint?
#eql?
#add
#intersection
#difference
#union

=end

require 'pry'

class CustomSet
  attr_accessor :set
  
  def initialize(arr=[])
    @set = arr.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(n)
    set.include?(n)
  end

  def subset?(other_arr)
    set == set.select { |n| other_arr.set.include?(n) }
  end

  def disjoint?(other_set)
    return true if set.empty? || other_set.empty?
    set.select { |n| other_set.set.include?(n) }.empty?
  end

  def eql?(other_set)
    set.sort.eql?(other_set.set.uniq.sort)
  end

  def add(new_element)
    set << new_element if !set.include?(new_element)
    CustomSet.new(set)
  end

  def ==(other_set)
    set == other_set.set
  end
  
  def intersection(other_set)
    return CustomSet.new if set.empty? || other_set.empty?
    matching_elements = set.select { |n| other_set.set.include?(n) }
    CustomSet.new(matching_elements)
  end

  def difference(other_set)
    if set.empty?
      return self
    elsif other_set.empty?
      return self
    else
      matching_elements = set.select { |n| other_set.set.include?(n) }
      @set -= matching_elements
      CustomSet.new(set)
    end
  end
  
  def union(other_set)
    sum = set + other_set.set
    CustomSet.new(sum.uniq.sort)
  end
end

p CustomSet.new == CustomSet.new