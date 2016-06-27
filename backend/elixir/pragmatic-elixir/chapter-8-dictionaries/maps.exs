# Maps
map = %{name: "Dave", likes: "Programming", where: "Dallas"}

map[:name]     # "Dave"
map.name       # "Dave"

Map.keys map   # [:likes, :name, :where]
Map.values map # ["Programming", "Dave", "Dallas"]

map1 = Map.drop map, [:where, :likes] # %{name: "Dave"}
map2 = Map.put map, :also_likes, "Ruby"

Map.has_key? map1, :where # False

Map.pop map, :name
Map.equal? map, map1

nestedMap = %{
  foo: %{
    bar: "foobar"
  }
}

# get_in, get_and_update_in
put_in nestedMap.foo.bar, "baz"
update_in nestedMap.foo.bar, &(&1 <> " baz")
