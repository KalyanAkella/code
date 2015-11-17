
def find(n1, n2)
  xor = n1 ^ n2
  result = []
  1.upto(100) do |i|
    1.upto(100) do |j|
      result << [i,j] if xor == (i ^ j)
    end
  end
  result
end

