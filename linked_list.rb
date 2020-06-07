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
  def at(index, curr_idx = 0)
    return nil if index > size - 1 || index.negative?

    current = @head
    until curr_idx == index
      current = current.next_node unless current.nil?
      curr_idx += 1
    end
    current
  end

  # removes the last element from the list
  def pop
    return nil if @head.nil?

    current = @head
    if @head.next_node.nil?
      @head = nil
      @tail = nil
      result = current
    else
      current = current.next_node until current.next_node.next_node.nil?
      @tail = current
      result = current.next_node
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
    return nil if index > size || index.negative?
    return prepend(value) if index.zero?

    previous = nil
    current = @head
    until current.nil?
      previous = current
      current = current.next_node
      if current == at(index)
        return previous.next_node = Node.new(value, current)
      end
    end
  end

  # similar to #insert_at but inserts after given index
  def insert_after(value, index)
    return nil if index > size - 1 || index.negative?
    return append(value) if index == size - 1

    current = @head
    until current.nil?
      current = current.next_node
      if current == at(index)
        return current.next_node = Node.new(value, current.next_node)
      end
    end
  end

  def remove_at(index)
    return nil if index > size - 1 || index.negative?

    if index.zero?
      @head = @head.next_node
    elsif index == size - 1
      pop
    else
      previous = nil
      current = @head
      until current.nil?
        previous = current
        current = current.next_node
        if current == at(index)
          previous.next_node = current.next_node
          return current
        end
      end
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
