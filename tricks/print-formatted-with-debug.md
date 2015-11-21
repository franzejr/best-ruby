### Print formatted with debug

```ruby
def debug(name, content)
  p "%s:  %p" % [name, content]
end

debug "Num", 42

# Result:
# "Num:  42"

```

[View Source](source_code/print_formatted_with_debug.rb)

