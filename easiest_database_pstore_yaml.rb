require 'yaml/store'

db = YAML::Store.new('people.yml')

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
