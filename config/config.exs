# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :doot_todo,
  ecto_repos: [DootTodo.Repo]

# Configures the endpoint
config :doot_todo, DootTodoWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: DootTodoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DootTodo.PubSub,
  live_view: [signing_salt: "ZWcciHxh"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :doot_todo, DootTodo.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth, providers: []

config :doot_todo, Oban,
  repo: DootTodo.Repo,
  queues: [default: 10, mailers: 20, events: 50, low: 5],
  plugins: [
    Oban.Plugins.Pruner,
    {Oban.Plugins.Cron,
     crontab: [
       {"0 8 * * *", DootTodo.Workers.ExampleWorker}
     ]}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
