# GenServer

A GenServer is implemented in two parts: the client API and the server callbacks. The client and server run in separate processes, with the client passing messages back and forth the the server as its functions are called.

```ex
defmodule KV.Registry do
  use GenServer
  
  ## Client API
  def start_link
    GenServer.start_link(__MODULE__, :ok, [])
  end
  
  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end
  
  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end
  
  ## Server Callbacks
  def init(:ok) do
    {:ok, %{}}
  end
  
  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names}
  end
  
  def handle_cast({:create, name}, names) do
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, bucket} = KV.Bucket.start_link
      {:noreply, Map.put(names, name, bucket)}
    end
  end
end
```

The first function for `GenServer` that we use is `start_link/3` which starts a new GenServer passing in three arguments:

- The module where the server callbacks are implemented, in this case `__MODULE__`, meaning the current module
- The initialization arguments, in this case the atom `:ok`
- A list of options which can, for example, hold the name of the server.

There are two types of requests you can send to a GenServer:

- `call`: synchronous, and the server must send a response back to such requests
- `cast`: asynchronous and th e server won't send a response back

For the server callbacks, `init/1` is a callback that receives the argument given to `GenServer.start_link/2`.

For `call/2` requests, we implement a `handle_call/3` callback the receives the `request`, the process from which we received the request `_from`, and the current server state `names`. The `handle_call/3` callback returns a tuple in the format `{:reply, reply, new_state}`, where `reply` is what will be sent to the client and the `new_state` is the new server state.

### `call`, `cast`, or `info`?

Deciding when to use `handle_call/3`, `handle_cast/2`, and `handle_info/2` is straightforward:

- `handle_call/3` must be used for synchronous requests, and is the default choice to apply backpressure while you're waiting for a server reply
- `handle_cast/2` is used for async requests, when you don't care about a reply. It _does not_ guarantee that the server receives the message and should be used sparingly.
- `handle_info/2` is used for all other messages a server may receive that are not sent via `cast` or `call`, including regular messages sent with `send/2`.
