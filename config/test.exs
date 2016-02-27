use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pinster_phoenix, PinsterPhoenix.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :pinster_phoenix, PinsterPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "pinster_phoenix_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :hound, driver: "phantomjs"
