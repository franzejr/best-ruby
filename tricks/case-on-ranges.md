### Case on ranges

```ruby
age = rand(1..100)
p age

case age
  when -Float::INFINITY..20
    p 'You are too young'
  when 21..64
    p 'You are at the right age'
  when 65..Float::INFINITY
    p 'You are too old'
end

# Result:
# 55
# "You are at the right age"

```

[View Source](source_code/case_on_ranges.rb)

