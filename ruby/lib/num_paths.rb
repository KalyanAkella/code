
$path_count = 0

def invalid?(arr, s, d)
  arr[s[0]][s[1]] == 0 or arr[d[0]][d[1]] == 0
end

def valid_cells(arr, s)
  row, col = s
  result = []
  if row >= 1 and arr[row - 1][col] == 1
    result << [row - 1, col]
  end
  if (col + 1) < arr.length and arr[row][col + 1] == 1
    result << [row, col + 1]
  end
  result
end

# paths([[0, 1, 1, 1], [0, 1, 1, 0], [0, 1, 1, 0], [1, 1, 1, 0]], [3, 0], [0, 3])
def paths(arr, s, d)
  if invalid?(arr, s, d)
    return
  end

  if s == d
    $path_count = $path_count + 1
    return
  end

  cells = valid_cells(arr, s)
  cells.each do |cell|
    paths(arr, cell, d)
  end
end

