require "report_unoptimized"
require "report_optimized"
require "report_line_processor"

require "benchmark"
require "csv"

Benchmark.bmbm do |x|
  
  x.report("inject based to_html") do
    csv_data = CSV.read("report_data.csv")
    r1 = ReportUnoptimized.new(csv_data)
    r1.to_html
  end

  x.report("each_with_object based to_html") do
    csv_data = CSV.read("report_data.csv")
    r2 = ReportOptimized.new(csv_data)
    r2.to_html
  end

  x.report("line processor") do
    r3 = ReportLineProcessor.new("report_data.csv")
    r3.to_html
  end


end
