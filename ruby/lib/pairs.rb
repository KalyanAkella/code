
# Problem of finding all pairs in an array of integers
# whose sum is a given k

def find_1(arr, k)
  l = arr.length
  result = []
  arr.each_index do |i|
    (i+1).upto(l-1) do |j|
      result << [arr[i], arr[j]] if (arr[i] + arr[j]) == k
    end
  end
  result
end

require 'set'

def find_2(arr, k)
  s = arr.to_set
  result = []
  arr.each do |n|
    o = k - n
    if s.include?(o)
      result << [n, o]
      s.delete(n)
    end
  end
  result
end

