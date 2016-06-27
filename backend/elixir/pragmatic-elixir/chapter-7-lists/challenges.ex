defmodule MyList
  # Lists and Recursion - 1
  # mapsum : (list, func) :: number
  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  # Lists and Recursion - 2
  def max([a]), do: a
  def max([head | tail]), do: Kernel.max(head, max(tail))
end
