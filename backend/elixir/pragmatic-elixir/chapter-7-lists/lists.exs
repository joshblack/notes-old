defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def add_one([]), do: []
  def add_one([head | tail]), do: [head + 1 | add_one(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([head | tail], total), do: _sum(tail, head + total)

  def reduce([], value, _func) do
    value
  end

  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end
end
