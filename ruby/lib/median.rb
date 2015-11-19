
def median(arr1, arr2)

  m1 = arr1.length/2
  m2 = arr2.length/2

  p "*"*100
  p "#{arr1} : #{m1}"
  p "#{arr2} : #{m2}"
  p "*"*100

  arr1, arr2, m1, m2 = arr2, arr1, m2, m1 if arr1[m1] < arr2[m2]
  if arr1[m1] > arr2[m2]
    if arr1.length < 2
      return (arr1[m1] + arr2[arr2.length - 1]) / 2
    elsif arr2.length < 2
      return (arr1[m1] + arr2[m2]) / 2
    else
      n1 = arr1[0..m1]
      n2 = arr2[m2...arr2.length]
      return median(n1, n2)
    end
  else
    return (arr1[m1] + arr2[m2]) / 2
  end
end

def median_1(arr1, arr2)
  arr1.sort!
  arr2.sort!

  t = []
  i,j = 0,0
  
  while j < arr2.length and i < arr1.length do
    if arr1[i] < arr2[j]
      t << arr1[i]
      i = i + 1
    else
      t << arr2[j]
      j = j + 1
    end
  end

  while i < arr1.length do
    t << arr1[i]
    i = i + 1
  end

  while j < arr2.length do
    t << arr2[j]
    j = j + 1
  end

  #p t
  l = t.length
  result = nil
  if l > 0
    if l % 2 == 0
      i1 = l / 2
      i2 = i1 - 1
      result = (t[i1] + t[i2]) / 2.0
    else
      result = t[l/2]
    end
  end
  result
end

