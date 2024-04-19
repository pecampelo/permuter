defmodule Permutation.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PermutationWeb.Telemetry,
      Permutation.Repo,
      {DNSCluster, query: Application.get_env(:permute, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Permutation.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Permutation.Finch},
      # Start a worker by calling: Permutation.Worker.start_link(arg)
      # {Permutation.Worker, arg},
      # Start to serve requests, typically the last entry
      PermutationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Permutation.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PermutationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
