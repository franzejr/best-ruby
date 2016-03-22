### How to add uniq value to array

```ruby
array = [1, 2, 3]
```

#### bad
```ruby
array << 2
array << 4

# Result:
# [1, 2, 3, 2, 4]

p array.uniq

# Result:
# [1, 2, 3, 4]

```

#### good (but need refactor)

```ruby
array = array | [2]
array = array | [4]

p array

# Result:
# [1, 2, 3, 4]
```

#### good

```ruby
array |= [2, 4]

p array

# Result:
# [1, 2, 3, 4]
```

[View Source](source_code/add_uniq_value_to_array.rb)
