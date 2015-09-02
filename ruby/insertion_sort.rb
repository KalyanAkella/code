
def sort(arr, low, high)
  for i in (low + 1)..high
    j = i
    while j > low and arr[j-1] > arr[j]
      arr[j], arr[j-1] = arr[j-1], arr[j]
      j = j - 1
    end
  end
  arr
end

