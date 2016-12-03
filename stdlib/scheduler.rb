require "date"

class Scheduler

  def initialize
    @events = []
  end

  def event(from, to, message)
   @events << [DateTime.parse(from) .. DateTime.parse(to),  message] 
  end

  def display_events_at(datetime)
    datetime = DateTime.parse(datetime)
    puts "Events occuring around #{datetime.strftime("%H:%M on %m/%d/%Y")}"
    puts "--------------------------------------------"
    events_at(datetime).each do |range, message|
      puts "#{time_abbrev(range.first)} - #{time_abbrev(range.last)}: #{message}"
    end
  end

  private

  def time_abbrev(datetime)
    datetime.strftime("%H:%M (%m/%d)")
  end

  def events_at(datetime)
    @events.each_with_object([]) do |event, matched|
      matched << event if event.first.cover?(datetime)
    end
  end

end


sched = Scheduler.new
sched.event "2009.02.04 10:00", "2009.02.04 11:30", "Eat Snow"
sched.event "2009.02.03 14:00", "2009.02.04 14:00", "Wear Special Suit"
sched.display_events_at '2009.02.04 10:20'
