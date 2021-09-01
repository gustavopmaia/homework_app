# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :homework_app,
  ecto_repos: [HomeworkApp.Repo]

# Configures the endpoint
config :homework_app, HomeworkAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+YsO5JU1sIh51jIXBiZd34Pk345l/IQ5eUEhvp13jY7LD22zVtAGguzZMhdlM6PY",
  render_errors: [view: HomeworkAppWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: HomeworkApp.PubSub,
  live_view: [signing_salt: "DvUVm42o"],
  generators: [binary_id: true]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
