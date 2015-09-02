
def sort(arr, low, high)
  if low < high
    pivot = partition(arr, low, high)
    sort(arr, low, pivot - 1)
    sort(arr, pivot + 1, high)
  end
end

def partition(arr, low, high)
  x = arr[high]
  i = low - 1
  for j in low..(high - 1)
    if arr[j] <= x
      i = i + 1
      arr[j], arr[i] = arr[i], arr[j]
    end
  end
  arr[i + 1], arr[high] = arr[high], arr[i + 1]
  i + 1
end

