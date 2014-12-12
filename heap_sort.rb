class HeapSort
  attr_accessor :list
  attr_accessor :sorted

  def initialize(list)
    @list = list
    @sorted = []
    max_heapify
  end

  def max_heapify
    (0..list.length-1).each do |i|
      index = i
      while index != 0
        parent = (index - 1) / 2
        break if list[index] <= list[parent]
        swap(index, parent)
        index = parent
      end
    end
  end

  def swap(index_a, index_b)
    tmp = list[index_a]
    self.list[index_a] = list[index_b]
    self.list[index_b] = tmp
  end

  def pop_top
    top = list[0]
    last = list.pop
    if list.empty?
      return top
    else
      self.list[0] = last
    end
    index = 0
    while true
      child_a = 2 * index + 1
      child_b = 2 * index + 2
      child_a = index if child_a >= list.length - 1
      child_b = index if child_b >= list.length - 1
      break if ((list[index] >= list[child_a]) && (list[index] >= list[child_b]))
      if list[child_a] > list[child_b]
        swap_child = child_a
      else
        swap_child = child_b
      end
      swap(index, swap_child)
      index = swap_child
    end
    top
  end

  def sort
    while !list.empty?
      top = pop_top
      self.sorted.unshift(top)
    end
  end
end
