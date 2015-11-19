
def binary_search(arr, ele)
  first = 0
  last = arr.length - 1
  while first <= last
    middle = ((first + last) / 2).floor
    if ele == arr[middle]
      return middle
    elsif ele < arr[middle]
      last = middle - 1
    else
      first = middle + 1
    end
  end
  return -1
end

def max_sum_arr(arr1, arr2)
  i = j = 0
  sum1 = sum2 = 0
  result = 0
  t = []
  t1 = []
  t2 = []
  while i < arr1.length and j < arr2.length
    k1 = binary_search(arr2, arr1[i])
    k2 = binary_search(arr1, arr2[j])
    if k1 < 0 and k2 < 0
      sum1 += arr1[i]
      t1 << arr1[i]
      sum2 += arr2[j]
      t2 << arr2[j]
    elsif k1 >= 0
      (j...k1).each do |jk|
        sum2 += arr2[jk] if jk < arr2.length
        t2 << arr2[jk] if jk < arr2.length
      end
      if sum1 > sum2
        result += sum1
        t << t1
      else
        result += sum2
        t << t2
      end
      result += arr1[i]
      t << arr1[i]
      sum1 = sum2 = 0
      t1 = []
      t2 = []
      j = k1
    elsif k2 >= 0
      (i...k2).each do |ik|
        sum1 += arr1[ik] if ik < arr1.length
        t1 << arr1[ik] if ik < arr1.length
      end
      if sum1 > sum2
        result += sum1
        t << t1
      else
        result += sum2
        t << t2
      end
      result += arr2[j]
      t << arr2[j]
      sum1 = sum2 = 0
      t1 = []
      t2 = []
      i = k2
    end
    i += 1
    j += 1
  end

  while i < arr1.length
    sum1 += arr1[i]
    t1 << arr1[i]
    i += 1
  end

  while j < arr2.length
    sum2 += arr2[j]
    t2 << arr2[j]
    j += 1
  end

  if sum1 > sum2
    result += sum1
    t << t1
  else
    result += sum2
    t << t2
  end
  [result, t.flatten]
end

def max_sum(arr1, arr2)
  i = j = 0
  sum1 = sum2 = 0
  result = 0
  while i < arr1.length and j < arr2.length
    k1 = binary_search(arr2, arr1[i])
    k2 = binary_search(arr1, arr2[j])
    if k1 < 0 and k2 < 0
      sum1 += arr1[i]
      sum2 += arr2[j]
    elsif k1 >= 0
      (j...k1).each do |jk|
        sum2 += arr2[jk] if jk < arr2.length
      end
      result += [sum1, sum2].max
      result += arr1[i]
      sum1 = sum2 = 0
      j = k1
    elsif k2 >= 0
      (i...k2).each do |ik|
        sum1 += arr1[ik] if ik < arr1.length
      end
      result += [sum1, sum2].max
      result += arr2[j]
      sum1 = sum2 = 0
      i = k2
    end
    i += 1
    j += 1
  end

  while i < arr1.length
    sum1 += arr1[i]
    i += 1
  end

  while j < arr2.length
    sum2 += arr2[j]
    j += 1
  end

  result += [sum1, sum2].max
  result
end

