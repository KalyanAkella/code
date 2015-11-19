
class Node
  attr_reader :left, :right, :visited, :label
  attr_accessor :parent

  def initialize(label)
    @label = label
    @visited = false
  end

  def left=(left_child)
    @left = left_child
    left_child.parent = self
  end

  def right=(right_child)
    @right = right_child
    right_child.parent = self
  end

  def left?
    not left.nil?
  end

  def right?
    not right.nil?
  end

  def root?
    parent.nil?
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

  def preorder(&walker)
    if walker
      walker.call(self)
    else
      p self.label
    end
    self.left.preorder(&walker) if self.left?
    self.right.preorder(&walker) if self.right?
  end

  def postorder(&walker)
    self.left.postorder(&walker) if self.left?
    self.right.postorder(&walker) if self.right?
    if walker
      walker.call(self)
    else
      p self.label
    end
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

  def search(key)
    x = self
    while x != nil and x.label != key
      if key < x.label
        x = self.left
      else
        x = self.right
      end
    end
    return x
  end

  def insert(label)
    new_node = Node.new(label)
    y = nil
    x = self
    while x != nil
      y = x
      if label < x.label
        x = x.left
      else
        x = x.right
      end
    end
    if label < y.label
      y.left = new_node
    else
      y.right = new_node
    end
  end

  def minimum
    x = self
    while x.left?
      x = x.left
    end
    return x
  end

  def maximum
    x = self
    while x.right?
      x = x.right
    end
    return x
  end

  def successor
    if self.right?
      return self.right.minimum
    else
      x = self
      y = x.parent
      while y != nil and x == y.right
        x = y
        y = y.parent
      end
      return y
    end
  end

  def predecessor
    if self.left?
      return self.left.maximum
    else
      x = self
      y = x.parent
      while y != nil and x == y.left
        x = y
        y = y.parent
      end
      return y
    end
  end

  def delete
    z = self
    if z.left? and z.right?
      y = z.successor
    else
      y = z
    end
    if y.left?
      x = y.left
    else
      x = y.right
    end
    if not x.nil?
      x.parent = y.parent
    end
    if not y.parent.nil?
      if y == y.parent.left
        y.parent.left = x
      else
        y.parent.right = x
      end
    end
    if y != z
      z.label = y.label
    end
    return y
  end
end

############################################
# A Binary Search Tree
############################################
N_15 = Node.new(15)
N_13 = Node.new(13)
N_17 = Node.new(17)
N_18 = Node.new(18)
N_20 = Node.new(20)
N_6 = Node.new(6)
N_7 = Node.new(7)
N_3 = Node.new(3)
N_2 = Node.new(2)
N_4 = Node.new(4)
N_9 = Node.new(9)

N_15.left = N_6
N_15.right = N_18

N_18.left = N_17
N_18.right = N_20

N_6.left = N_3
N_6.right = N_7

N_3.left = N_2
N_3.right = N_4

N_7.right = N_13

N_13.left = N_9

