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
```
