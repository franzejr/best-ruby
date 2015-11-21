ring = %w[one two three].cycle

p ring.take(5)

# Result:
# ["one", "two", "three", "one", "two"]
