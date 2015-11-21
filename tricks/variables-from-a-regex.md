### Variables from a regex

```ruby
if  /\A(?<first>\w+),\s*(?<last>\w+)\z/ =~ "Franze, Jr"
  puts "#{first} #{last}"
end

# Result:
# Franze Jr

```

[View Source](source_code/variables_from_a_regex.rb)

