## Elixir Basics

Taken from [Elixir School](http://elixirschool.com/)

### Basics

Elixir supports the basic operators +, -, *, and / as you would expect. It’s important to notice that / will always return a float.

If you need integer division or the division remainder, Elixir comes with two helpful functions to achieve this:

```ex
iex> div(10, 5)
2
iex> rem(10, 3)
1
```

An interesting feature is that any two types in Elixir can be compared, the order being:

```
number < atom < reference < functions < port < pid < tuple < maps < list < bitstring
```

#### String Interpolation

```ex
name = "Sean"
"Hello ${name}"
```

#### String Concatenation

```ex
name = "Sean"
"Hello " <> name
```

### Collections

> List, tuples, keywords, maps, and functional combinators

#### Lists

Lists are implemented as linked lists, so accessing length is an `O(n)` operation. It's typically faster to prepend than append.

```ex
list = [3.41, :pie, "Apple"]
["First"] ++ list
list ++ ["Last"]
```

##### List Subtraction

```ex
list = ["foo", :bar, 42] -- [42, "bar"]
```

##### Head / Tail

```ex
hd [3.41, :pie, "Apple"] # 3.41
tl [3.41, :pie, "Apple"] # [:pie, "Apple"]
```

#### Tuples

Tuples are stored contiguously in memory, making accessing their length fast but modification is expesnive.

```
tuple = {:foo, :bar, :baz}
```

#### Keyword Lists 

Keywords and maps are the associative collections of Elixir. In Elixir, a keyword list is a special list of tuples whose first element is an atom; they share performance with lists

```ex
iex> [foo: "bar", hello: "world"]
[foo: "bar", hello: "world"]
iex> [{:foo, "bar"}, {:hello, "world"}]
[foo: "bar", hello: "world"]
```

- Keys are atoms
- Keys are ordered
- Keys are not unique

#### Maps

```
iex> map = %{:foo => "bar", "hello" => :world}
%{:foo => "bar", "hello" => :world}
iex> map[:foo]
"bar"
iex> map["hello"]
:world
```

Maps containing only atom keys:

```ex
iex> %{foo: "bar", hello: "world"}
%{foo: "bar", hello: "world"}
```

### Enums

> A set of algoirthms for enumerating over collections

```ex
Enum.all?([], fn() => ... end)
Enum.any?([], fn() => ... end)
Enum.chunk([1, 2, 3, 4, 5, 6], 2) # [[1, 2], [3, 4], [5, 6]]
Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)
Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end)
Enum.reduce([1, 2, 3], 10, fn(x, acc) -> x + acc end)
Enum.min([5, 3, 0, -1])
Enum.max([5, 3, 0, -1])
```

### Pattern Matching

