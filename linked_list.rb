# frozen_string_literal: true

# linked-list containing Node objects
class LinkedList
  attr_accessor :head, :tail

  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
  end

  def append(value)
    if @head.nil?
      prepend(value)
    else
      current = Node.new(value)
      @tail.next_node = current
      @tail = current
    end
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    current = Node.new(value, @head)
    @head = current
    @tail = @head if @head.next_node.nil?
    @head
  end

  # returns the total number of nodes in the list
  def size(size = 0)
    return 0 if @head.nil?

    current = @head
    until current.nil?
      current = current.next_node
      size += 1
    end
    size
  end

  # returns the node at the given index
  def at(index, i = 0)
    return nil if index < 0

    current = @head
    until i == index
      current = current.next_node unless current.nil?
      i += 1
    end
    current
  end

  # removes the last element from the list
  def pop
    current = @head
    if @head.next_node.nil?
      @head = nil
      @tail = nil
      result = current.value
    else
      current = current.next_node until current.next_node.next_node.nil?
      @tail = current
      result = current.next_node.value
      current.next_node = nil
    end
    result
  end

  # returns true if the passed in value is in the list, else returns false.
  def contains?(value)
    return nil if @head.nil?

    current = @head
    until current.nil?
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  # returns the index of the node containing value, or nil if not found
  def find(value, index = 0)
    return nil if @head.nil?

    current = @head
    until current.nil?
      return index if current.value == value
      current = current.next_node
      index += 1
    end
  end


  # inserts the node the with provided value at the given index
  def insert_at(value, index)
    i = 0
    current = @head
    until i == index
      current = current.next_node
      i += 1
    end
    
    if current.next_node.nil? 
      current = Node.new(value, nil)
    else
      current = Node.new(value, current)
    end
  end

  # represent LinkedList objects as strings, in order to print them to console
  def to_s
    return nil if @head.nil?

    string = ''
    current = @head
    until current.nil?
      string += "( #{current.value} ) -> "
      string += 'nil' if current.next_node.nil?
      current = current.next_node
    end
    string
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
