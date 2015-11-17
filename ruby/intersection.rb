
def intersection(sets, max_num)
  arr = Array.new(max_num + 1, 0)
  sets.each do |set|
    set.each do |n|
      arr[n] += 1
    end
  end
  n = sets.length
  result = []
  arr.each_index do |i|
    result << i if arr[i] == n
  end
  result
end

def intersect(sets)
  counter = 0
  lookup = []
  hsh = {}
  sets.each do |set|
    set.each_index do |i|
      ele = set[i]
      unless hsh.has_key?(ele)
        lookup[counter] = ele
        hsh[ele] = counter
        counter += 1
      end
      set[i] = hsh[ele]
    end
  end

  intersection(sets, counter - 1).map { |n| lookup[n] }
end

