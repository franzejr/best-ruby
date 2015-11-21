var = :var
object = Object.new

object.define_singleton_method(:show_var_and_block) do |&block|
  p [var, block]
end

object.show_var_and_block { :block }

# Result:
# [:var, #<Proc:0x007ffd6c038128@./blocks_can_take_blocks.rb:8>]
