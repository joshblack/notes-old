# Enumerables and Streams

The `Enum` module works on both lists and maps, and really anything that is considered _enumerable_.

```ex
# Double all the elements in the list
Enum.map([1, 2, 3], fn x -> x * 2 end)
[2, 4, 6]

# Find the product of each {key, value} tuple
Enum.map(%{1 => 2, 3 => 4}, fn {k, v} -> k * v end)
[2, 12]
```

It's important to note that all the functions in the `Enum` module are eager. If we want lazy operations, we'll have to use the `Stream` module.

Streams are very useful for handling large files or slow resources like network resources because they allow us to wrap resources and guarantee that they are opened right before enumeration and closed afterwards, even in the case of failures.
