# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :community,
  ecto_repos: [Community.Repo]

# Configures the endpoint
config :community, CommunityWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6wqiNtvb8tY2u3Xlwy5d2QjhW7/+SyGhLw+meFo0D+Hv0xtTxx7VuXHkNNfcIJyx",
  render_errors: [view: CommunityWeb.ErrorView, accepts: ~w(json)],
  pubsub_server: Community.PubSub,
  live_view: [signing_salt: "qE5NL5X2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
