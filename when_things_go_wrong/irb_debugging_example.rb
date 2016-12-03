require "irb_debugger"

class Divider
  def initialize(x,y)
    @x, @y = x, y
  end

  def divide
    @x / @y
  rescue StandardError => e
    puts "Encountered an #{e.class.name}, firing up irb"
    run_irb(binding)
    puts "Trying your fix..."
    divide
  end
end

d = Divider.new(4,0)
puts "Returns: #{d.divide}"
