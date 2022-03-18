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
Single-word string
----------------------------OUTPUT----------------------------------
Scrabble score as an integer

-----------------------------RULES----------------------------------
Explicit:

Implicit:
- Words are case insensitive
- Spaces score 0
- `nil` scores 0

-------------------------DATA STRUCTURES----------------------------
Strings & Arrays

----------------------------ALGORITHM-------------------------------
Scrabble class
LETTER_VALUES hash with scores

Constructor method saves input string as uppercase

`score` method
    - Initialize score integer variable
    - Split string into characters, iterate through
        - For each letter, add score to score variable
    - Return score variable
    

=end

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
    @word = word
  end

  def score
    pts = 0
    return pts unless @word.is_a? String
    @word.upcase.chars.each do |letter|
      LETTER_VALUES.each do |k, v|
        pts += k if v.include?(letter)
      end
    end
    pts
  end
  
  def self.score(word)
    Scrabble.new(word).score
  end
end