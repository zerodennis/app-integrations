## Prerequisites
- Install Elixir: https://elixir-lang.org/install.html
- Install Phoenix: https://hexdocs.pm/phoenix/installation.html
- Install Postgres
- Install Node and NPM
- You will need a user `postgres` with password `postgres`

## How to run:
- In the project root: `mix deps.get`
- In `/assets` run: `npm i`
- In the project root: `mix ecto.create` `mix ecto.migrate`
- Populate with seed data: `mix run priv/repo/seeds.exs`
- Run the server: `iex -S mix phx.server`
- Visit `localhost:4000` on your browser

## Tests

- For integration/e2e tests you will need to install `chromedriver`
- In project root: `mix test`
