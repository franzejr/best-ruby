require "csv"

class Report

  STATUS = { "A" => "Active", "I" => "Inactive", "S" => "Suspended" }

  def initialize(file)
    @file = file
  end

  def to_html
    output = "<table>\n"
    CSV.foreach(@file) do |row|
      row[-1] = STATUS[row[-1]]
      output << "  <tr><td>#{row.join("</td><td>")}</td></tr>\n"
    end
    output << "</table>"
  end

end

def track_time(message)
  puts message
  t = Time.now
  yield
  puts "Took #{Time.now - t}s"
end


track_time "CSV TO HTML" do
  @report = Report.new("report_data.csv")
  @report.to_html
end
