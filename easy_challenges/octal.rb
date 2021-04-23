=begin
----------------------------PROMPT----------------------------------
Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output. Treat invalid input as octal 0.

Note: Implement the conversion yourself. Don't use any built-in or library methods that perform the necessary conversions for you. In this exercise, the code necessary to perform the conversion is what we're looking for,

About Octal (Base-8)

Decimal is a base-10 system. A number 233 in base 10 notation can be understood as a linear combination of powers of 10:

The rightmost digit gets multiplied by 100 = 1
The next digit gets multiplied by 101 = 10
The digit after that gets multiplied by 102 = 100
The digit after that gets multiplied by 103 = 1000
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
Single integer as a string representation

----------------------------OUTPUT----------------------------------
The decimal conversion of the input integer

-----------------------------RULES----------------------------------
Explicit:

Implicit:
- If result < 0, return 0
- If input is anything other than an integer, return 0

-------------------------DATA STRUCTURES----------------------------
Array for iteration

----------------------------ALGORITHM-------------------------------
Octal class that takes a string as a new object
#to_decimal method
- Return 0 if any character is not a number
- Return 0 if any character is 8 or 9

Set string as array, reverse
Iterate as many times as the array is long (map)
  - Multiply the digit by 8^n
  - Sum the array
Return the sum


=end

class Octal
  attr_reader :num
  
  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 unless valid?(num)

    num.to_i.digits.each_with_index.with_object([]) do |(n, idx), arr|
      arr << n * (8 ** idx)
    end.sum
  end
  
  def valid?(num)
    num.downcase.match(/[a-z,89]/)
  end
end

# p Octal.new('abc1z').to_decimal == 0
# p Octal.new('6789').to_decimal == 0
# p Octal.new('011').to_decimal == 9
# p Octal.new('130').to_decimal == 88