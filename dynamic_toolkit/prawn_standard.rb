require "rubygems"
require "prawn"

pdf = Prawn::Document.new

original_font_size = pdf.font_size
pdf.font_size = 16
pdf.text "Hello, World"
pdf.font_size = original_font_size
pdf.text "Back to default font size"

pdf.stroke_color = "ff00ff"
pdf.line [100,100], [400,400]
pdf.stroke

pdf.render_file "hello.pdf"
