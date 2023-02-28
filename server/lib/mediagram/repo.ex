defmodule Mediagram.Repo do
  use Ecto.Repo,
    otp_app: :mediagram,
    adapter: Ecto.Adapters.Postgres
end
