class Rank
  Tuple = Struct.new(:user_id, :value)

  def initialize
    @heap = []
    @user_vals = {}
  end

  def left(i)
    1 + (i << 1)
  end

  def right(i)
    2 + (i << 1)
  end

  def max_heapify(i)
    l = left(i)
    r = right(i)
    if l < @heap.length and @heap[l][:value] > @heap[i][:value]
      largest = l
    else
      largest = i
    end
    if r < @heap.length and @heap[r][:value] > @heap[largest][:value]
      largest = r
    end
    if largest != i
      @user_vals[@heap[i][:user_id]] = largest
      @user_vals[@heap[largest][:user_id]] = i
      @heap[i], @heap[largest] = @heap[largest], @heap[i]
      max_heapify(largest)
    end
  end

  def build_max_heap
    non_leaf_begin_index = (@heap.length / 2.0).floor - 1
    non_leaf_begin_index.downto(0) do |i|
      max_heapify(i)
    end
  end

  def insert(uid, value)
    @user_vals[uid]
  end
end

