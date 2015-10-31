params = {var: 42}

p params.fetch(:var)
p params.fetch(:missing, 42)
p params.fetch(:missing) { 40 + 2 }

params.fetch(:missing)

