
# Representation of a graph as a 2D matrix of 0s and 1s.
# For any cell <i,j>, a value of 1 represents the presence of an edge
# between nodes i and j or a 0 otherwise. Better for dense graphs.

module Color
  BLACK = 1
  GRAY = 2
  WHITE = 3
end

class Graph
  attr_reader :vertex_count, :matrix

  def initialize(vertex_count)
    @vertex_count = vertex_count
    @matrix = Array.new(vertex_count) { Array.new(vertex_count, 0) }
  end

  def edge(from, to)
    @matrix[from][to] = 1
    self
  end

  def adjacent_vertices(src)
    return [] if src >= vertex_count
    result = []
    @matrix[src].each_with_index do |e, i|
      result << i if e == 1
    end
    result
  end

  def bfs(src)
    color = Array.new(vertex_count, Color::WHITE)
    distance = Array.new(vertex_count, -1)
    parent = Array.new(vertex_count)
    color[src] = Color::GRAY
    distance[src] = 0
    queue = [src]
    while not queue.empty?
      node = queue.pop
      adjacent_vertices(node).each do |vertex|
        if color[vertex] == Color::WHITE
          color[vertex] = Color::GRAY
          distance[vertex] = distance[node] + 1
          parent[vertex] = node
          queue.unshift(vertex)
        end
      end
      color[node] = Color::BLACK
    end
    [parent, distance]
  end

  def dfs
  end
end

