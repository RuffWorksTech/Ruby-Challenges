=begin
----------------------------PROMPT----------------------------------
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. Your solution should not allow the use of the same name twice when avoidable.

-----------------------------INPUT----------------------------------
None

----------------------------OUTPUT----------------------------------
Robot name in the form of a string

-----------------------------RULES----------------------------------
Explicit:
- Name is generated the robot is initialized
- New name is obtained after a factory reset
- Name followe pattern of two uppercase alphabetic characters followed by 3 digits

Implicit:


-------------------------DATA STRUCTURES----------------------------
Class-level array to store already assigned names

----------------------------ALGORITHM-------------------------------
class Robot
#name
  - Create empty name variable
  loop
    - Obtain randomized name
    - If name is not in register, break
  - Add name to register
  - Assign name to instance variable

#reset
  - Remove name from register
  - Calls name method

#generate_name
  - Create emtpy name variable
  - Add 2 x A-Z characters to name variable
  - Add 3 x 0-9 characters to name variable
  - Return name variable

=end

class Robot
  attr_reader :name
  @@robot_names = []

  def name
    return @name if @name
    @name = generate_name while @@robot_names.include?(@name) || @name.nil?
    @@robot_names << name
    @name
  end

  def reset
    @@robot_names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    name = ''
    2.times { |letter| name << ('A'..'Z').to_a.sample }
    3.times { |n| name << ('0'..'9').to_a.sample }
    name
  end
end

# a = Robot.new
# p a.name
# p a.reset