
def min_max(arr)
  min = arr[0]
  max = arr[0]
  arr.each do |n|
    if n < min
      min = n
    end
    if n > max
      max = n
    end
  end
  [min, max]
end

def second_min(arr)
  index = nth_min_internal(arr.clone, 2)
  arr[index]
end

def nth_min(arr, n)
  index = nth_min_internal(arr.clone, n)
  arr[index]
end

def nth_min_internal(arr, n)
  min_index = 0
  max = arr[0]
  l = arr.length
  n.times do
    (0...l).each do |i|
      if arr[i] < arr[min_index]
        min_index = i
      end
      if arr[i] > max
        max = arr[i]
      end
    end
    arr[min_index] = max
  end
  min_index
end

