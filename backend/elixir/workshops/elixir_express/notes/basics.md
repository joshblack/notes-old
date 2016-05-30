## Basics

### Types

- Integer
- Float
- Atom
- Tuple `{:ok, :foo, :bar}`
- List
- Bitstring
- Pid

#### Tuple

```
# Allocated continuously in memory, set length, set order
is_tuple {1, 2, 3}
```

#### List

```
# Stored as a linked list, so length is an O(n) operation
is_list [1, 2, 3]

[head | tail] = [1, 2, 3, 4, 5];
head # 1
tail # [2, 3, 4, 5]

[1, 2, third | rest ] = [1, 2, 3, 4, 5, 6]
third # 3
rest # [4, 5, 6]

list = [1, 2, 3]
hd list 1
tl list # [2, 3]

Enum.at([2, 4, 6], 0) # 2
```
