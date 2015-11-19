
class Node
  attr_accessor :left, :right, :visited
  attr_reader :label

  def initialize(label)
    @label = label
    @visited = false
  end

  def left?
    not left.nil?
  end

  def right?
    not right.nil?
  end

  def leaf?
    left.nil? and right.nil?
  end

  def inorder(&walker)
    self.left.inorder(&walker) if self.left?
    if walker
      walker.call(self)
    else
      p self.label
    end
    self.right.inorder(&walker) if self.right?
  end

  def clear_visited
    inorder { |node| node.visited = false }
  end

  def inorder_stack
    stk = [self]
    while not stk.empty?
      node = stk.pop
      if node.left? and !node.left.visited
        stk.push(node)
        stk.push(node.left)
      else
        p node.label
        node.visited = true
        if node.right?
          stk.push(node.right)
        end
      end
    end
  end

  def preorder
    p self.label
    self.left.preorder if self.left?
    self.right.preorder if self.right?
  end

  def postorder
    self.left.postorder if self.left?
    self.right.postorder if self.right?
    p self.label
  end

  def height
    left_height = self.left? ? self.left.height : -1
    right_height = self.right? ? self.right.height : -1
    [left_height, right_height].max + 1
  end

  def mirror(target)
    nodes = Array.new(2 ** (self.height + 1) - 1)
    fill_inorder(nodes, 0, nodes.length)
    i = nodes.index(target)
    i ? nodes[-(i + 1)] : nil
  end

  def fill_inorder(nodes, start_index, end_index)
    middle_index = (start_index + end_index) / 2
    self.left.fill_inorder(nodes, start_index, middle_index) if self.left?
    nodes[middle_index] = self.label
    self.right.fill_inorder(nodes, middle_index, end_index) if self.right?
  end
end

############################################
# One example tree
############################################
A = Node.new("A")
B = Node.new("B")
C = Node.new("C")
D = Node.new("D")
E = Node.new("E")
F = Node.new("F")
G = Node.new("G")
H = Node.new("H")
I = Node.new("I")

A.left = B
A.right = C

B.left = D

C.left = E
C.right = F

E.right = G

F.left = H
F.right = I
