# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :notifier,
  ecto_repos: [Notifier.Repo]

# Configures the endpoint
config :notifier, NotifierWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ESETzAGFWK5iwPODIg8Kd+Jk+o9g1IIhemuV4Z3FVSD+TNLjPWbKl/4DeaFmtwb4",
  render_errors: [view: NotifierWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Notifier.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :hound, driver: "phantomjs"