
class String
  def anagrams_with?(str)
    s1 = self.downcase
    s2 = str.downcase
    a1 = Array.new(26, 0)
    a2 = Array.new(26, 0)
    s1.each_char do |c1|
      a1[c1.ord - 'a'.ord] += 1
    end
    s2.each_char do |c2|
      a2[c2.ord - 'a'.ord] += 1
    end
    a1 == a2
  end
end

