class Parent
  def show_args(*args, &block)
    p [*args, block]
  end
end

class Child < Parent
  def show_args(a,b,c)
    # modify super by passing nothing
    # calling super with a nil proc,
    # which is basically calling super()
    super(&nil)
  end
end

#Nothing goes up, neither the block
Child.new.show_args(:a, :b, :c) { :block }

# Result:
# [nil]
