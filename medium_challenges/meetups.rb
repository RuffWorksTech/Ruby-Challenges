=begin
----------------------------PROMPT----------------------------------
Meetups are a great way to meet people who share a common interest. Typically, meetups happen monthly on the same day of the week. For example, a meetup's meeting may be set as:

The first Monday of January 2021
The third Tuesday of December 2020
The teenth wednesday of December 2020
The last Thursday of January 2021
In this program, we'll construct objects that represent a meetup date. Each object takes a month number (1-12) and a year (e.g., 2021). Your object should be able to determine the exact date of the meeting in the specified month and year. For instance, if you ask for the 2nd Wednesday of May 2021, the object should be able to determine that the meetup for that month will occur on the 12th of May, 2021.

The descriptors that may be given are strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'. The case of the strings is not important; that is, 'first' and 'fIrSt' are equivalent. Note that "teenth" is a made up word. There was a meetup whose members realised that there are exactly 7 days that end in '-teenth'. Therefore, it's guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is the "teenth" of that day in every month. That is, every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc. The fifth day of the month may not happen every month, but some meetup groups like that irregularity.

The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'. Again, the case of the strings is not important.

-----------------------------INPUT----------------------------------
Object instantiation:
- Month number (integer)
- Year (integer)


#day method
- Day of week (string)
- Descriptor (string)

----------------------------OUTPUT----------------------------------
#day
- Date object perfectly equivalent to Date.civil(year, month, day)

-----------------------------RULES----------------------------------
Explicit:
- Descriptors are case insensitive
- Week days are case insensitive
- 'teenth' refers to the 13th-19th (7 days)

Implicit:


-------------------------DATA STRUCTURES----------------------------
Date objects

----------------------------ALGORITHM-------------------------------
class Meetup

#initialize
  - Assign year and month to instance variables

#day
  - Determine cwday of first day of the month
  - Find difference between first day of month and inputted date

  - Return Date object

=end

require 'date'

class Meetup
  attr_reader :calendar

  def initialize(year, month)
    @year = year
    @month = month
    @days_in_month = Date.civil(@year, @month, -1).day
    @calendar = generate_calendar
  end

  def generate_calendar
    calendar = { 1 => [],
                 2 => [],
                 3 => [],
                 4 => [],
                 5 => [],
                 6 => [],
                 7 => []
               }

    date = Date.civil(@year, @month).cwday
    7.times do |n|
      counter = n + 1
      while counter <= @days_in_month
        calendar[date] << counter
        counter += 7
      end
      date == 7 ? date -= 6 : date += 1
    end

    calendar.transform_keys { |k| int_to_cwday(k) }
  end

  def int_to_cwday(int)
    case int
    when 1 then 'monday'
    when 2 then 'tuesday'
    when 3 then 'wednesday'
    when 4 then 'thursday'
    when 5 then 'friday'
    when 6 then 'saturday'
    when 7 then 'sunday'
    end
  end

  def day(weekday, descriptor)
    weekday = weekday.downcase
    index = descriptor_translator(descriptor)
    index = @calendar[weekday].find_index { |day| 12 < day && day < 20 } if index == 'teenth'

    day = @calendar[weekday][index]

    return nil if day.nil?
    Date.new(@year, @month, day)
  end

  def descriptor_translator(descriptor)
    case descriptor.downcase
    when 'first' then 0
    when 'second' then 1
    when 'third' then 2
    when 'fourth' then 3
    when 'fifth' then 4
    when 'last' then -1
    else 'teenth'
    end
  end
end

p Meetup.new

# p Meetup.new(2013, 3).day('Monday', 'first') == Date.civil(2013, 3, 4)
# p Meetup.new(2013, 4).day('monday', 'first') == Date.civil(2013, 4, 1)
# p Meetup.new(2013, 5).day('Tuesday', 'first') == Date.civil(2013, 5, 7)
# p Meetup.new(2013, 6).day('wednesday', 'first') == Date.civil(2013, 6, 5)
# p Meetup.new(2013, 7).day('Thursday', 'first') == Date.civil(2013, 7, 4)
# p Meetup.new(2013, 8).day('Friday', 'first') == Date.civil(2013, 8, 2)
# p Meetup.new(2013, 9).day('Saturday', 'first') == Date.civil(2013, 9, 7)
# p Meetup.new(2013, 10).day('Sunday', 'first') == Date.civil(2013, 10, 6)