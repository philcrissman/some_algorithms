class Node
  attr_accessor :next_node, :value

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

  # delete the next node
  def delete_after
    if !next_node.nil?
      @next_node = next_node.next_node
    else
      raise "This is the last node; nothing to delete."
    end
  end

  def insert_after(node)
    # make node.next_node == self.next_node
    node.next_node = next_node
    # make self.next_node == node
    self.next_node = node
  end
end

# a singly linked list
class LinkedList
  attr_accessor :top, :bottom

  def initialize(top=nil)
    # top has to be a Node, or nil
    if top.is_a?(Node) || top.nil?
      @top = top
      @bottom = find_last
    else
      raise NotANode
    end
  end

  def add(node)
    raise NotANode if !node.is_a?(Node)
    if @top.nil?
      self.top = node
      self.bottom = node
    else
      self.bottom.next_node = node
      self.bottom = node
    end
  end

  def find_last
    return top if top.nil?
    ptr = top
    while !ptr.next_node.nil?
      ptr = ptr.next_node
    end
    ptr
  end

  def sort!
    count.times do 
      ptr = top
      while !ptr.next_node.nil?
        swaps = 0
        if ptr.value < ptr.next_node.value
          # move up the ptr, these are already in order
          ptr = ptr.next_node
        else
          # swap the values
          swap(ptr, ptr.next_node)
          swaps += 1
          # since we only swapped _values_, we need to increment the ptr
          ptr = ptr.next_node
        end
        # if there were no swaps on the way through, the list is sorted.
        break if swaps == 0
      end
    end
  end

  def swap(node_1, node_2)
    # generalized to swap any two nodes. Mkay?
    # just swaps the values.
    tmp = node_1.value
    node_1.value = node_2.value
    node_2.value = tmp
  end

  def count
    c = 0
    curr = top
    while !curr.nil?
      c += 1
      curr = curr.next_node
    end
    c
  end

  def iter
    curr = top
    while !curr.nil?
      puts curr.value
      curr = curr.next_node
    end
  end
end

class NotANode < RuntimeError

end
