require "csv"

class ReportLineProcessor

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
