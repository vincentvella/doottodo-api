defmodule DootTodo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DootTodo.Repo,
      # Start the Telemetry supervisor
      DootTodoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DootTodo.PubSub},
      # Start the Endpoint (http/https)
      DootTodoWeb.Endpoint,
      # Start a worker by calling: DootTodo.Worker.start_link(arg)
      # {DootTodo.Worker, arg}
      {Oban, oban_config()}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DootTodo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DootTodoWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_config do
    Application.fetch_env!(:doot_todo, Oban)
  end
end
