
require 'dp_lcs'

RSpec.describe do
  it "should return the length of the longest common subsequence" do
    x = ["A", "B", "C", "B", "D", "A", "B"]
    y = ["B", "D", "C", "A", "B", "A"]

    count_arr = lcs_length(x, y)
    expect(count_arr[x.length][y.length]).to eq(4)
  end

  it "should return the longest common subsequence" do
    x = ["A", "B", "C", "B", "D", "A", "B"]
    y = ["B", "D", "C", "A", "B", "A"]

    expect(lcs(x, y)).to eq("BDAB")
  end
end

