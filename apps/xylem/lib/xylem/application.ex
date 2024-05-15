defmodule Xylem.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Xylem.Repo,
      {DNSCluster, query: Application.get_env(:xylem, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Xylem.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Xylem.Finch}
      # Start a worker by calling: Xylem.Worker.start_link(arg)
      # {Xylem.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Xylem.Supervisor)
  end
end
