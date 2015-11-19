
# Dynamic Programming solution for the longest common subsequence problem (LCS)
# Inputs: X (of length m) and Y (of length n)
# Output: Compute the length of LCS for X and Y

def lcs_length(x, y)
  c = Array.new(x.length + 1) { Array.new(y.length + 1, 0) }
  (1..x.length).each do |i|
    (1..y.length).each do |j|
      if x[i] == y[j]
        c[i][j] = c[i-1][j-1] + 1
      else
        if c[i-1][j] >= c[i][j-1]
          c[i][j] = c[i-1][j]
        else
          c[i][j] = c[i][j-1]
        end
      end
    end
  end
  c
end

def lcs_str(x, y, c, i, j)
  if i == 0 or j == 0
    return ""
  else
    if c[i][j] == c[i-1][j-1] + 1
      return lcs_str(x, y, c, i-1, j-1) + x[i-1]
    elsif c[i][j] == c[i-1][j]
      return lcs_str(x, y, c, i-1, j)
    else
      return lcs_str(x, y, c, i, j-1)
    end
  end
end

def lcs(x, y)
  c = lcs_length(x, y)
  lcs_str(x, y, c, x.length, y.length)
end

