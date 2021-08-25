import Config

config :livebook, LivebookWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 8080],
  server: true,
  pubsub_server: Livebook.PubSub,
  secret_key_base: Base.encode64(:crypto.strong_rand_bytes(48)),
  live_view: [signing_salt: "livebook"]

config :livebook,
  default_runtime: {Livebook.Runtime.Embedded, []},
  authentication_mode: :disabled,
  cookie: :livebook_sidecar,
  root_path: "./livebooks"

config :phoenix, :json_library, Jason
