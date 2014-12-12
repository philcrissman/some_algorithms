class Quicksort

  attr_accessor :list

  def initialize(arr)
    # maybe we don't _want_ to alter the original array
    @list = arr.dup
  end

  def sort(arr=@list, start=0, finish=@list.length-1)
    finish += 1 if finish < 0
    start -= 1 if start > finish
    return if start == finish

    # pick a pivot
    pivot_value = list[pivot = start + ((finish - start + 1) / 2)]
    list[pivot] = nil
    swap(pivot, start)
    hole = start
    
    left = start + 1
    right = finish

    while left <= right
      # find right
      right, hole = abstract_while_loop(right, left, :<, hole, pivot_value)

      # if the first pass made it all the way through, 
      # then the whole array is > pivot_value
      break if right < left 

      # find left
      left, hole = abstract_while_loop(left, right, :>, hole, pivot_value)
    end 

    # at this point, the hole should be in left == right
    # put pivot_value in the hole
    list[hole] = pivot_value
    sort(list, start, hole-1)
    sort(list, hole+1, finish)

    list
  end

  # this is sort of terrible. 5 parameters! But it lets the #sort method be
  # substantially shorter by extracting some _almost_ identical logic.
  # Worthwhile? :/ I don't know.
  def abstract_while_loop(this_index, that_index, method, hole, pivot_value)
    while !list[this_index].nil?
      break if this_index.send(method, that_index)
      if list[this_index].send(method, pivot_value)
        swap(hole, this_index)
        hole = this_index
        this_index = indecrement(method, this_index)
        break
      end
      this_index = indecrement(method, this_index)
    end
    [this_index,hole]
  end

  # increment or decrement. 
  def indecrement(method, index)
    if 0.send(method, 1)
      index -= 1
    else
      index += 1
    end
  end

  def swap(this_index, that_index)
    tmp = list[this_index]
    list[this_index] = list[that_index]
    list[that_index] = tmp
  end
end

