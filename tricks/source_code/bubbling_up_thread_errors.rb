Thread.abort_on_exception = true

Thread.new do
  fail 'Ops, we cannot continue'
end

loop do
  sleep
end

# Result:
# ./bubbling_up_thread_errors.rb:4:in `block in <main>': Ops, we cannot continue (RuntimeError)
