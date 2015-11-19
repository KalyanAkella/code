
def smallest_set(arr, k)
  arr.sort!
  sum = arr.inject(0) { |acc,ele| acc + ele }
  return [] if sum < k
  arr.each_index do |i|
    sum = sum - arr[i]
    if sum < k
      return arr[i, arr.length]
    end
  end
  return [arr.last]
end

