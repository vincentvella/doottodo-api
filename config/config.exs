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
  render_errors: [view: DootTodoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DootTodo.PubSub,
  live_view: [signing_salt: "R9pDsgA+"]

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

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.0.18",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :doot_todo, :env, Mix.env()

config :doot_todo, DootTodo.Guardian,
  issuer: "doot_todo",
  secret_key: System.get_env("SECRET_KEY"),
  ttl: {3, :days}

config :doot_todo, DootTodoWeb.AuthAccessPipeline,
  module: DootTodo.Guardian,
  error_handler: DootTodoWeb.AuthErrorHandler

config :waffle,
  # or Waffle.Storage.Local
  storage: Waffle.Storage.S3,
  # if using S3
  bucket: System.get_env("AWS_BUCKET_NAME")

# If using S3:
config :ex_aws,
  json_codec: Jason,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION")

config :doot_todo, DootTodo.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

config :kaffy,
  otp_app: :doot_todo,
  ecto_repo: DootTodo.Repo,
  router: DootTodoWeb.Router

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
