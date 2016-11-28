use Mix.Config

config :collector, Collector.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ARa2U6GtIVuSW8RTvmUw8+vt6Dw5R85mXhtW5xzXkxgIEpiDxRvXY1+TB+zFXwpe",
  render_errors: [view: Collector.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Collector.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
