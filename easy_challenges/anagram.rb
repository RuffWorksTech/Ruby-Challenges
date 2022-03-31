# rubocop:disable Layout/LineLength

=begin
----------------------------PROMPT----------------------------------
Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.

-----------------------------INPUT----------------------------------
Single-word string and a list (array) of candidates

----------------------------OUTPUT----------------------------------
Array of strings contaning all candidates that are anagrams

-----------------------------RULES----------------------------------
Explicit:

Implicit:
- All inputs and outputs are lower case
- Words must be the same length
- Words must have the exact same letters
- Letters cannot be reused
- Return an empty array if no anagrams are round

-------------------------DATA STRUCTURES----------------------------
Strings & Arrays

----------------------------ALGORITHM-------------------------------
Anagram class
- Contstructor that takes pattern word as an argument
- `match` method that takes an array of words as an argument

=end

class Anagram
  def initialize(pattern)
    @pattern = pattern.downcase
  end

  def match(candidate_arr)
    candidate_arr.each_with_object([]) do |word, anagrams|
      next if word.downcase == @pattern

      anagrams << word if word.downcase.chars.sort == @pattern.chars.sort
    end
  end
end

# detector = Anagram.new('diaper')
# p detector.match(%w(hello world zombies pants)) #== []

# detector = Anagram.new('ant')
# p detector.match(%w(tan stand at)) #== ['tan']

# detector = Anagram.new('corn')
# p detector.match(%w(corn dark Corn rank CORN cron park)) #== ['cron']

# detector = Anagram.new('allergy')
# p detector.match(%w( gallery ballerina regally clergy largely leading)) #== %w(gallery largely regally)

# rubocop:enable Layout/LineLength
