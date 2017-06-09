# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :party_up,
  ecto_repos: [PartyUp.Repo]

# Configures the endpoint
config :party_up, PartyUp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1674gu+bguxUIDfddil36PEJ0NeWEluMmm81zCgUXUJ3Qx6vE1jgkGTNHOB3tpOW",
  render_errors: [view: PartyUp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PartyUp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Addict user management lib
config :addict,
  secret_key: "243262243132244b417831494c6178474c55363273385a694b65347665",
  extra_validation: fn ({valid, errors}, user_params) -> {valid, errors} end, # define extra validation here
  user_schema: PartyUp.User,
  repo: PartyUp.Repo,
  from_email: "no-reply@partyupapp.com", # CHANGE THIS
  generate_csrf_token: (fn -> Phoenix.Controller.get_csrf_token end),
mail_service: nil

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
if File.exists?("config/#{Mix.env}.secret.exs") do
  import_config "#{Mix.env}.secret.exs"
end
