def  true.-(a, &b); a[] end
def false.-(a, &b); b[] end

puts (1 == 1).--> { :ok } { :different }
puts (4 == 2).--> { :ok } { :different }

# Result:
# # ok
# # different
