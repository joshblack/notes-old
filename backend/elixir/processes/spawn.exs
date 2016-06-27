# spawn/1 :: fn -> pid

pid = spawn fn -> 1 + 2 end
Process.alive?(pid)

# Get the current process
self
self()

# `send` and `receive`
send self(), {:hello, "world"}
receive do
  {:hello, msg} -> msg
  {:world, msg} -> "won't match"
end

# When a message is sent to a process, the message is stored in
# the process mailbox. If no messages in the mailbox match any
# of the patterns, the current process will wait until a matching
# message arrives.

receive do
  {:hello, msg} -> msg
after
  1_000 -> "nothing after 1s"
end

# send :: pid, any

# Most common way of spawning in Elixir is `spawn_link`
# There's also Process.link/1

# In Elixir apps, we often link our processes to supervisors which
# will detect when a process dies and start a new process in its
# place



