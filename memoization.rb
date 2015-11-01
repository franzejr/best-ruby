# based on Justin Weiss' article:
# http://www.justinweiss.com/articles/4-simple-memoization-patterns-in-ruby-and-one-gem/

class Memoize
  # one liner
  def my_simple_method
    @my_simple_method ||= do_some_calculation
  end

  # multiple lines
  def my_more_complex_method
    @my_more_complex_method ||= begin
      a = do_some_calculation
      b = do_some_more_calculation
      a + b
    end
  end

  # what if our calculations return nil?...

  # one liner
  def my_simple_method
    return @my_simple_method if defined? @my_simple_method
    @my_simple_method = do_some_calculation
  end

  # multiple lines
  def my_more_complex_method
    return @my_more_complex_method if defined? @my_more_complex_method
    @my_more_complex_method = begin
      a = do_some_calculation
      b = do_some_more_calculation
      a + b
    end
  end

  # what about differing arguments?...

  def my_really_complex_method(*args)
    @my_really_complex_method ||= Hash.new do |h, key|
      h[key] = do_some_calculation(*key)
    end
    @my_really_complex_method[args]
  end
end
