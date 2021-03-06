# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_blog,
  ecto_repos: [MyBlog.Repo]

# Configures the endpoint
config :my_blog, MyBlog.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "upH9dz8XthzfKvGj/KKhfImC6KWDhWnMePDbKdmG+KJe1l1xyDEM3vZh6bBTNGBg",
  render_errors: [view: MyBlog.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyBlog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
