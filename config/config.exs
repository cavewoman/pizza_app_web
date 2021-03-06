# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pizza_app_web,
  ecto_repos: [PizzaAppWeb.Repo]

# Configures the endpoint
config :pizza_app_web, PizzaAppWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: PizzaAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PizzaAppWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
