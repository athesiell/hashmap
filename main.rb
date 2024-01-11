require_relative './lib/hashmap'

hash_map = HashMap.new
hash_map.set('name', 'John')
hash_map.set('eyes', 'brown')

p hash_map.get('name')
p hash_map.get('age')
p hash_map.get('eyes')

p hash_map.key?('name')
p hash_map.key?('age')
p hash_map.length

p hash_map.remove('eyes')
p hash_map.get('eyes')

p hash_map.keys
p hash_map.values
p hash_map.entries