require 'irb'

def my_program_context
  @my_program_context ||= Struct.new(:value).new(40)
end

trap(:INT) do
  IRB.start
  trap(:INT, 'EXIT')
end

loop do
  p "Current value: #{my_program_context.value}"
  sleep 1
end

# Result:
# "Current value: 40"
# "Current value: 40"
