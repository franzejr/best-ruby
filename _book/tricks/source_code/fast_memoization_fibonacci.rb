fibonacci = Hash.new{ |numbers,index|
  numbers[index] = fibonacci[index - 2] + fibonacci[index - 1]
}.update(0 => 0, 1 => 1)


p fibonacci[300]

# Result:
# 222232244629420445529739893461909967206666939096499764990979600
