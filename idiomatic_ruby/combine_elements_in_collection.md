## Combine operation in collections (enumerables)

Given the following collection:

```ruby
values = [1, 2, 3, 4]
```

### Combine elements with **reduce**

An operation such as:

```ruby
product = 1
values.each { |value| product *= value }
product
# => 24
```

Can be simplified with `reduce` method:

```ruby
values.reduce(:*)
# => 24
```

### Combine elements with **inject**

An operation such as:
```ruby
hash = {}
values.each do |value|
  hash.merge!(value => value ** 2)
end
hash
# => { 1 => 1, 2 => 4, 3 => 9, 4 => 16 }
```

Can be simplified with `inject` method:

```ruby
values.inject({}) do |hash, value|
  hash.merge(value => value ** 2)
end
# => { 1 => 1, 2 => 4, 3 => 9, 4 => 16 }
```

Or with the `each_with_object` method:

```ruby
values.each_with_object({}) do |value, hash|
  hash[value] = value ** 2
end
# => { 1 => 1, 2 => 4, 3 => 9, 4 => 16 }
```
