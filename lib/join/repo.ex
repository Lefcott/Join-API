defmodule Join.Repo do
  use Ecto.Repo,
    otp_app: :join,
    adapter: Ecto.Adapters.Postgres
end
