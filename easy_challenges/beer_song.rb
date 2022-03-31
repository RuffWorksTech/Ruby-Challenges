# rubocop:disable Layout/LineLength

=begin
----------------------------PROMPT----------------------------------
Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

-----------------------------INPUT----------------------------------
Single integer indicating which verse to sing
(optional) integer indicating a range to sing between

----------------------------OUTPUT----------------------------------
The 99 Bottls of Beer song, correctly formatted as a string

-----------------------------RULES----------------------------------
Explicit:

Implicit:
- Whenever 1 bottle of beer is one the wall, remove the 's'
- When there are no more bottls of beer on the wall, 'Go to the store and buy some more, 99 bottles of beer on the wall.''
- The #lyrics method does all 100 verses
- All methods are class methods
- Inputs

-------------------------DATA STRUCTURES----------------------------
It may be handy to use an array

----------------------------ALGORITHM-------------------------------
BeerSong class
  - #verse
      - Begin song with given number of beers on the wall, sing one verse
  - #verses
      - Create empty string
  - #lyrics
      - Output entire song (100 verses)

=end

# rubocop:enable Layout/LineLength

class BeerSong
  def self.verse(bottles)
    if bottles == 2
      "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
    elsif bottles == 1
      "#{bottles} bottle of beer on the wall, #{bottles} bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n" \
    elsif bottles.zero?
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
      "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n" \
    end
  end

  def self.verses(start, stop)
    start.downto(stop).with_object([]) { |n, song_str| song_str << verse(n) }.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end

# puts BeerSong.verse(99)
# puts BeerSong.verse(3)
# puts BeerSong.verse(2)
# puts BeerSong.verse(1)
# puts BeerSong.verse(0)
# puts BeerSong.verses(50, 0)
