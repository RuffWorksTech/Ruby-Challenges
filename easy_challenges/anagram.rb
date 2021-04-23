=begin
----------------------------PROMPT----------------------------------
Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.

-----------------------------INPUT----------------------------------
- Single string consisting of a single word
- A list of candidates for an anagram

----------------------------OUTPUT----------------------------------
- A list of all candidates that are anagrams of the input word

-----------------------------RULES----------------------------------
Explicit:

Implicit:
- Return an array
- If no candidates are anagrams, return an empty array
- Identical words are not anagrams
- Anagrams are case insensitive
- Duplicates are removed

-------------------------DATA STRUCTURES----------------------------
Arrays

----------------------------ALGORITHM-------------------------------
Class called Anagram
    - Initialize new Anagram object using a single string
#match method that detects anagrams and returns an array
    - Skip if word in array is same as anagram string
    - sort word, include in list if it is equal to anagram string sorted

=end

class Anagram
  attr_reader :word
  
  def initialize(word)
    @word = word.downcase
  end

  def match(list)
    list.select do |candidate|
      test_word = candidate.downcase
      next if test_word == word
      test_word.chars.sort.join == word.chars.sort.join
    end.uniq
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