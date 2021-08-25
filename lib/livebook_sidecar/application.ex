defmodule LivebookSidecar.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LivebookSidecar.Worker
    ]

    opts = [strategy: :one_for_one, name: LivebookSidecar.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
