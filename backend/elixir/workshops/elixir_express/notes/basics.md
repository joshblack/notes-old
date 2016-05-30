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

```ex
# Allocated continuously in memory, set length, set order
is_tuple {1, 2, 3}
```

#### List

```ex
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
Enum.reverse list     # [3, 2, 1]
```

##### Keyword Lists

```ex
types = [atom: "Atom", tuple: "Tuple"]
types[:atom]        # "Atom"
types[:not_exists]  # nil

[{:atom, "Atom"}] == [atom: "Atom"] # true

Keyword.keys types    # [:atom, :tuple]
Keyword.values types  # ["Atom", "Tuple"]

if true, [do: "it's true"}          # it's true
```

### Variable Binding

```ex
sum = 10
sum_val = fn -> IO.puts "Sum value was #{sum}" end

sum_val.() # 10

sum = 12

sum_val.() # 10, doesn't change! Just the binding to sum after the re-bind changes
```

### Anonymous functions

```ex
add = fn a, b ->
  a + b
end

add.(1, 2) # 3

# Shorthand
Enum.map [3, 6, 9], &(&1 * 2)

# Same as
Enum.map [3, 6, 9], fn i -> i * 2 end
```
