# Secret

## usage

```
Secret.start_link("007")
Secret.via("007")
Secret.echo("007", "Bond. James Bond")

# multi-Children (DynamicSupervisor)
# figurure out its child spec
DynamicSupervisor.child_spec(strategy :one_to_one, Secret.DynamicSupervisor)

Secret.Application.start_link(Secret.Supervisor, "007")

Process.whereis Secret.Supervisor
Process.whereis Secret.Registry
Process.whereis Secret.DynamicSupervisor

Secret.child_spec("007")
agent_name = "007"
sc = Secret.child_spec(agent_name) |> Map.put(:id, Secret.via(agent_name))

ds = Secret.DynamicSupervisor

DynamicSupervisor.start_child(ds, sc)
Secret.start_link("007")
Secret.echo("007", "bond")

Secret.child_spec "007"
%{
  id: {:via, Registry, {Secret.Registry, "007"}},
  start: {Secret, :start_link, ["007"]}
}

ds = Secret.DynamicSupervisor
DynamicSupervisor.start_child(ds, {Secret, "007"})
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `secret` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:secret, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/secret](https://hexdocs.pm/secret).

