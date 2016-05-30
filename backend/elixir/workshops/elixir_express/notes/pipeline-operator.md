## Pipeline Operator

```ex
"Hello" |> IO.puts

[3, 6, 9] |> Enum.map(fn x -> x * 2 end) |> Enum.at(2)
```

Basically this is good because instead of having to do function composition with the notation `f(g(x))`, you do: `g(x) -> f(*g(x) result)`

So you can read what the transformation flow is instead of having to read inside-out.

