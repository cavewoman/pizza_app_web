use Mix.Config

# We run a server during test for Wallaby integration testing.
config :pizza_app_web, PizzaAppWeb.Endpoint,
  http: [port: 4001],
  server: true,
  secret_key_base: "0123456789012345678901234567890123456789012345678901234567890123456789"

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :pizza_app_web, PizzaAppWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "pizza_app_web_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :pizza_app_web, :sql_sandbox, true
