# The IO module is the main mechanism in Elixir for reading and
# writing to :stdio and :stderr
IO.puts "hello world"
IO.gets "yes or no?"

# File, allows us to open files as IO devices.
{:ok, file} = File.open "hello", [:write]
IO.binwrite file, "world"
File.close file

File.read "hello"

# File.rm/1, File.mkdir/1, File.mkdir_p/1
# File.cp_r/2, File.rm_rf/1

# You can use the ! to throw exceptions, and pattern match
case File.read(file) do
  {:ok, body} -> # do something with the `body`
  {:error, reason} -> # handle the error caused by `reason`
end

# Path module
Path.join("foo", "bar") # "foo/bar"
Path.expand("~/hello")  # "/Users/joshuablack/hello"

