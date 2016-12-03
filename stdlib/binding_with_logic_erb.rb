require "erb"

class A
  
  def initialize(x)
    @x = x
  end
  
  attr_reader :x

  public :binding

  def eval_template(string)
    ERB.new(string,0,'<>').result(binding)
  end
    
end

template = <<-EOS
<% if x == 42 %>
You have stumbled across the Answer to the Life, the Universe, and Everything
<% else %>
The value of x is <%= x %>
<% end %>
EOS

foo = A.new(10)
bar = A.new(21)
baz = A.new(42)

[foo, bar, baz].each { |e| puts e.eval_template(template) }
