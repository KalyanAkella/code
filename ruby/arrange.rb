
def try_fill(res, curr, n)
  return true if curr == 0

  (0...2*n).each do |i|
    if res[i] == 0 and res[i+curr+1] == 0
      res[i] = res[i+curr+1] = curr
      if (try_fill(res, curr - 1, n))
        return true
      end
      res[i] = res[i+curr+1] = 0
    end
  end
  return false
end

def fill(n)
  res = Array.new(2*n, 0)
  if try_fill(res, n, n)
    p res
  else
    p "Impossible"
  end
end

