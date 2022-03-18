=begin
----------------------------PROMPT----------------------------------
Write a simple linked list implementation. The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.

The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list whose elements may contain a range of data such as the numbers 1-10. Provide functions to reverse the linked list and convert a linked list to and from an array.

Provided Test Cases: Ruby

-----------------------------INPUT----------------------------------
Element class
- Given a value to save as the datum
- Optional second argument is second element in list

----------------------------OUTPUT----------------------------------
No stdout for these classes

-----------------------------RULES----------------------------------
Explicit:
- Each element contains data and a "next" field pointing to the next element in the list
- Create a singly linked list whose elements contain a range of data 1-10
- Provide functions to reverse the linked list and convert a linked list to and from an array


Implicit:
- Default value for second argument of Element object instantiation is nil
- #next returns the next element in the list

-------------------------DATA STRUCTURES----------------------------


----------------------------ALGORITHM-------------------------------
class Element
- #initialize takes value and saves as datum
- #datum returns datum 
- #tail? returns true?
- #next returns next element in list

class SimpleLinkedList
- #size returns size of list
- #empty? returns true if list is empty
- #peek returns size of list
- #push add elemnt to beginning of list
- #head first element of list
- #from_a creates a linked list from an array
- #to_a converts a list to an array
- #reverse reverses the list

=end

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def size
    size = 0
    current_el = @head
    while current_el
      size += 1
      current_el = current_el.next
    end
    size
  end

  def empty?
    @head.nil?
  end

  def push(datum)
    el = Element.new(datum, @head)
    @head = el
  end

  def peek
    head ? head.datum : nil
  end

  def pop
    datum = peek
    new_head = @head.next
    @head = new_head
    datum
  end

  def self.from_a(arr)
    arr = [] if !arr.is_a? Array

    new_list = SimpleLinkedList.new
    arr.reverse.each { |el| new_list.push(el) }
    new_list
  end

  def to_a
    arr = []
    current_el = head
    while !current_el.nil?
      arr.push(current_el.datum)
      current_el = current_el.next
    end
    arr
  end
  
  def reverse
    new_list = SimpleLinkedList.new
    current_el = head
    while !current_el.nil?
      new_list.push(current_el.datum)
      current_el = current_el.next
    end
    new_list
  end
end

p list = SimpleLinkedList.from_a((1..2).to_a)
p list.head