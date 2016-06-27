# List Operations
[1, 2, 3] ++ [4, 5, 6]

# Flatten
List.flatten([[1], [2], [[3, 4]]])

# Fold (reduce)
List.foldl([1, 2, 3], 0, fn value, acc -> value + acc end)
List.foldr([1, 2, 3], 0, fn value, acc -> value + acc end)

# List.keyfind(list, value, index)
# List.keydelete(kw, "TX", 1, "Default Message")
# List.keyreplace(kw, value, index, replacement)
