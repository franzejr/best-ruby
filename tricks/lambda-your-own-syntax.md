### Lambda your own syntax

```ruby
# encoding UTF-8

module Kernel
  alias_method :λ, :lambda
end

l = λ { p :called }
l.call

# Result:
# :called

```

[View Source](source_code/lambda_your_own_syntax.rb)

