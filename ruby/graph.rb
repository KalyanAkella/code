module Color
  BLACK = 1
  GRAY = 2
  WHITE = 3
end

class Node
  attr_accessor :color, :parent, :distance, :discovered_at, :finished_at
  attr_reader :key, :adjacent_nodes

  def initialize(key)
    @key = key
    @adjacent_nodes = []
  end

  def <<(node)
    @adjacent_nodes << node
    self
  end
end

def bfs(node)
  VERTS.each do |n|
    n.color = Color::WHITE
    n.distance = -1
    n.parent = nil
  end
  node.color = Color::GRAY
  node.distance = 0
  node.parent = nil
  queue = [node]
  while not queue.empty?
    curr_node = queue.pop
    curr_node.adjacent_nodes.each do |adj_node|
      if adj_node.color == Color::WHITE
        adj_node.color = Color::GRAY
        adj_node.distance = curr_node.distance + 1
        adj_node.parent = curr_node
        queue.unshift(adj_node)
      end
    end
    curr_node.color = Color::BLACK
  end
end

def dfs
  VERTS.each do |node|
    node.color = Color::WHITE
    node.parent = nil
  end
  VERTS.each do |node|
    if node.color == Color::WHITE
      dfs_visit(node)
    end
  end
end

def dfs_visit(node)
  node.color = Color::GRAY
  node.adjacent_nodes.each do |adj_node|
    if adj_node.color == Color::WHITE
      adj_node.parent = node
      dfs_visit(adj_node)
    end
  end
  node.color = Color::BLACK
end

VERTS = [
  R = Node.new('r'),
  S = Node.new('s'),
  T = Node.new('t'),
  U = Node.new('u'),
  V = Node.new('v'),
  W = Node.new('w'),
  X = Node.new('x'),
  Y = Node.new('y')
]

R << S << V
S << R << W
T << W << X << U
U << T << X << Y
V << R
W << S << T << X
X << W << T << U << Y
Y << U << X

