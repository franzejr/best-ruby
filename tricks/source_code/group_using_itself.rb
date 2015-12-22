
## Using the Itself method in Ruby 2.2
## we can group elements from one array
## Reference: http://ruby-doc.org/core-2.2.0/Object.html#method-i-itself

[2, 3, 3, 1, 2, 3, 3, 1, 1, 2].group_by(&:itself)

# Result:
# {2=>[2, 2, 2], 3=>[3, 3, 3, 3], 1=>[1, 1, 1]}
