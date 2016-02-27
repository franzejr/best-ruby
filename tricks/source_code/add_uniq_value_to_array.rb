array = [1, 2, 3]

array << 2
array << 4

# Result:
# [1, 2, 3, 2, 4]

p array.uniq

# Result:
# [1, 2, 3, 4]

array = [1, 2, 3]

array = array | [2]
array = array | [4]

p array

# Result:
# [1, 2, 3, 4]

array = [1, 2, 3]

array |= [2, 4]

p array

# Result:
# [1, 2, 3, 4]
