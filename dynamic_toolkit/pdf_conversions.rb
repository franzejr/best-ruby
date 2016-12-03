class Numeric

  [:in, :ft].each do |e|
    if instance_methods.include?(e)
      raise "Method '#{e}' exists, PDF Conversions will not override!"
    end
  end

  
  def in
    self * 72
  end

  def ft
    self.in * 12
  end

end
