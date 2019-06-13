# EctoWorkshop

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


## mac computer trouble shooting:
```bash
{
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew install node;
brew install elixir;
brew install postgres;
initdb /usr/local/var/postgres;
createdb;
psql -c "CREATE USER postgres SUPERUSER;";
}
```

## for linux users:
```bash
# https://elixir-lang.org/install.html#unix-and-unix-like
mix local.hex &&
mix archive.install hex phx_new 1.4.0
# https://hexdocs.pm/phoenix/installation.html
```
