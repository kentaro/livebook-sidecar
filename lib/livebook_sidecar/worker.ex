defmodule LivebookSidecar.Worker do
  use GenServer

  @impl GenServer
  def init(_init_arg) do
    {:ok, %{data: []}, {:continue, :init_worker}}
  end

  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl GenServer
  def handle_continue(:init_worker, state) do
    Process.send_after(self(), :work, 0)
    {:noreply, state}
  end

  @impl GenServer
  def handle_info(:work, state) do
    data =
      state.data
      |> Enum.concat([
        %{
          datetime: Timex.now("Asia/Tokyo"),
          count: Enum.random(0..100)
        }
      ])

    Process.send_after(self(), :work, 1_000)
    {:noreply, %{state | data: data}}
  end

  @impl GenServer
  def handle_call(:retrieve_data, _from, state) do
    {:reply, state.data, state}
  end
end
