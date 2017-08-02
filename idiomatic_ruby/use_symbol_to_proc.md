## Use Symbol to_proc

The ``&`` calls ``to_proc``on the object, and passes it as a block to the method.
The following calls are equivalent:

```ruby
%w(john mary michael).map { |x| x.upcase }
#=> ["JOHN", "MARY", "MICHAEL"]

%w(john mary michael).map(&:upcase)
#=> ["JOHN", "MARY", "MICHAEL"]
```
