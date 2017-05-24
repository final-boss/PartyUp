use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :party_up, PartyUp.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :party_up, PartyUp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "party_up_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :party_up, :sql_sandbox, true

import_config "test.secret.exs"
