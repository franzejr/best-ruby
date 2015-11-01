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
# [:a, :b, :c, #<Proc:0x007f9bd288bfb0@./super_magic_key_word2.rb:14>]
