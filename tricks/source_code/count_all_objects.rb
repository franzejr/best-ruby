require 'pp'

pp ObjectSpace.count_objects

# Result:
# {:TOTAL=>30163,
#  :FREE=>1007,
#  :T_OBJECT=>39,
#  :T_CLASS=>534,
#  :T_MODULE=>24,
#  :T_FLOAT=>4,
#  :T_STRING=>9290,
#  :T_REGEXP=>70,
#  :T_ARRAY=>2231,
#  :T_HASH=>53,
#  :T_STRUCT=>1,
#  :T_BIGNUM=>2,
#  :T_FILE=>14,
#  :T_DATA=>966,
#  :T_MATCH=>1,
#  :T_COMPLEX=>1,
#  :T_NODE=>15896,
#  :T_ICLASS=>30}
