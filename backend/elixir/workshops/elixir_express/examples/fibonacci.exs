defmodule Fibonacci do
  def value(0), do: 0
  def value(1), do: 1
  def value(term) when term >= 0 do
    value(term - 1) + value(term - 2)
  end
end
