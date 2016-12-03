require "rubygems"

gem "prawn", "=0.2.0"

require "prawn"

require "test/unit"

class CanvasTest < Test::Unit::TestCase

  def setup
    @pdf = Prawn::Document.new 
  end
  
  def test_canvas_should_not_reset_y_to_zero
    after_text_position = nil

    @pdf.canvas do 
      @pdf.text "Hello World" 
      after_text_position = @pdf.y 
    end

    assert_equal after_text_position, @pdf.y
  end
end  
