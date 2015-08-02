
def left(arr, i)
  1 + (i << 1)
end

def right(arr, i)
  2 + (i << 1)
end

def max_heapify(arr, i)
  l = left(arr, i)
  r = right(arr, i)
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
