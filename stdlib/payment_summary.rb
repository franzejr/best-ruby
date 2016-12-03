
require "csv"

@totals = Hash.new(0)

csv_options = {:headers => true, :converters => :all }

CSV.foreach("payments.csv", csv_options) do |row|
  @totals[row['name']] += row['payment']
end

CSV.open("payment_summary.csv", "w") do |csv|
  csv << ["name","total payments"]
  @totals.each { |row| csv << row }
end
