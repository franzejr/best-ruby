module FattyRBP
  class Formatter

    def self.formats
     @formats ||= {}
    end

     def self.format(name, options={}, &block)
       formats[name] = Class.new(FattyRBP::Format, &block)
     end

     def self.render(format, options={})
       formats[format].new(options).render
     end
   end

  class Format
    def initialize(options)
      # not important
    end
  end
end


class Hello < FattyRBP::Formatter 
  format :text do
    def render
      "Hello World"
    end
  end

  format :html do
    def render
      "<b>Hello World</b>"
    end
  end
end

puts Hello.render(:text)
puts Hello.render(:html)


class Goodbye < FattyRBP::Formatter
  format :text do
    def render
      "Goodbye Cruel World!"
    end
  end
 end

puts Goodbye.render(:text)


# Should not have changed
puts Hello.render(:text)

# Shouldn't exist
puts Goodbye.render(:html)
