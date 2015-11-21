### Shortcut variable interpolation

```ruby
@instance = :instance
@@class = :class
$global = :global

p "#@instance, #@@class, and #$global variables don't need braces"

# Result:
# "instance, class, and global variables don't need braces"

```

[View Source](source_code/shortcut_variable_interpolation.rb)

