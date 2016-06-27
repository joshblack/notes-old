# Tasks build on top of the spawn functions to provider error
# reports and introspection

# Task.start/1, Task.start_link/1 :: {:ok, pid}
Task.start fn -> raise "oops" end

# We can use tasks to return the {:ok, pid} tuple rather than just
# the PID. This lets us use Tasks in supervision trees.

# Task.async/1 and Task.await/1
