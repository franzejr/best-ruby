def var
  @var || 40
end

if $DEBUG
  p "var is %p" % var
end

p var + 2
