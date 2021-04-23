=begin
----------------------------PROMPT----------------------------------
Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

-----------------------------INPUT----------------------------------
Single integer (number of verses)

----------------------------OUTPUT----------------------------------
n (input number) verses of the beer song

-----------------------------RULES----------------------------------
Explicit:

Implicit:
- With one bottle of beer:
    - The verse changes to bottle instead of bottles
    - Instead of saying 0 it says "no more"
    - The last version says "No more bottles of beer" ; "Got to the store and buy some more, 99 bottles of beer on the wall."

- There are two methods: #verse and #verses
    - #verse does on single verse of the song
    - #verses can take a second optional argument that will only do the verses of the input number to the second argument
  

-------------------------DATA STRUCTURES----------------------------
Strings

----------------------------ALGORITHM-------------------------------
class BeerSong

#verse
  - Outputs a single verse of the beer song with the iteration of the version interpolated into the text
  - Has a special version for the second-to-last verse
  - Has a special version for the last verse

#verses
  - Runs the #verse method the number of times that the argument specifies down to a specified verse
=end

class BeerSong
  def self.verse(n)
    case n
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
      "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
    end
  end
  
  def self.verses(start, stop=0)
    start.downto(stop).with_object([]) do |n, verse_arr|
      verse_arr << verse(n)
    end.join("\n")
  end
  
  def self.lyrics
    verses(99)
  end
end

# puts BeerSong.verse(99)
# puts BeerSong.verse(3)
# puts BeerSong.verse(2)
# puts BeerSong.verse(1)
# puts BeerSong.verse(0)
# puts BeerSong.verses(99, 98)