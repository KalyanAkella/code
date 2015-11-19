
Node = Struct.new(:key, :priority, :left, :right, :parent)

$root = nil

def insert(key, priority)
  node = Node.new(key, priority)
  y = nil
  x = $root

  while x != nil
    y = x
    if key < x.key
      x = x.left
    else
      x = x.right
    end
  end

  if y == nil
    $root = node
  else
    node.parent = y
    if key < y.key
      y.left = node
    else
      y.right = node
    end
  end

  fix(node)
end

def fix(node)
  x = node.parent
  y = node

  while x != nil and x.priority > y.priority
    if y == x.left
      right_rotate(x)
    else
      left_rotate(x)
    end
    x = y.parent
  end
end

def left_rotate(x)
  y = x.right
  x.right = y.left
  y.left.parent = x unless y.left.nil?
  y.parent = x.parent
  if x.parent == nil
    $root = y
  else
    if x.parent.left == x
      x.parent.left = y
    else
      x.parent.right = y
    end
  end
  y.left = x
  x.parent = y
end 

def right_rotate(x)
  y = x.left
  x.left = y.right
  y.right.parent = x unless y.right.nil?
  y.parent = x.parent
  if x.parent == nil
    $root = y
  else
    if x.parent.left == x
      x.parent.left = y
    else
      x.parent.right = y
    end
  end
  y.right = x
  x.parent = y
end

