### Enable garbage collector profiler

```ruby
GC::Profiler.enable

10.times do
  array = Array.new(1_000_000) { |i| i.to_s }
end

puts GC::Profiler.result

```

[View Source](source_code/enable_garbage_collector_profiler.rb)

