=begin
----------------------------PROMPT----------------------------------
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by a given clock object. Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

-----------------------------INPUT----------------------------------
Integers only, first argument is the hour value and second is the minutes value

----------------------------OUTPUT----------------------------------
None

-----------------------------RULES----------------------------------
Explicit:
- To clock objects that represent the same time should be equal to each other
- Use arithmetic operations only


Implicit:
- First input is the hour
- Second input is minutes
  - If there is no minute value provided, the default value is 0
- The #at method can be subtracted from or added to to change the clock value

-------------------------DATA STRUCTURES----------------------------
Integers, Strings

----------------------------ALGORITHM-------------------------------
class Clock

#initialize
  - Assigns hours and minutes to instance variables

#at
  - Creates new Clock objects via #initialize and returns them
  
#to_s
  - Create emtpy string variables for hours and minutes
  - If hours value has 1 digit, add a leading zero
  - If minutes value has 1 digit, add a leading zero
  
#+
  - Divide input minutes by 60, save to variables
  - If summed minutes >= 60, increase hour by 1 and subtract minutes by 60
  - If hours are >= 24, reset to 0
  
  - Add remaining minutes to minutes value
  
#-
  - Divide input minutes by 60, save to variables
  - If minutes <= 60, decrease hour by 1
  - If hours are <= 0, reset to 23
  
  - Subtract remaining minutes from minutes value


#==
  - Equates hours and minutes variables of Clock objects

=end

class Clock
  attr_reader :hours, :minutes
  
  def initialize(hours, minutes = 0)
    @hours = hours
    @minutes = minutes
  end
  
  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  def +(minutes_mod)
    hrs_to_add, minutes_to_add = minutes_mod.divmod(60)
    @hours += hrs_to_add
    @minutes += minutes_to_add
    if @minutes >= 60
      @hours +=1
      @minutes -= 60
    end
    until @hours < 24
      @hours -= 24
    end
    Clock.new(@hours, @minutes)
  end
  
  def -(minutes_mod)
    hrs_to_subtract, minutes_to_subtract = minutes_mod.divmod(60)
    @hours -= hrs_to_subtract
    @minutes -= minutes_to_subtract
    if @minutes < 0
      @hours -=1
      @minutes += 60
    end
    until @hours >= 0
      @hours += 24
    end
    Clock.new(@hours, @minutes)
  end
  
  def ==(other_clock)
    @hours == other_clock.hours && @minutes == other_clock.minutes
  end
  
  def to_s
    format('%02d:%02d', hours, minutes)
  end
end

# p Clock.at(0, 21).to_s #== '08:00'
# p Clock.at(8).to_s #== '08:00'
# p Clock.at(9).to_s #== '09:00'
# p (Clock.at(10) + 3).to_s #== '10:03'
# p (Clock.at(10) - 3).to_s #== '09:57'