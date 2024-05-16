# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :swe_back,
  ecto_repos: [SweBack.Repo],
  generators: [timestamp_type: :utc_datetime, binary_id: true]

# Configures the endpoint
config :swe_back, SweBackWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [json: SweBackWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: SweBack.PubSub,
  live_view: [signing_salt: "D06U64VW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :swe_back, SweBack.Mailer.EmailService,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.ethereal.email",
  port: 587,
  username: "toy.bernier77@ethereal.email", # or {:system, "SMTP_USERNAME"}
  password: "SNxRfNuMhwUpUNpcZr", # or {:system, "SMTP_PASSWORD"}
  tls: :if_available, # can be `:always` or `:never`
  allowed_tls_versions: [:tlsv1, :"tlsv1.1", :"tlsv1.2"],
  # or {":system", ALLOWED_TLS_VERSIONS"} w/ comma separated values (e.g. "tlsv1.1,tlsv1.2")
  tls_log_level: :error,
  tls_depth: 3, # optional, tls certificate chain depth
  ssl: false, # can be `true`,
  retries: 1,
  no_mx_lookups: false, # can be `true`
  auth: :if_available # can be `:always`. If your smtp relay requires authentication set it to `:always`.


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
