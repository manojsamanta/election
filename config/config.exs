# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :election,
  ecto_repos: [Election.Repo]

# Configures the endpoint
config :election, ElectionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m41PN4LUcoJci0Yh5J8R48lN/91YfskZv3z2RDf//X/K92f56pk/ndiuW+/qa8Qg",
  render_errors: [view: ElectionWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Election.PubSub,
  live_view: [signing_salt: "bXr9rGs3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
