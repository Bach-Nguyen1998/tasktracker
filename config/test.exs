use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tracker, TrackerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :tracker, Tracker.Repo,
  username: "tracker2",
  password: "fortracker2",
  database: "tracker2",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
