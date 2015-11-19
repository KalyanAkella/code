
def binary_search(arr, k)
  start_index = 0
  end_index = arr.length - 1
  while start_index <= end_index
    middle = (end_index + start_index) >> 1
    if arr[middle] < k
      start_index = middle + 1
    elsif arr[middle] > k
      end_index = middle - 1
    else
      return middle
    end
  end
  -1
end

def floor_(arr, k)
  sarr = arr.sort
  index = binary_search(sarr, k)
  if index > 0
    return sarr[index-1]
  else
    return nil
  end
end

def ceil(arr, k)
  sarr = arr.sort
  index = binary_search(sarr, k)
  if index < (arr.length - 1)
    return sarr[index+1]
  else
    return nil
  end
end

def floor(arr, k)
  min = Float::INFINITY
  arr.each do |n|
    #
  end
end

