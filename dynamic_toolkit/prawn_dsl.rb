require "rubygems"
require "prawn"

Prawn::Document.generate("hello.pdf") do
  
  font_size 16 do
    text "Hello, World"
  end

  text "Back to default font size"

  stroke_color "foo bar"
  stroke_line [100,100], [400,400]

end
