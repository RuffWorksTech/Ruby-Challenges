=begin
----------------------------PROMPT----------------------------------
The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

-----------------------------INPUT----------------------------------
Single letter

----------------------------OUTPUT----------------------------------
Diamond of A - the input letter

-----------------------------RULES----------------------------------
Explicit:

Implicit:
- Diamond is hollow

-------------------------DATA STRUCTURES----------------------------
- Array

----------------------------ALGORITHM-------------------------------


=end
require 'pry'

class Diamond
  def self.make_diamond(letter)
    diamond_size = (letter.ord - 'A'.ord + 1) * 2
    diamond = ''
    hollow_letters = letter_array(letter) 
    
    hollow_letters.each do |letters|
      diamond << "#{letters.center(diamond_size, ' ')}\n"
    end
    
    hollow_letters.reverse.drop(1).each do |letters|
      diamond << "#{letters.center(diamond_size, ' ')}\n"
    end
    
    diamond
  end
  
  
  def self.letter_array(letter)
    letters = ['A']
    spacer = 1
    ('B'.ord..letter.ord).each do |n|
      letters << (n.chr + ' ' * spacer + n.chr)
      spacer += 2
    end
    letters
  end
end

puts Diamond.make_diamond('A')
puts Diamond.make_diamond('B')
puts Diamond.make_diamond('E')
puts Diamond.make_diamond('G')
puts Diamond.make_diamond('P')