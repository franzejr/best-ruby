## Each vs map

Let the following each:

```ruby
user_ids = []
users.each { |user| user_ids << user.id }
```

It can be simplified to:

```ruby
user_ids = users.map { |user| user.id }
```

or even:

```ruby
user_ids = users.map(&:id)
```
