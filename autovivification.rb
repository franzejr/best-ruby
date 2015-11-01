deep = Hash.new { |hash,key| hash[key] = Hash.new(&hash.default_proc) }


deep[:a][:b][:c][:d] = 42
p deep

# Result:
# {:a=>{:b=>{:c=>{:d=>42}}}}
