class Heap
  def self.from_enum enum
    heap = self.new
    enum.each {|elem| heap.insert elem}
    heap
  end

  def initialize op = :>
    @array = []
    @op = op
  end

  def insert elem
    @array << elem
    last_index = @array.size - 1
    while not @array[parent_index(last_index)].send(@op, @array[last_index]) and last_index > 0
      swap parent_index(last_index), last_index
      last_index = parent_index(last_index)
    end
    elem
  end

  def empty?
    @array.empty?
  end

  def array
    @array
  end

  def delete
    old_root = @array[0]
    return @array.pop if @array.size == 1
    @array[0] = @array.pop
    down_heapify 0
    old_root
  end

  def root
    @array[0]
  end

  def bottom
    @array[-1]
  end

  private
  def swap first_index, second_index
    tmp = @array[first_index]
    @array[first_index] = @array[second_index]
    @array[second_index] = tmp
  end

  def down_heapify index
    largest = index
    if left_child_index(index) < @array.size and @array[left_child_index(index)] > @array[largest]
      largest = left_child_index(index)
    end
    if right_child_index(index) < @array.size and @array[right_child_index(index)] > @array[largest]
      largest = right_child_index(index)
    end
    if largest != index
      swap index, largest
      down_heapify largest
    end
  end

  def parent_index i
    ((i-1)/2).floor
  end

  def left_child_index i
    2 * i + 1
  end

  def right_child_index i
    2 * i + 2
  end
end