GC::Profiler.enable

10.times do
  array = Array.new(1_000_000) { |i| i.to_s }
end

puts GC::Profiler.result
