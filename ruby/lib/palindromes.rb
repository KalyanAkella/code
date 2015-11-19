
def palindrome?(str)
  first, last = 0, (str.length - 1)
  while first <= last
    return false if str[first] != str[last]
    first = first + 1
    last = last - 1
  end
  return true
end

def extract_palindromes(str)
  first, last = 0, (str.length - 1)

end
