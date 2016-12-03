# this file requires Prawn to run.

require "rubygems"
require "prawn"
require "test/unit"
require "test_unit_extensions"

class Prawn::Document
  module Text::StyleParser
    extend self

    TAG_PATTERN = %r{(</?[ib]>)}
  
    def process(text) #:nodoc:  
      segments = text.split(TAG_PATTERN).delete_if{|x| x.empty? }  
    end    

    def style_tag?(text)
      !!(text =~ TAG_PATTERN)
    end 
  end
end

class TestInlineStyleParsing < Test::Unit::TestCase

  def setup
    @parser = Prawn::Document::Text::StyleParser
  end

  must "parse italic tags" do
    assert_equal ["Hello ", "<i>", "Fine", "</i>", " World"], 
      @parser.process("Hello <i>Fine</i> World")
  end
    
  must "parse bold tags" do
    assert_equal ["Some very ", "<b>", "bold text", "</b>"],
      @parser.process("Some very <b>bold text</b>")
  end   

  must "parse mixed italic and bold tags" do
    assert_equal ["Hello ", "<i>", "Fine ", "<b>", "World", "</b>", "</i>"],
      @parser.process("Hello <i>Fine <b>World</b></i>")
  end 
       
  must "not split out other tags than <i>, <b>, </i>, </b>" do
    assert_equal ["Hello <indigo>Ch", "</b>", "arl", "</b>", "ie</indigo>"],                        
      @parser.process("Hello <indigo>Ch</b>arl</b>ie</indigo>")
  end 

  must "be able to check whether a string needs to be parsed" do
    assert @parser.style_tag?("Hello <i>Fine</i> World")
    assert !@parser.style_tag?("Hello World")
  end

end   
