# Working with Multiple Processes

Elixir uses the _actor_ model of concurrency. In it, an actor is an independent process that shares nothing with any other process.

You're allowed to _spawn_ new processes, _send_ them messages, and _receive_ messages back. And that's it! (apart from error-handling and monitoring)
