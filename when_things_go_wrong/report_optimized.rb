class ReportOptimized

  STATUS = { "A" => "Active", "I" => "Inactive", "S" => "Suspended" }

  def initialize(data)
    @data = data
    update_status
  end

  def update_status
    @data.each { |e| e[3] = STATUS[e[3]] }
  end

  def to_html
    @data.each_with_object("<table>\n") do |row, output|
      output << "  <tr><td>#{row.join("</td><td>")}</td></tr>\n"
    end << "</table>"
  end
end
