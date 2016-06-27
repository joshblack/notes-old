spawn_link fn -> raise "oops" end

receive do
  :hello -> "let's wait until the process fails"
end
