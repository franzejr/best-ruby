## Conditionals when object is nil

**Before:**

```ruby
event.end_date.nil? ? '' : event.end_date.to_s(:long)
```

**After:**

```ruby
event.end_date.try(:to_s, :long)
```

**Or (2.3+):**

```ruby
event.end_date&.to_s&.long
```
[About &. operator](http://mitrev.net/ruby/2015/11/13/the-operator-in-ruby/)

**Remembering:** [try](http://apidock.com/rails/Object/try) is a Rails method and it's not in Ruby Core.

The documentation for try says:

> Invokes the method identified by the symbol method, passing it any arguments and/or the block specified, just like Ruby.
> Object#send. Unlike that method, nil will be returned if the receiving object is a nil object or NilClass.

It’s usually worth spending time identifying why you have to do this at all. If you can remove the scenario where the object is nil, that’s preferable.

From: https://robots.thoughtbot.com/code-review-ruby-and-rails-idioms
