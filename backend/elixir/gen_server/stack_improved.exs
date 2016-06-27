defmodule Stack do
  use GenServer

  # Client
  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def push(pid, item) do
    GenServer.cast(pid, {:push, item})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Callbacks
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_call(request, from, state) do
    super(request, from, state)
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end

  def handle_cast(request, state) do
    super(request, state)
  end
end

ExUnit.start()

defmodule StackTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, stack} = Stack.start_link([])
    {:ok, stack: stack}
  end

  test "adds an item to the end of the stack", %{stack: stack} do
    assert Stack.push(stack, 1) == :ok
  end

  test "pops an item from the top of the stack", %{stack: stack} do
    assert Stack.push(stack, 1) == :ok
    assert Stack.push(stack, 2) == :ok

    assert Stack.pop(stack) == 2
    assert Stack.pop(stack) == 1
  end
end

