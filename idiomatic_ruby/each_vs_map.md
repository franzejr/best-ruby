## Each vs map

Let the following each:

```ruby
users_ids = []
users.each { |user| users_ids << user.id }
```

It can be simplified to:

```ruby
users_ids = users.map { |user| user.id }
```

or even:

```ruby
users_ids = users.map &:id
```