
def sort(arr, low, high)
  return [arr[low]] if low >= high
  mid = (low + high) >> 1
  larr = merge_sort(arr, low, mid)
  harr = merge_sort(arr, mid + 1, high)
  merge(larr, harr)
end

def merge(larr, harr)
  result = []
  li = 0; hi = 0
  ls = larr.length; hs = harr.length

  while li < ls and hi < hs
    if larr[li] < harr[hi]
      result << larr[li]
      li = li + 1
    else
      result << harr[hi]
      hi = hi + 1
    end
  end

  while li < ls
    result << larr[li]
    li = li + 1
  end

  while hi < hs
    result << harr[hi]
    hi = hi + 1
  end
  result
end

