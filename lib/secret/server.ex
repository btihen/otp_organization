# policies for a single server
# lib/secret/server.ex
defmodule Secret.Server do
  use GenServer
  alias Secret.Core

  # server API
  def start_link(agent_name) do
    service_name = via(agent_name)
    GenServer.start_link(__MODULE__, agent_name, name: service_name)
  end

  def echo(agent_name, text) do
    service_name = via(agent_name)
    GenServer.call(service_name, {:echo, text})
  end

  def via(agent_name) do
    {:via, Registry, {Secret.Registry, agent_name}}
  end

  # callbacks
  def init(agent_name), do: {:ok, agent_name}

  def handle_call({:echo, text}, _from, agent_name) do
    {:reply, Core.echo(agent_name, text), agent_name}
    # {:reply, "#{agent_name} says: '#{text}'", agent_name}
  end

  # callback - to instruct on naming
  def child_spec(agent_name) do
    %{
      id: {:via, Registry, {Secret.Registry, agent_name}},
      start: {__MODULE__, :start_link, [agent_name]}
    }
  end
end
