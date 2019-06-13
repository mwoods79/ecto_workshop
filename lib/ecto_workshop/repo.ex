defmodule EctoWorkshop.Repo do
  use Ecto.Repo,
    otp_app: :ecto_workshop,
    adapter: Ecto.Adapters.Postgres
end
