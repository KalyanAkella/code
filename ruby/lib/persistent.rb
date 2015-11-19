
# Note: This ia a basic impl. of persistent binary search tree
# which may not be balanced and hence can result in worst case
# time complexity of O(n) for search and insert/delete operations.

Node = Struct.new :key, :left, :right

$roots = []

def insert_all(keys)
  keys.each do |key|
    node = Node.new(key)
    if $roots.empty?
      $roots << node
    else
      x = $roots.last
      y = nil
      while x != nil
        y = x
        if key < x.key
          x = x.left
        else
          x = x.right
        end
      end

      if key < y.key
        y.left = node
      else
        y.right = node
      end
    end
  end
end

def insert(key)
  node = Node.new(key)
  if $roots.empty?
    $roots << node
  else
    x = $roots.last
    nx = Node.new(x.key)
    $roots << nx
    while x != nil
      if key < x.key
        nx.right = x.right
        x = x.left
        if x != nil
          nx.left = Node.new(x.key)
          nx = nx.left
        end
      else
        nx.left = x.left
        x = x.right
        if x != nil
          nx.right = Node.new(x.key)
          nx = nx.right
        end
      end
    end

    if key < nx.key
      nx.left = node
    else
      nx.right = node
    end
  end
end

