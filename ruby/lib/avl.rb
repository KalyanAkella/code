
Node = Struct.new(:key, :height, :parent, :left, :right)

$root = nil

def search(key)
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
  y
end

def insert_all(keys)
  keys.each do |key|
    insert(key)
  end
end

def insert(key)
  node = Node.new(key, 0)
  if $root == nil
    $root = node
  else
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
    node.parent = y
    if key < y.key
      y.left = node
    else
      y.right = node
    end
  end

  x = node
  while x != nil
    x.height = height(x)
    x = x.parent
  end
end

def height(x)
  if not x.left.nil? and not x.right.nil?
    [x.left.height, x.right.height].max + 1
  elsif not x.left.nil?
    x.left.height + 1
  elsif not x.right.nil?
    x.right.height + 1
  else
    0
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
  
  x.left.height = height(x.left) unless x.left.nil?
  x.right.height = height(x.right) unless x.right.nil?
  y.left.height = height(y.left) unless y.left.nil?
  y.right.height = height(y.right) unless y.right.nil?
  x.height = height(x)
  y.height = height(y)
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

  x.left.height = height(x.left) unless x.left.nil?
  x.right.height = height(x.right) unless x.right.nil?
  y.left.height = height(y.left) unless y.left.nil?
  y.right.height = height(y.right) unless y.right.nil?
  x.height = height(x)
  y.height = height(y)
end

