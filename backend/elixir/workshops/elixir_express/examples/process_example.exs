pid = spawn fn ->
  receive do
    {sender, :ping} ->
      IO.puts "Got ping"
      send sender, :pong
  end
end

send pid, {self, :ping}

receive do
  message -> IO.puts "Got #{message} back"
end
