class Grouping

  def initialize(values, by)
    @data = Hash.new { |h,k| h[k] = [] }
     values.each do |record|
       @data[record[by]] << record
     end
  end

  attr_reader :data

  def [](value)
    @data[value]
  end

end

records = [ { name: 'Gregory', payment: 10 },
            { name: 'Rudolph', payment: 27 },
            { name: 'Gregory', payment: 25 },
            { name: 'Gregory', payment: 35 },
            { name: 'Rudolph', payment: 16 } ]

grouping = Grouping.new(records, :name)
p grouping['Gregory'].map { |e| e[:payment] } #=> [10, 25, 35]
p grouping['Rudolph'].map { |e| e[:payment] } #=> [27, 16]
