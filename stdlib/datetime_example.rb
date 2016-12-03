require "date"

module OpenHours
  def open_at?(datetime)
    time_ranges.any? do |t|
      datetime.between?(*range(datetime, t))
    end
  end

  def open_between?(start, finish)
    time_ranges.any? do |t|
      start.between?(*range(start, t)) && finish.between?(*range(finish, t))
    end
  end

  protected

  def range(date, t)
    start_time = time(date, t.start_hour, t.start_minutes)
    end_time   = time(date, t.end_hour, t.end_minutes)
    [start_time, end_time]
  end

  def time(date, hours, mins)
    DateTime.civil(date.year, date.month, date.day, hours, mins)
  end
end


TimeRange = Struct.new(:start_hour, :start_minutes, :end_hour, :end_minutes)

class Business
  include OpenHours

  def initialize
    @time_ranges = []
  end

  attr_accessor :time_ranges
end

b = Business.new
b.time_ranges << TimeRange.new(9, 30, 12, 30)
b.time_ranges << TimeRange.new(13, 0, 17, 0)

b.open_at?(DateTime.parse("2008-12-08 9:45"))  # => true
b.open_at?(DateTime.parse("2008-12-08 12:45")) # => false

b.open_between?(DateTime.parse("2008-12-08 13:00"), 
                DateTime.parse("2008-12-08 16:00")) #=> true

b.open_between?(DateTime.parse("2008-12-08 12:45"), 
                DateTime.parse("2008-12-08 1:15"))  #=> false
