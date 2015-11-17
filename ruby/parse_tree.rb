
# emp_id, emp_name, emp_dept, emp_age
# select emp_id,emp_name where emp_id>5 and emp_name='robert'
# select emp_age where (emp_name='robert' and emp_id=5) and (emp_id=32) or (emp_id=32)

require 'set'

def scan_identifiers(input)
  $idents = input.split(",").map(&:strip).to_set
end

def process(stmt)
  tokens = stmt.split
  parse(tokens, 0)
end

def parse(tokens, index)
  index = expectSelectExpr(tokens, index)
  index = expectWhereExpr(tokens, index)
end

def expectWhereExpr(tokens, index)
  index = expectKeyword("where", tokens, index)
end

def expectSelectExpr(tokens, index)
  index = expectKeyword("select", tokens, index)
  index = expectColumnList(tokens, index)
end

def expectKeyword(keyword, tokens, index)
  return index + 1 if keyword.downcase == tokens[index].downcase
  raise "Expected #{keyword} to be present"
end

def expectColumnList(tokens, index)
  columnList = tokens[index].split(",")
  return index + 1 if columnList.all? { |column| $idents.include? column }
  raise "Invalid columns present: #{columnList.find_all { |column| not $idents.include? column }}"
end

