
def fib(num)
  ans = Array.new(num + 1, -1)
  ans[0] = 0
  ans[1] = 1
  solve(num, ans)
  ans
end

def solve(num, ans)
  if ans[num] == -1
    ans[num] = solve(num - 1, ans) + solve(num - 2, ans)
  end
  ans[num]
end

def fib1(num)
  if num < 2
    return num
  else
    return fib1(num - 1) + fib1(num - 2)
  end
end

def fib2(num)
  return num if num < 2
  ans = 0
  a = 0
  b = 1
  (2..num).each do
    ans = a + b
    a = b
    b = ans
  end
  ans
end

