
# [0, 1, 1, 1, 1, 1, 0, 0, 1], k = 2

def sort(a, k)
  c = Array.new(k, 0)
  a.each do |e|
    c[e] = c[e] + 1
  end
  total = 0
  k.times do |i|
    old = c[i]
    c[i] = total
    total += old
  end
  r = Array.new(a.length, 0)
  a.each_index do |i|
    r[c[a[i]]] = a[i]
    c[a[i]] = c[a[i]] + 1
  end
  r
end

