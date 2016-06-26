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

