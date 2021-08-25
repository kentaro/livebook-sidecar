defmodule LivebookSidecar do
  def retrieve_data() do
    GenServer.call(LivebookSidecar.Worker, :retrieve_data)
  end
end
