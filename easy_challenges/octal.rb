# rubocop:disable Layout/LineLength

=begin
----------------------------PROMPT----------------------------------
Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output. Treat invalid input as octal 0.

Note: Implement the conversion yourself. Don't use any built-in or library methods that perform the necessary conversions for you. In this exercise, the code necessary to perform the conversion is what we're looking for,

About Octal (Base-8)

Decimal is a base-10 system. A number 233 in base 10 notation can be understood as a linear combination of powers of 10:

The rightmost digit gets multiplied by  10^0 = 1
The next digit gets multiplied by       10^1 = 10
The digit after that gets multiplied by 10^2 = 100
The digit after that gets multiplied by 10^3 = 1000
...
The n*th* digit gets multiplied by 10n-1.
All of these values are then summed.

Thus:

  233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100  + 3*10   + 3*1
Octal numbers are similar, but the use powers of 8 instead of powers of 10. Thus:

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

-----------------------------INPUT----------------------------------
Single string

----------------------------OUTPUT----------------------------------
Single integer

-----------------------------RULES----------------------------------
Explicit:

Implicit:
- If the input is not an integer, return 0
- If any number is 8 or 9, return 0

-------------------------DATA STRUCTURES----------------------------
String -> Integer -> Array -> Integer

----------------------------ALGORITHM-------------------------------
Octal class
Constructor method takes in string
`to_decimal` method
    - Return 0 if string is invalid
    - Convert string to integers then digits, iterate through
        - Number should be reversed, so multiply each number by 8^index
    - Return sum

'invalid?' method
    - If string contains any characters other than 0-7 -> false
=end

# rubocop:enable Layout/LineLength

class Octal
  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if invalid?

    decimal = 0
    @num.to_i.digits.each_with_index do |n, idx|
      decimal += n * 8**idx
    end
    decimal
  end

  def invalid?
    @num.chars.any?(/[^0-7]/)
  end
end

# p Octal.new('abc1z').to_decimal #== 0
# p Octal.new('6789').to_decimal #== 0
# p Octal.new('011').to_decimal #== 9
# p Octal.new('130').to_decimal #== 88
