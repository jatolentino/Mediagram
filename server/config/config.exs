# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mediagram,
  ecto_repos: [Mediagram.Repo]

# Configures the endpoint
config :mediagram, MediagramWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hc7QDhHmledxd+VEqA1ETk79hfdbZMREF0Uaiq3oi7dNlUXmWThFefdRyuzFZluK",
  render_errors: [view: MediagramWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Mediagram.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :mediagram, Mediagram.Guardian,
  issuer: "mediagram",
  secret_key: "3TrEVHPaCT1PIToFKDBh4Lh4jLwwM75BjpwjueKQw66CtaHVhpqC0pS0U9gmpk5Z"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
