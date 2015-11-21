require 'securerandom'

p SecureRandom.random_number
p SecureRandom.random_number(100)
p
p SecureRandom.hex(20)
p SecureRandom.base64(20)

# Result:
# 0.7851536586163714
# 46
# "3efb674fbc2ba390856c15489652e75e8afff6d1"
# "yFv0WzugzFC6/D71teVe1Y5r1kU="
