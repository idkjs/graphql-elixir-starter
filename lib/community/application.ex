defmodule Community.Application do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  # def start(_type, _args) do
  #   import Supervisor.Spec
  #   {Phoenix.PubSub, [name: Community.PubSub, adapter: Phoenix.PubSub.PG2]}
  #   # Define workers and child supervisors to be supervised
  #   children = [
  #     # Start the Ecto repository
  #     supervisor(Community.Repo, []),
  #     # Start the endpoint when the application starts
  #     supervisor(CommunityWeb.Endpoint, [])
  #     # Start your own worker by calling: Community.Worker.start_link(arg1, arg2, arg3)
  #     # worker(Community.Worker, [arg1, arg2, arg3]),
  #   ]

  #   # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
  #   # for other strategies and supported options
  #   opts = [strategy: :one_for_one, name: Community.Supervisor]
  #   Supervisor.start_link(children, opts)
  # end
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Community.Repo,
      # Start the Telemetry supervisor
      CommunityWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Community.PubSub},
      # Start the Endpoint (http/https)
      CommunityWeb.Endpoint
      # Start a worker by calling: Community.Worker.start_link(arg)
      # {Community.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Community.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
