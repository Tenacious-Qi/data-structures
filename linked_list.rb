# frozen_string_literal: true

# linked-list containing Node objects
class LinkedList
  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
  end

  # head returns the first node in the list
  def head
    @head.nil? ? nil : @head.value
  end

  # returns the last node in the list
  def tail
    @tail.nil? ? nil : @tail.value
  end

  # adds a new node containing value to the end of the list
  def append(value)
    if @head.nil?
      prepend(value)
      @tail = @head
    else
      current = Node.new(nil, @head)
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(value, nil)
      @tail = current.next_node
      @tail.value
    end
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    current = Node.new(value, @head)
    @head = current
    # head and tail are the same if there's only one item in the list
    @tail = @head if @head.next_node.nil?
    @head.value
  end

  # returns the total number of nodes in the list
  def size(size = 0)
    current = Node.new(current, @head)
    until current.next_node.nil?
      current = current.next_node
      size += 1
    end
    size
  end

  # returns the node at the given index
  def at(index)
    i = 0
    current = Node.new(current, @head)
    until i > index
      current.nil? ? nil : current = current.next_node
      i += 1
    end
    current.nil? ? nil : current.value
  end

  # removes the last element from the list
  def pop
    return nil if @head.nil?

    current = Node.new(@head.value, @head)
    if @head.next_node.nil?
      result = current.value
      reset_head_and_tail
    else
      # stop iteration before item to be removed, i.e. current.next_node
      current = current.next_node until current.next_node.next_node.nil?
      @tail = current
      result = current.next_node.value
      current.next_node = nil
    end
    result
  end

  def reset_head_and_tail
    @head = nil
    @tail = nil
  end

  # returns true if the passed in value is in the list, else returns false.
  def contains?(value)
    current = Node.new(current, @head)
    until current.next_node.nil?
      current = current.next_node
      return true if current.value == value
    end
    false
  end

  # returns the index of the node containing value, or nil if not found
  def find(value); end

  # represent LinkedList objects as strings, in order to print them to console
  def to_s(result = '')
    return result if @head.nil?

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
