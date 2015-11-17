
Node = Struct.new(:label, :childs)

def insert(node, word)
  if word.length == 0
    node.childs["$"] = Node.new("$", {})
  elsif node.childs.has_key?(word[0])
    insert(node.childs[word[0]], word[1...word.length])
  else
    curr_node = node
    word.each_char do |c|
      t = Node.new(c, {})
      curr_node.childs[c] = t
      curr_node = t
    end
    curr_node.childs["$"] = Node.new("$", {})
  end
end

def list(node)
  return [] if node.label == '$'
  ans = []
  node.childs.each_value do |child_node|
    child_words = list(child_node)
    if child_words.empty?
      ans << node.label
    else
      ans << child_words.map { |word| word.prepend(node.label) }
    end
  end
  ans.flatten
end

