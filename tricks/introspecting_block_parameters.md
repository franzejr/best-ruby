## Introspecting Block Parameters

Suppose you would like to iterate over a hash, get its elements and use those
in a block. One thing you can do is use `Proc#parameters` to help you.

For example:

```ruby
hash = {
  first_name: "John",
  last_name:  "Smith",
  age: 35,
  # ...
}

hash.using do |first_name, last_name|
  puts "Hello, #{first_name} #{last_name}."
end

# or even...

circle = {
  radius: 5,
  color: "blue",
  # ...
}

area = circle.using { |radius| Math::PI * radius**2 }
```

You can check how the implementation is really simple:

```ruby
class Hash
  module Using
    def using(&block)
      values = block.parameters.map do |(type, name)|
        self[name]
      end

      block.call(*values)
    end
  end

  include Using
end
```

From:

http://weblog.jamisbuck.org/2015/12/12/little-things-proc-parameters.html
