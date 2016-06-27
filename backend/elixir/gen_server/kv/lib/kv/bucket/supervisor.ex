defmodule KV.Bucket.Supervisor do
  use Supervisor

  # A simple module attribute that stores the supervisor name
  @name KV.Bucket.Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  @doc """
  Starts a bucket as a child of our supervisor named `KV.Bucket.Supervisor`.

  We'll use this instead of calling KV.Bucket.start_link directly
  """
  def start_bucket do
    Supervisor.start_child(@name, [])
  end

  @doc """
  Create a new temporary worker for `KV.Bucket`, telling the Supervisor not to
  restart the bucket if it dies. The creation of buckets should always pass
  through the registry
  """
  def init(:ok) do
    children = [
      worker(KV.Bucket, [], restart: :temporary)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
