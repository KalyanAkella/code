
BLACK = 0
RED = 1

Node = Struct.new(:key, :left, :right, :color, :parent)

$nil = Node.new(nil, nil, nil, BLACK, nil)

$root = $nil

def insert(key)
  z = Node.new(key, $nil, $nil, RED, $nil)
  y = $nil
  x = $root
  while x != $nil
    y = x
    if key < x.key
      x = x.left
    else
      x = x.right
    end
  end

  if y == $nil
    $root = z
  else
    z.parent = y
    if key < y.key
      y.left = z
    else
      y.right = z
    end
  end
  fix(z)
end

def fix(z)
end

