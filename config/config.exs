# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :typepad,
  ecto_repos: [Typepad.Repo]

# Configures the endpoint
config :typepad, Typepad.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "b7njCiDGl/ZdwSCwsiR4qmPB7AkuWbevb46Na7CBHaLKvH5x9Fd1Jfp7GGg0XA6H",
  render_errors: [view: Typepad.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Typepad.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
