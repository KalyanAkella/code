
# Dynamic Programming based solution for the assemble line scheduling problem
# a[i,j] : station processing time on line i at station j
# t[i,j] : transit time between line i at station j to line (i+1)%2 at station j+1
# e[i] : entry time into line i
# x[i] : exit time from line i
# n : number of stations in a line. All lines have equal number of stations.

def fastest_way(a, t, e, x, n)
  f = [Array.new(n), Array.new(n)]
  f[0][0] = e[0] + a[0][0]
  f[1][0] = e[1] + a[1][0]
  (1...n).each do |j|
    f[0][j] = [f[0][j-1], f[1][j-1] + t[1][j-1]].min + a[0][j]
    f[1][j] = [f[1][j-1], f[0][j-1] + t[0][j-1]].min + a[1][j]
  end
  p f
  [f[0][n-1] + x[0], f[1][n-1] + x[1]].min
end

