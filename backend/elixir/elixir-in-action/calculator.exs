defmodule Calculator do
  def start do
    spawn(fn ->
      initial_state = 0

      loop(initial_state)
    end)
  end

  def add(pid, value) do
    send(pid, {:add, value})
  end

  def value(pid, caller) do
    send(pid, {:value, caller})
  end

  defp loop(state) do
    next_state = receive do
      {:value, caller} ->
        send(caller, {:response, state})
        state

      {:add, value} -> state + value
      {:sub, value} -> state - value
      {:mul, value} -> state * value
      {:div, value} -> state / value

      message ->
        IO.puts "Invalid request #{inspect(message)}"
        state
    end

    loop(next_state)
  end
end
