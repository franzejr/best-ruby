## Use Fixnum#times

**Rather than**
```ruby
for i in 1..10
  puts "My iteration #{i}"
end
```

**Use**
```ruby
10.times do |i|
  puts "My iteration #{i + 1}"
end
```
