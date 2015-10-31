class Parent
  def show_args(*args, &block)
    p [*args, block]
  end
end

class Child < Parent
  def show_args(a,b,c)
    #modify super by passing nothing
    super()
  end
end

#Nothing goes up
Child.new.show_args(:a, :b, :c)
