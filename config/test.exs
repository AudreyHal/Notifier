use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :notifier, NotifierWeb.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :hound, driver: "phantomjs"

# Configure your database
config :notifier, Notifier.Repo,
  username: "appuser",
  password: "Neue.P455",
  database: "notifier_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
