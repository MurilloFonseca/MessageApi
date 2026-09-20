defmodule MessageApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MessageApiWeb.Telemetry,
      MessageApi.Repo,
      {DNSCluster, query: Application.get_env(:message_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MessageApi.PubSub},
      # Start a worker by calling: MessageApi.Worker.start_link(arg)
      # {MessageApi.Worker, arg},
      # Start to serve requests, typically the last entry
      MessageApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MessageApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MessageApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
