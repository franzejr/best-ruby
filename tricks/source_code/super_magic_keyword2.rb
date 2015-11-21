class Parent
  def show_args(*args, &block)
    p [*args, block]
  end
end

class Child < Parent
  def show_args(a,b,c)
    super
  end
end

#Everything goes up, including the block
Child.new.show_args(:a, :b, :c) { :block }

# Result:
# [:a, :b, :c, #<Proc:0x007fbf7a0486e8@super_magic_keyword2.rb:14>]
