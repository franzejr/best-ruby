Thread.abort_on_exception = true

Thread.new do
  fail 'Ops, we cannot continue'
end

loop do
  sleep
end
