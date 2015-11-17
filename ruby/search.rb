
TrieNode = Struct.new(:label, :edges, :payload)

class Trie
  def initialize
    @rootNode = TrieNode.new('^', {}, [])
  end

  def insert(word, payload)
    currNode = @rootNode
    word.chars do |c|
      if currNode.edges.has_key?(c)
        currNode = currNode.edges[c]
      else
        newNode = TrieNode.new(c, {}, [])
        currNode.edges[c] = newNode
        currNode = newNode
      end
    end
    currNode.edges['$'] = TrieNode.new('$', {}, []) unless currNode.edges.has_key?('$')
    currNode.payload << payload
  end

  def search(word)
    currNode = @rootNode
    index = -1
    word.chars do |c|
      index += 1
      break unless currNode.edges.has_key?(c)
      currNode = currNode.edges[c]
    end
    results = []
    stk = [currNode]
    until stk.empty?
      node = stk.pop
      if node.edges.has_key?('$')
        results << node.payload
      end
      node.edges.each_pair do |k,v|
        stk.push(v) if k != '$'
      end
    end
    results.flatten
  end
end

$trie = Trie.new
def insertSong(song)
  song.split.each do |word|
    $trie.insert(word, song)
  end
end

def searchSongs(word)
  results = []
  word.split.each do |s|
    $trie.search(s)
  end
end

