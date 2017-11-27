### Integer#digits

```ruby
awesome_number = 12345

p awesome_number.to_s.chars.map(&:to_i).reverse

# Result:
# [5, 4, 3, 2, 1]

p awesome_number.digits

# Result:
# [5, 4, 3, 2, 1]
```

[View Source](source_code/digits.rb)
