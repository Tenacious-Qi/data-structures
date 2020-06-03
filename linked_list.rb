# frozen_string_literal: true

# linked-list containing Node objects
class LinkedList
  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
    @node = nil
  end

  def append(value)
    # adds a new node containing value to the end of the list
    if @head.nil?
      prepend(value)
      @tail = @head
    else
      current = Node.new(nil, @head)
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(value, nil)
      @tail = current.next_node
    end
  end

  def prepend(value)
    # adds a new node containing value to the start of the list
    current = Node.new(value, @head)
    @head = current
    @tail = @head if @head.next_node.nil?
    @head
  end

  def size
    # returns the total number of nodes in the list
    size = 0
    current = Node.new(@head.value, @head)
    until current.next_node.nil?
      current = current.next_node
      size += 1
    end
    size
  end

  def head
    # head returns the first node in the list
    @head.nil? ? nil : @head.value
  end

  def tail
    # returns the last node in the list
    @tail.nil? ? nil : @tail.value
  end

  def at(index)
    # returns the node at the given index
  end

  def pop
    # removes the last element from the list
  end

  def contains?(value)
    # returns true if the passed in value is in the list, else returns false.
  end

  def find(value)
    # returns the index of the node containing value, or nil if not found
  end

  def to_s
    # represent LinkedList objects as strings, in order to print them to console
    # format should be: ( value ) -> ( value ) -> ( value ) -> nil
    result = ''
    current = Node.new(@head.value, @head)
    until current.nil?
      unless current.next_node.nil?
        result += " ( #{current.next_node.value} ) -> "
      end
      result += 'nil ' if current.next_node.nil?
      current = current.next_node
    end
    result
  end
end

# creates Node objects
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
