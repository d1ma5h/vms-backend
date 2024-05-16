defmodule SweBack.Repo do
  use Ecto.Repo,
    otp_app: :swe_back,
    adapter: Ecto.Adapters.Postgres
end
