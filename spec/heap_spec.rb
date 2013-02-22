require './lib/datastructures/heap'

describe Heap do
  it 'should be instantiable' do
    Heap.new
  end

  it 'should have the same object_id at the top and bottom for singleton heaps' do
    heap = Heap.from_enum ["foo"]
    heap.root.object_id.should eq(heap.bottom.object_id)
  end

  it 'should satisfy the heap property for a heap made from a random array' do
    10.times do
      heap = Heap.from_enum (1..100).to_a.map {rand(1000000)}.uniq
      check_heap_property_of_array heap.instance_variable_get(:@array)
    end
  end

  it 'should satisfy the heap property after deleting an element' do
    1000.times do
      heap = Heap.from_enum (1..10).to_a.map {rand(1000000)}.uniq
      heap.delete
      check_heap_property_of_array heap.instance_variable_get(:@array)
    end
  end

  it 'should always get a smaller element when calling delete' do
    1000.times do
      heap = Heap.from_enum (1..100).to_a.map {rand(1000000)}.uniq
      last = 1000000000000
      until heap.empty? do
        current = heap.delete
        last.should be > current
        last = current
      end
    end
  end
end

def check_heap_property_of_array array
  array.each_with_index do |elem, i|
    elem.should be > array[2*i + 1] if array[2*i + 1]
    elem.should be > array[2*i + 2] if array[2*i + 2]
  end
end