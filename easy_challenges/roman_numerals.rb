=begin
----------------------------PROMPT----------------------------------
Write some code that Roman numbers into their modern equivalent.

The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters have lots of straight lines and are hence easy to hack into stone tablets.

-----------------------------INPUT----------------------------------
Single integer

----------------------------OUTPUT----------------------------------
String outputs of the modern Roman numeral equivalent

-----------------------------RULES----------------------------------
Explicit:
- Do not worry about converting numbers larger than 3000

Implicit:

-------------------------DATA STRUCTURES----------------------------
Input -> Array
Checks hash that contains the links between numbers and their equivalent Roman numerals

----------------------------ALGORITHM-------------------------------
Initialize empty numeral string
Iterate through CONVERSTION_PAIRS
  - If number fits (division > 0), add the roman numeral to the string that many times
  - Assign remainder to variable that will be iterated next iteration

=end

class RomanNumeral
  attr_reader :n

  CONVERSION_PAIRS = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
                       100 => 'C',  90 => 'XC',  50 => 'L',  40 => 'XL',
                       10 => 'X',   9 => 'IX',   5 => 'V',   4 => 'IV',
                       1 => 'I'
                     }

  def initialize(num)
    @num = num
  end

  def to_roman
    numeral = ''
    divider = 10000
    
    3.times do |n|
      divider /= 10
      result, remainder = @num.divmod(divider)
      next if result == 0
      p [result, remainder]
    end
    
    numeral
  end
end

n = RomanNumeral.new(1)
p n.to_roman #== 'I'

n = RomanNumeral.new(2)
p n.to_roman #== 'II'

n = RomanNumeral.new(4)
p n.to_roman #== 'IV'

n = RomanNumeral.new(9)
p n.to_roman #== 'IX'

n = RomanNumeral.new(59)
p n.to_roman #== 'LIX'

n = RomanNumeral.new(93)
p n.to_roman #== 'XCIII'

n = RomanNumeral.new(1024)
p n.to_roman #== 'MXXIV'

n = RomanNumeral.new(3000)
p n.to_roman #== 'MMM'

# Original to_roman
  # def to_roman
  #   numeral = ''
  #   current_num = n
  #   CONVERSION_PAIRS.each do |k, v|
  #     result, remainder = current_num.divmod(k)

  #     numeral << v * result if result > 0
  #     current_num = remainder
  #   end
  #   numeral
  # end