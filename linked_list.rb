# frozen_string_literal: true

# linked-list containing Node objects
class LinkedList
  attr_reader :head, :tail

  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
  end

  # adds a new node containing value to the end of the list
  # def append(value)
  #   if @head.nil?
  #     prepend(value)
  #     @tail = @head
  #   else
  #     current = @head
  #     current = current.next_node until current.next_node.nil?
  #     current.next_node = Node.new(value)
  #     @tail = current.next_node
  #   end
  #   @tail.value
  # end

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
  def size
    return 0 if @head.nil?

    size = 0
    current = @head
    until current.nil?
      current = current.next_node
      size += 1
    end
    size
  end

  # returns the node at the given index
  def at(index)
    return 'index must be an integer' if index.is_a?(String)

    i = 1
    current = @head
    until i > index
      current = current.next_node unless current.nil?
      i += 1
    end
    current.nil? ? nil : current.value
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
  def find(value)
    return nil if @head.nil?

    current = @head
    counter = 0
    until current.next_node.nil?
      current = current.next_node
      return counter if current.value == value

      counter += 1
    end
    nil
  end

  # def insert_at(value, index)

  # end

  # represent LinkedList objects as strings, in order to print them to console
  def to_s
    return nil if @head.nil?

    result = ''
    current = @head
    until current.nil?
      result += "( #{current.value} ) -> "
      result += 'nil' if current.next_node.nil?
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
