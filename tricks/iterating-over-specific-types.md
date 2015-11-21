### Iterating over specific types

```ruby
ObjectSpace.each_object(String) do |object|
  p object
end

# Result:
# "block in dependent_specs"
# "block in dependent_specs"
# "block (3 levels) in dependent_gems"
# "block (3 levels) in dependent_gems"
# ... (huge output suppressed)
# "This rdoc is bundled with Ruby"

```

[View Source](source_code/iterating_over_specific_types.rb)

