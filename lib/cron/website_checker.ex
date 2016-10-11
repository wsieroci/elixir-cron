defmodule Cron.WebsiteChecker do
  use GenServer

  ## Client:

  def start_link(name, website) do
    GenServer.start_link(__MODULE__, {:ok, website}, name: name)
  end

  def lookup(server) do
    GenServer.call(server, {:lookup})
  end

  ## Server:

  def init({:ok, website}) do
    schedule_work() # Schedule work to be performed at some point
    {:ok, %{time: 0, website: website}}
  end

  def handle_call({:lookup}, _from, %{time: time, _: _} = state) do
    {:reply, time, state}
  end

  def handle_info(:work, %{time: time, website: website}) do
    check_website(time, website)
    schedule_work() # Reschedule once more
    {:noreply, %{time: time + 1, website: website}}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 5 * 1000) # every 5 seconds
  end

  defp check_website(time, website) do
    response = HTTPotion.get website
    is_success = HTTPotion.Response.success?(response)
    IO.puts "Checking website #{website}. Time: #{time}. Success: #{is_success}"
  end
end