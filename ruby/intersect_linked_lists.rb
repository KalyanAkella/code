
Node = Struct.new(:label, :next)

def intersection(l1, l2)
  visited_nodes = {}
  t = l1
  while t != nil
    visited_nodes[t.label] = nil
    t = t.next
  end
  intersects = []
  t = l2
  while t != nil
    intersects << t.label if visited_nodes.has_key?(t.label)
    t = t.next
  end
  intersects
end

# 6 -> 5 -> 4 -> 3
# 1 -> 2 -> 4 -> 3
n3 = Node.new(3, nil)
n4 = Node.new(4, n3)
n5 = Node.new(5, n4)
n6 = Node.new(6, n5)
n2 = Node.new(2, n4)
n1 = Node.new(1, n2)

l1 = n1
l2 = n6

p intersection(l1, l2)

