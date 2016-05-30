## Control Flow

Only `false` and `nil` are falsey. All other values are truthy

```ex
saved = true

if saved do
  # ...
else do
  # ...
end


unless saved do
  #...
end
```

### `cond`

Takes a series of expressions and evalutes the first truthy match

### `case`

Control flow based on pattern matching. Given an expression, case will match against each clause until the first pattern is matched.

```ex
calculate = fn expression ->
  case expression do
    {:+, num1, num2} -> num1 + num2
    {:-, num1, num2} -> num1 - num2
    {:*, num1, 0}    -> 0
    {:*, num1, num2} -> num1 * num2
    {:/, num1, num2} -> num1 / num2
  end
end
```

An underscore provides a fall-through:

```ex
calculate = fn expression ->
  case expression do
    {:+, num1, num2} -> num1 + num2
    {:-, num1, num2} -> num1 - num2
    {:*, num1, 0}    -> 0
    {:*, num1, num2} -> num1 * num2
    _ -> raise "Unable to parse #{inspect expression}"
  end
end
```

Can also use it to match any part of a pattern:

```ex
calculate = fn expression ->
  case expression do
    {:+, 7, _} -> "Sevens aren't allowed"
    {:+, a, b} -> a + b
  end
end
```
