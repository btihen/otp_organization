# business functions - easy to test
# lib/secret/core.ex
defmodule Secret.Core do
  def echo(agent_name, message) do
    # "#{agent_name} says: '#{message}'"
    ~s[#{agent_name} says: '#{message}']
  end
end
