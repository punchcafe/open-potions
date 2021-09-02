# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :open_potions,
  ecto_repos: [OpenPotions.Repo]

# Configures the endpoint
config :open_potions, OpenPotionsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3ZMW5DHNdfOdaO2XyyhPHRhKNDzUPTpL88sHSL4oe4rYE2wRgALu65zbzwFXD1If",
  render_errors: [view: OpenPotionsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: OpenPotions.PubSub,
  live_view: [signing_salt: "LBurEYQq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
