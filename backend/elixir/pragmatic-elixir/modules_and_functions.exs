# Convert a float to a string with two decimal digits
:io.format("~.2~n", [2.0/3.0])

# Get the value of an OS env variable
System.get_env("HOME")

# REturn the extension-component of a file name
Path.extname("modules_and_functions.exs")

# Return the cwd
System.cwd

# Execute a command in your OS's shell
System.cmd("date")
