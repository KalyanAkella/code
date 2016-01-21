
require 'trie'

describe do
  it "should list the words in trie from any given node" do
    root = Node.new("", {})
    insert(root, "hell")
    insert(root, "hello")
    insert(root, "helios")
    insert(root, "how")
    insert(root, "hey")

    expect(list(root)).to contain_exactly("hell", "hello", "helios", "how", "hey")
    expect(list(root.childs["h"].childs["e"])).to contain_exactly("ell", "ello", "elios", "ey")
  end
end

