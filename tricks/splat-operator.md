### Splat operator

```ruby
# Splat Operator (*) 

# When calling methods

arguments = [1, 2, 3, 4]
my_method(*arguments) # any number of arguments

# or:

arguments = [2, 3, 4]
my_method(1, *arguments) # any number of trailing arguments

# or:

arguments = [1, 2]
my_method(*arguments, 3, 4) # any number of preceding arguments

# or:

arguments = [2, 3]
my_method(1, *arguments, 4) # any number of "in between" arguments

# All are equivalent to:

my_method(1, 2, 3, 4)

# Two splats (**) convert a hash into an arbitary number of keyword arguments
# This operator doesn't technically have a name

arguments = { first: 1, second: 2, third: 3 }
my_method(**arguments)

# or:

arguments = { first: 1, second: 2 }
my_method(third: 3, **arguments)

# Are equivalent to:

my_method(first:1, second:2, third:3)

```

[View Source](source_code/splat_operator.rb)

