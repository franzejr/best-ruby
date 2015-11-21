### Associative arrays

```ruby
aa = [ %w[Someone 1],
      %w[Bla 2]]

p aa.assoc("Someone")
p aa.assoc("Bla")

# Result:
# ["Someone", "1"]
# ["Bla", "2"]

p aa.rassoc("1")
p aa.rassoc("2")

# Result:
# ["Someone", "1"]
# ["Bla", "2"]

```

[View Source](source_code/associative_arrays.rb)

