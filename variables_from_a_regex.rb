if  /\A(?<first>\w+),\s*(?<last>\w+)\z/ =~ "Franze, Jr"
  puts "#{first} #{last}"
end

# Result:
# Franze Jr
