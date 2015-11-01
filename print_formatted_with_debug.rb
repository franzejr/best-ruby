def debug(name, content)
  p "%s:  %p" % [name, content]
end

debug "Num", 42

# Result:
# "Num:  42"
