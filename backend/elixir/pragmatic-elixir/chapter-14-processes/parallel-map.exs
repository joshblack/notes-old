defmodule Parallel do
  def parallel_map(collection, func) do
    me = self

    collection
      |> Enum.map(fn (elem) ->
          spawn_link fn -> (send me, { self, func.(elem) }) end
        end)
      |> Enum.map(fn (pid) ->
          receive do { ^pid, result } -> result end
        end)
  end
end
