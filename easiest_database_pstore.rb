require 'pstore'

db = PStore.new('mydatabase.pstore')

db.transaction do
  db['people1'] = 'Someone'
  db['money1'] = 400
end

db.transaction do
  db['people2'] = 'Someone2'
  db['money2'] = 300
end


db.transaction(true) do
  p 'People %p' % db['people1']
  p 'Money %p' % db['money1']
  p "SECOND PERSON"
  p 'People %p' % db['people2']
  p 'Money %p' % db['money2']
end

# Result:
# "People \"Someone\""
# "Money 400"
# "SECOND PERSON"
# "People \"Someone2\""
# "Money 300"
