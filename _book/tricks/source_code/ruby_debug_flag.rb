def var
  @var || 40
end

if $DEBUG
  p "var is %p" % var
end

p var + 2

# Result:
# ruby_debug_flag.rb:2: warning: instance variable @var not initialized
# "var is 40"
# ruby_debug_flag.rb:2: warning: instance variable @var not initialized
# 42
