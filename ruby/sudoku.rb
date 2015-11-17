
# [[3,0,6,5,0,8,4,0,0],[5,2,0,0,0,0,0,0,0],[0,8,7,0,0,0,0,3,1],[0,0,3,0,1,0,0,8,0],[9,0,0,8,6,3,0,0,5],[0,5,0,0,9,0,6,0,0],[1,3,0,0,0,0,2,5,0],[0,0,0,0,0,0,0,7,4],[0,0,5,2,0,6,3,0,0]]

def findUnAssignedCell(board)
  (0...9).each do |i|
    (0...9).each do |j|
      return [i,j] if board[i][j] == 0
    end
  end
  []
end

def valid(board, row, col)
  n = board[row][col]
  check = false
  
  (0...9).each do |i|
    next if i == row
    check = true if board[i][col] == n
  end
  return false if check
  
  (0...9).each do |i|
    next if i == col
    check = true if board[row][i] == n
  end
  return false if check

  boxRow = row - row % 3
  boxCol = col - col % 3
  (0...3).each do |i|
    next if boxRow + i == row
    (0...3).each do |j|
      next if boxRow + j == col
      check = true if board[boxRow + i][boxCol + j] == n
    end
  end
  return false if check

  return true
end

def solve(board)
  row, col = findUnAssignedCell(board)
  return true if row == nil or col == nil

  (1..9).each do |n|
    board[row][col] = n
    if valid(board, row, col)
      return true if solve(board)
    end
    board[row][col] = 0
  end
  return false
end

