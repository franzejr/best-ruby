class SimpleTestHarness

  class << self

    def inherited(base)
      tests << base
    end

    def tests
      @tests ||= []
    end

    def run
      tests.each do |t|
        t.instance_methods.grep(/^test_/).each do |m|
          test_case = t.new
          test_case.setup if test_case.respond_to?(:setup)
          test_case.send(m)
        end
      end
    end
  end

end

class SimpleTest < SimpleTestHarness

  def setup
    puts "Setting up @string"
    @string = "Foo"
  end

  def test_string_must_be_foo
    answer = (@string == "Foo" ? "yes" : "no")
    puts "@string == 'Foo': " << answer
  end

  def test_string_must_be_bar
    answer = (@string == "bar" ? "yes" : "no")
    puts "@string == 'bar': " << answer
  end

end

class AnotherTest < SimpleTestHarness

  def test_another_lame_example
    puts "This got called, isn't that good enough?"
  end

  def helper_method
    puts "But you'll never see this"
  end

  def a_test_method
    puts "Or this"
  end

end

SimpleTestHarness.run

