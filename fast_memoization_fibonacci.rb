fibonacci = Hash.new{ |numbers,index|
  numbers[index] = fibonacci[index - 2] + fibonacci[index - 1]
}.update(0 => 0, 1 => 1)


p fibonacci[300]
