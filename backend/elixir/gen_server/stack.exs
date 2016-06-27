defmodule Stack do
  use GenServer

  # Server Callbacks
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
end

# Provide module that the server lives in and initial state
{:ok, pid} = GenServer.start_link(Stack, [:hello])

GenServer.call(pid, :pop)
#=> :hello

GenServer.cast(pid, {:push, :world})
#=> :ok

GenServer.call(pid, :pop)
#=> :world
