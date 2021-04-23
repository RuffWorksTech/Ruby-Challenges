=begin
----------------------------PROMPT----------------------------------
Write a program that, given a word, computes the Scrabble score for that word.

Letter Values
You'll need the following tile scores:

Letter	Value
A, E, I, O, U, L, N, R, S, T	  1
D, G	                          2
B, C, M, P	                    3
F, H, V, W, Y	                  4
K	                              5
J, X	                          8
Q, Z	                          10

How to Score
Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E

-----------------------------INPUT----------------------------------
Single string consisting of a single word

----------------------------OUTPUT----------------------------------
The Scrabble score for the input word

-----------------------------RULES----------------------------------
Explicit:

Implicit:

-------------------------DATA STRUCTURES----------------------------
String -> Array

----------------------------ALGORITHM-------------------------------
Class called Scrabble
  - Instantiate new objects with a string passed in
#score method
  - Score word according to score chart
      - Iterate through LETTER_VALUES
          - If letter is found in value array, add point to total
  - Return score
=end

require 'pry'

class Scrabble
  attr_reader :word
  
  LETTER_VALUES = { 1 => %w(A E I O U L N R S T),
                    2 => %w(D G),
                    3 => %w(B C M P),
                    4 => %w(F H V W Y),
                    5 => %w(K),
                    8 => %w(J X),
                    10 => %w(Q Z)
                  }

  def initialize(word)
    @word = word ? word : ''
  end

  def score
    points = 0
    word.each_char do |char|
      LETTER_VALUES.each do |k, v|
        points += k if v.include?(char.upcase)
      end
    end
    
    points
  end

  def self.score(str)
    Scrabble.new(str).score
  end
end