data = File.foreach("out.txt").map do |line|
   line.split(/\s+/)
end

ms_call_index = data[1].index("ms/call")
calls_index   = data[1].index("calls")
name_index    = data[1].index("name")

sorted = data[2..-1].sort_by { |e| 
  Float(e[-2]) * Float(e[-4]) }
sorted.reverse.first(25).each do |e|
  puts "#{e[-1]} #{e[-2]} (x#{e[-4]})"
end
