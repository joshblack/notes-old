# Elixir and Concurrency

Erlang is all about writing highly available systems -- systems that run forever and are always able to meaningfully respond to client requests. To make your system highly available, you have to tackle the following challenges:

- Minimize, isolate, and recover from the effets of runtime errors (fault tolerance)
- Handle a load increase by adding more hardware resources without changing or redeploying code (scalability)
- Run your system on multiple machines so that others can take over if one machine crashes (distribution)

Concurrency plays an important role in achieving HA. In BEAM, a unit of concurrency is a process: a basic building block that makes it possible to build scalable, fault-tolerant, distributed systems. Using a dedicated process for each task, you can take advantage of all available CPU cores and parallelize the work as much as possible.

BEAM processes are completely isolated, sharing no memory and a crash on one process won't take down other processes. BEAM also provides a means to detect a process crash and do something about it.

Each process can also manage some state, and can receive messages from other processes to manipulate or retrieve state.


## Creating processes

We can use the auto-loaded `spawn/1` function to create new processes:

```ex
spawn(fn ->
  # ...
end)
```

After the process is created, `spawn/1` immediately returns and the process's execution continues. The lambda passed into `spawn/1` is ran concurrently, and the memory of its process is released once the lambda is done and the spawned process exits.

## Message Passing

Each process maintains its own "mailbox", which is simply a FIFO queue that allows the process to process messages as they are received from other processes. You send messages using the `pid` associated to a process, and any message sent to a process in deep-copied since processes can't share memory.

To send messages, we can use `send/2`

```ex
send(pid, {:ok, "message"})
```

Which we can then read inside of the process using a `receive` block:

```ex
receive do
  {:ok, message} -> #...
  {:error, reason} -> #...
end
```

`receive` here tries to find the first message in the process' mailbox that can be matched against any of the provided clauses.

## Server Processes

A Server Process is an informal name for a process that:

- runs for a long time (or forever)
- can handle various requests (messages)

Consider the following server:

```ex
defmodule ExampleServer do
  # Called the `interface` function that is used by clients to start
  # the server process
  def start do
    spawn(&loop/0)
  end
  
  def run_async(server_pid, query_def) do
    send(server_pid, {:run_query, self, query_def})
  end
  
  def get_result do
    receive do
      {:query_result, result} -> result
    after 5000 ->
      {:error, :timeout}
    end
  end
  
  defp loop do
    receive do
      {:run_query, caller, query_def ->
        send(caller, {:query_result, run_query(query_def)})
    end
    
    loop
  end
  
  defp run_query(query_def) do
    :timer.sleep(2000)
    
    "#{query_def} result"
  end
end
```

A standard abstraction called `gen_server` (generic server) is provided to us to use, which helps out with the development of stateful server processes.
