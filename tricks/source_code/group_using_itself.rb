
## Using the Itself method http://ruby-doc.org/core-2.2.0/Object.html#method-i-itself
## we can group elements from one array

[2, 3, 3, 1, 2, 3, 3, 1, 1, 2].group_by(&:itself)

# Result:
# {2=>[2, 2, 2], 3=>[3, 3, 3, 3], 1=>[1, 1, 1]}
