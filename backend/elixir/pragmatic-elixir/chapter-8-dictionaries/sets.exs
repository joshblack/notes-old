set1 = MapSet.new [1, 2, 3]
set2 = MapSet.new [3, 4, 5, 6]

MapSet.member? set1, 3 # true
MapSet.member? set1, 5 # false

union = MapSet.union set1, set2
diff = MapSet.difference set1, set2
intersect = MapSet.intersection set1, set2
