## Use Symbol to_proc

The ``&`` calls ``to_proc``on the object, and passes it as a block to the method.
The following calls are equivalent:

```ruby
%w(jonh mary michael).map { |x| x.upcase }
#=> ["JONH", "MARY", "MICHAEL"]

%w(jonh mary michael).map(&:upcase)
#=> ["JONH", "MARY", "MICHAEL"]
```
