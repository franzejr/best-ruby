$VERBOSE = true

class WarnMe
  def var
    @var || 42
  end
end


p WarnMe.new.var

