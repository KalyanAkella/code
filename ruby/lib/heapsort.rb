
def left(i)
  1 + (i << 1)
end

def right(i)
  2 + (i << 1)
end

def parent(i)
  (i >> 1)
end

def heap_increase_key(arr, i, key)
  if key < arr[i]
    raise "Invalid input"
  end
  arr[i] = key
  while i > 0 and arr[parent(i)] < arr[i]
    arr[parent(i)], arr[i] = arr[i], arr[parent(i)]
    i = parent(i)
  end
end

def heap_decrease_key(arr, i, key)
  if key > arr[i]
    raise "Invalid input"
  end
  arr[i] = key
  max_heapify(arr, i)
end

def heap_set_key(arr, i, key)
  if key < arr[i]
    heap_decrease_key(arr, i, key)
  elsif key > arr[i]
    heap_increase_key(arr, i, key)
  else
    raise "Invalid input"
  end
end

def insert(arr, key)
  arr << (-1.0/0.0)
  heap_increase_key(arr, arr.length - 1, key)
end

def max_heapify(arr, i)
  l = left(i)
  r = right(i)
  if l < arr.length and arr[l] > arr[i]
    largest = l
  else
    largest = i
  end
  if r < arr.length and arr[r] > arr[largest]
    largest = r
  end
  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]
    max_heapify(arr, largest)     # Tail recursion here: Convert this to a loop
  end
end

def build_max_heap(arr)
  non_leaf_begin_index = (arr.length / 2.0).floor - 1
  non_leaf_begin_index.downto(0) do |i|
    max_heapify(arr, i)
  end
end

def heapsort(arr)
  build_max_heap(arr)
  last_index = arr.length - 1
  last_index.downto(1) do |i|
    arr[i], arr[0] = arr[0], arr[i]
    new_arr = arr[0, i]
    max_heapify(new_arr, 0)
    arr[0, i] = new_arr
  end
end
