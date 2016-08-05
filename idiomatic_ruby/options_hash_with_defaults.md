## Options Hash with defaults

Merge two hashes to get an overwritten version in favor of the second one.

```ruby
def create_user(options = {})
  user_options = { name: 'user', avatar: 'default.png'}.merge!(options)
end

p create_user
#=> { name: 'user', avatar: 'default.png'}

p create_user name: 'Adam'
#=> { name: 'Adam', avatar: 'default.png'}

p create_user name: 'Salma', avatar: 'special.png'
#=> { name: 'Salma', avatar: 'special.png'}
```

Note that ``merge!`` alters its receiver (original hash), while ``merge`` returns a new hash.