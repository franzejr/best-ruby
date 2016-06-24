## Implicit return

Every block in ruby will return the value of the last line automatically, so it's common to not use the `return` keyword in favor of minimal code (specially if the method fits in one line):

```ruby
def extract_user_ids(users)
  users.map(&:id)
end

# is the same as

def extract_user_ids(users)
  return users.map(&:id)
end
```

Although it may cause some confusion in bigger methods, some people tend to not use the return keyword explicitly.

In the following example the explicit return is misleading because even though the return is inside a map block, it is actually stopping the entire method.

```ruby
def odd_or_even(numbers)
  numbers.map do |number|
    "odd" if number.odd?
    "even" if number.even?
  end
end

odd_or_even([1,2,4,3])
# returns ["odd", "even", "even", "odd"]

def odd_or_even(numbers)
  numbers.map do |number|
    return "odd" if number.odd?
    return "even" if number.even?
  end
end

odd_or_even([1,2,4,3])
# returns "odd"
```

Using return explicitly can also lead to errors if used inside Procs. The LocalJumpError exception is raised when Ruby can’t yield, like in the following example:

```ruby
yelling = Proc.new do |message|
  return message.upcase
end

calming = Proc.new do |message|
  message.downcase
end

def tell(message, manner)
  manner.call(message)
end

tell("hey", yelling)
# will throw LocalJumpError

tell("HELLO!", calming)
# will return "hello!"

```
In this case it is better to let the language handle the flow of calls and not use the `return` keyword.

More discussions about return in ruby:

http://stackoverflow.com/questions/1023146/is-it-good-style-to-explicitly-return-in-ruby
http://stackoverflow.com/questions/15187287/ruby-block-statements-and-implicit-returns
http://stackoverflow.com/questions/8162831/ruby-lambda-vs-proc-localjumperror

