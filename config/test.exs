import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :next_pay_exam, NextPayExam.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "next_pay_exam_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :next_pay_exam, NextPayExamWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Spet0hLSkx+Y8JntUlz1WG7pCdhFPir5ItZcvRZqVf48h33q6n9MYVWzqObJVxI2",
  server: false

# In test we don't send emails.
config :next_pay_exam, NextPayExam.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :next_pay_exam, NextPayExamWeb.Endpoint,
  http: [port: 4001],
  server: true

config :next_pay_exam,
  base_url: "http://localhost:4001"
