aa = [ %w[Someone 1],
      %w[Bla 2]]

p aa.assoc("Someone")
p aa.assoc("Bla")

# Result:
# ["Someone", "1"]
# ["Bla", "2"]
