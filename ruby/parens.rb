
# () -> 2
# ()( -> 2
# (()) -> 4
# ()()(( -> 4
# ((())() -> 4
def longest_valid(parens)
  stk = []
  i = 0
  max = -1
  count = 0
  while i < parens.length
    while i < parens.length and parens[i] == '('
      stk.push(parens[i])
      i += 1
    end
    count = 0
    while i < parens.length and parens[i] == ')'
      stk.pop
      count += 2
      i += 1
    end
    max = count if count > max
  end
  max
end

