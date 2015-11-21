### Super magic keyword3

```ruby
class Parent
  def show_args(*args, &block)
    p [*args, block]
  end
end

class Child < Parent
  def show_args(a,b,c)
    # Call super without any params
    # making args an empty array []
    super()
  end
end

#Nothing goes up
Child.new.show_args(:a, :b, :c)

# Result:
# [nil]

```

[View Source](source_code/super_magic_keyword3.rb)

