class Questioner           

  def initialize(input=STDIN,out=STDOUT)
    @input  = input
    @output = out
  end

  def inquire_about_happiness
    ask("Are you happy?") ? "Good I'm Glad" : "That's Too Bad"
  end

  def ask(question)
    @output.puts question
    response = @input.gets.chomp
    case(response)
    when /^y(es)?$/i
      true
    when /^no?$/i
      false
    else  
      @output.puts "I don't understand."
      ask question
    end
  end

end  

require "test/unit"
require "test_unit_extensions"

require "flexmock/test_unit"

class QuestionerTest < Test::Unit::TestCase

  def setup
    @input  = flexmock("input")
    @output = flexmock("output")
    @questioner = Questioner.new(@input,@output)
    @question   = "Are you happy?"
  end
                                   
  ["y", "Y", "YeS", "YES", "yes"].each do |y|                                                                                                                                       must "ask #{@question} and returns true when given #{y}" do 
       expect_output @question
       provide_input(y)
       assert @questioner.ask(@question), "Expected '#{y}' to be true"
     end
   end
    
  ["n", "N", "no", "nO"].each do |no|
    must "ask #{@question} return false when parsing #{no}" do 
      expect_output @question
      provide_input(no)
      assert !@questioner.ask(@question)
    end
  end

  [["y", true], ["n", false]].each do |input, state|
    must "continue to ask for input until given #{input}" do 
      %w[Yesterday North kittens].each do |i|
        expect_output @question
        provide_input(i)
        expect_output("I don't understand.")
      end

      expect_output @question
      provide_input(input)

      assert_equal state, @questioner.ask(@question)
    end
  end

  def provide_input(string)
    @input.should_receive(:gets => string).once
  end

  def expect_output(string)
    @output.should_receive(:puts).with(string).once
  end
     
end 


