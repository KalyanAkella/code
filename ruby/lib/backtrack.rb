
def permute(prefix, suffix)
  if suffix.empty?
    p prefix
  else
    (0...suffix.length).each do |i|
      remaining = suffix[0...i] + suffix[(i+1)...suffix.length]
      permute(prefix + suffix[i], remaining)
    end
  end
end

def subsets(prefix, suffix)
  if suffix.empty?
    p prefix
  else
    subsets(prefix + suffix[0], suffix[1...suffix.length])
    subsets(prefix, suffix[1...suffix.length])
  end
end

def find_word(prefix, suffix, dict)
  if suffix.empty?
    return dict.has_key?(prefix) ? prefix : ""
  else
    (0...suffix.length).each do |i|
      remaining = suffix[0...i] + suffix[(i+1)...suffix.length]
      found = find_word(prefix + suffix[i], remaining, dict)
      return found unless found.empty?
    end
  end
  ""
end

