### Head tail

```ruby
def my_reduce(array)
    head, *tail = array
    return (tail.empty? ? head : (head + my_reduce(tail)))
end

# triangular number example
n = 100
my_reduce((1..n).to_a) == (n*(n+1))/2 #=> True

```

[View Source](source_code/head_tail.rb)

