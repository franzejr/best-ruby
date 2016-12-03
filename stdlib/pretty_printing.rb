require "pp"

class Person
  def initialize(first_name, last_name, friends)
    @first_name, @last_name, @friends = first_name, last_name, friends
  end

  def pretty_print(printer)
    printer.text "Person <#{object_id}>:\n" <<
                 "  Name: #@first_name #@last_name\n  Friends:\n" 
    @friends.each do |f|
      printer.text "    #{f[:first_name]} #{f[:last_name]}\n"
    end
  end

  alias_method :inspect, :pretty_print_inspect

end

friends = [ { first_name: "Emily", last_name: "Laskin" },
            { first_name: "Nick",  last_name: "Mauro" },
            { first_name: "Mark",  last_name: "Maxwell" } ]

p Person.new("Gregory", "Brown", friends).pretty_print_inspect
