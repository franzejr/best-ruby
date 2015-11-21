### Stab operator

```ruby
# Stab Operator - Lambdas in Ruby 1.9 or later.
# Y Combinator
# Ruby supports a syntax for lambdas known as the 'stab' operator.
# Rather than something like lambda { a < 5 },
# you can type -> { a < 5 }.
#
# Below is a version of the fibonacci sequence that can
# perform recursive calls without named functions.
#
# Improver function for fibonacci sequence
# Assumes that the 0th element of the sequence is 0,
# and the 1st element of the sequence is 1.
fib_improver = ->(partial) {
  ->(n) { n < 2 ? n : partial.(n-1) + partial.(n-2) }
}

# The y combinator
y = ->(f) {
  ->(x) { x.(x) }.(
    ->(x) { f.(->(v) { x.(x).(v)}) }
  )
}

# Using the stab operator and y combinator, we can
# write a fibonacci function with anonymous functions
# This solution is not memoized and so will be very slow.
fib = fib_improver.(y.(fib_improver))

p fib.(1)

p fib.(10)
# Notice that after loading, fib isn't defined anymore.

```

[View Source](source_code/stab_operator.rb)

