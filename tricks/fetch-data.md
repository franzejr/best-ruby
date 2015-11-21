### Fetch data

```ruby
params = {var: 42}

p params.fetch(:var)
p params.fetch(:missing, 42)
p params.fetch(:missing) { 40 + 2 }

params.fetch(:missing)


# Result:
# 42
# 42
# 42
# ./fetch_data.rb:7:in `fetch': key not found: :missing (KeyError)
# 	from ./fetch_data.rb:7:in `<main>'

```

[View Source](source_code/fetch_data.rb)

